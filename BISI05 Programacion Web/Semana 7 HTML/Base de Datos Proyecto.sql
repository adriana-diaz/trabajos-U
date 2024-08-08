USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'BDProyectoWeb')
DROP DATABASE BDProyectoWeb
GO

/** SE CREA LA BASE DE DATOS **/
CREATE DATABASE BDProyectoWeb
GO

/** SE SELECCIONA LA BASE DE DATOS CREADA **/
USE BDProyectoWeb
GO

/** INSTRUCCIÓN QUE PERMITE CREAR LOS DIAGRAMAS **/
ALTER AUTHORIZATION ON DATABASE::BDProyectoWeb TO sa

/* Establece el formato de la fecha en día/mes/año, 
cualquiera de las dos */
SET DATEFORMAT dmy
SET LANGUAGE spanish
/* Instrucción que indica que la próxima consulta 
se ejecutará hasta que termine de ejecutarse la sentencia anterior */
GO

-- Tablas --

-- Tabla Categorias sin la columna id_producto
CREATE TABLE Categorias (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL UNIQUE,
    descripcion NVARCHAR(100) NOT NULL
);

-- Tabla Productos con la columna id_categoria para la asignación directa
CREATE TABLE Productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(MAX),
    precio DECIMAL(18, 2) NOT NULL,
    fecha_agregado DATETIME DEFAULT GETDATE() NOT NULL,
	nombre_categoria NVARCHAR(100),
     FOREIGN KEY (nombre_categoria) REFERENCES Categorias(nombre)
);

-- Las demás tablas permanecen igual
CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    cedula INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    fecha_registro DATETIME DEFAULT GETDATE() NOT NULL
);

CREATE TABLE Inventario (
    id_inventario INT IDENTITY(1,1) PRIMARY KEY,
    id_producto INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Compras (
    id_compra INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT,
    fecha_compra DATETIME DEFAULT GETDATE(),
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE DetalleCompra (
    id_detalle_compra INT IDENTITY(1,1) PRIMARY KEY,
    id_compra INT,
    id_producto INT,
    id_usuario INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Sesiones (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    sesion NVARCHAR(MAX) NOT NULL,
    usuario INT NOT NULL, -- Cambiado de BIGINT a INT para que coincida con id_usuario
    origen NVARCHAR(MAX) NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_final DATETIME NULL,
    estado INT NOT NULL,
    fecha_actualizacion DATETIME NOT NULL,
    FOREIGN KEY (usuario) REFERENCES Usuarios(id_usuario) -- Corregido para usar el nombre correcto de la columna
);
GO




--STORED PROCEDURES
USE BDProyectoWeb
GO
CREATE PROCEDURE SP_INGRESAR_USUARIO
(
    @CEDULA INT,
    @NOMBRE NVARCHAR(100),
    @EMAIL NVARCHAR(100),
    @PASSWORD VARCHAR(255),
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Verificar si el correo electrónico ya está registrado
        IF EXISTS (SELECT 1 FROM Usuarios WHERE email = @EMAIL)
        BEGIN
            SET @IDRETURN = -1;
            SET @ERRORID = 1; -- Correo ya registrado
            SET @ERRORDESCRIPCION = 'ERROR DESDE BD: CORREO YA REGISTRADO';
        END
        ELSE
        BEGIN
            -- Insertar un nuevo usuario
            INSERT INTO Usuarios (cedula, nombre, email, password, fecha_registro)
            VALUES (@CEDULA, @NOMBRE, @EMAIL, @PASSWORD, GETDATE());

            -- Retornar la cédula del nuevo usuario
            SET @IDRETURN = @CEDULA;
        END
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO

--NO TOCAR FINAL
USE BDProyectoWeb
GO
CREATE PROCEDURE SP_ELIMINAR_USUARIO
(
    @CEDULA INT,
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Verificar si el usuario existe
        IF EXISTS (SELECT 1 FROM Usuarios WHERE cedula = @CEDULA)
        BEGIN
            -- Eliminar el usuario
            DELETE FROM Usuarios
            WHERE cedula = @CEDULA;

            -- Retornar la cédula del usuario eliminado
            SET @IDRETURN = @CEDULA;
        END
        ELSE
        BEGIN
            -- Usuario no encontrado
            SET @IDRETURN = -1;
            SET @ERRORID = 2; -- Usuario no encontrado
            SET @ERRORDESCRIPCION = 'ERROR DESDE BD: USUARIO NO ENCONTRADO';
        END
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO

--NO TOCAR FINAL
USE BDProyectoWeb
GO
CREATE PROCEDURE SP_ACTUALIZAR_USUARIO
(
    @CEDULA INT,
    @NOMBRE NVARCHAR(100),
    @EMAIL NVARCHAR(100),
    @PASSWORD VARCHAR(255),
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Verificar si el usuario existe
        IF EXISTS (SELECT 1 FROM Usuarios WHERE cedula = @CEDULA)
        BEGIN
            -- Actualizar los datos del usuario
            UPDATE Usuarios
            SET nombre = @NOMBRE,
                email = @EMAIL,
                password = @PASSWORD
            WHERE cedula = @CEDULA;

            -- Retornar la cédula del usuario actualizado
            SET @IDRETURN = @CEDULA;
        END
        ELSE
        BEGIN
            -- Usuario no encontrado
            SET @IDRETURN = -1;
            SET @ERRORID = 2; -- Usuario no encontrado
            SET @ERRORDESCRIPCION = 'ERROR DESDE BD: USUARIO NO ENCONTRADO';
        END
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
--NO TOCAR FINAL
---------------------------------------------------------------------------------------
USE BDProyectoWeb
GO

CREATE PROCEDURE SP_LOGIN_USUARIO
(
    @EMAIL NVARCHAR(100),
    @PASSWORD VARCHAR(255),
    @SESION_ID BIGINT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Inicializar valores de salida
        SET @SESION_ID = 0;
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';

        -- Verificar si las credenciales son válidas
        IF EXISTS (
            SELECT 1
            FROM Usuarios
            WHERE email = @EMAIL AND password = @PASSWORD
        )
        BEGIN
            -- Insertar una nueva sesión
            INSERT INTO Sesiones 
                (sesion, usuario, origen, fecha_inicio, estado, fecha_actualizacion)
            VALUES 
                (NEWID(), (SELECT id_usuario FROM Usuarios WHERE email = @EMAIL), 'Web', GETDATE(), 1, GETDATE());

            -- Obtener el ID de la nueva sesión
            SET @SESION_ID = SCOPE_IDENTITY();
        END
        ELSE
        BEGIN
            -- Credenciales inválidas
            SET @SESION_ID = -1;
            SET @ERRORID = 1;
            SET @ERRORDESCRIPCION = 'ERROR DESDE BD: CREDENCIALES INVÁLIDAS';
        END
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @SESION_ID = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
--NO TOCAR

USE BDProyectoWeb
GO

CREATE PROCEDURE SP_CERRAR_SESION
(
    @SESION_ID BIGINT,           -- Identificador de la sesión activa
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Verificar si la sesión existe y está activa
        IF EXISTS (SELECT 1 FROM Sesiones WHERE id = @SESION_ID AND fecha_final IS NULL)
        BEGIN
            -- Actualizar la fecha final de la sesión para marcarla como cerrada
            UPDATE Sesiones
            SET fecha_final = GETDATE(),
                estado = 0,  -- Asumiendo que 0 indica una sesión cerrada
                fecha_actualizacion = GETDATE()
            WHERE id = @SESION_ID;

            -- Retornar el ID de la sesión cerrada
            SET @IDRETURN = @SESION_ID;
        END
        ELSE
        BEGIN
            -- Sesión no encontrada o ya cerrada
            SET @IDRETURN = -1;
            SET @ERRORID = 2; -- Sesión no encontrada o ya cerrada
            SET @ERRORDESCRIPCION = 'ERROR DESDE BD: SESIÓN NO ENCONTRADA O YA CERRADA';
        END
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
--NO TOCAR

USE BDProyectoWeb
GO
CREATE PROCEDURE SP_AGREGAR_PRODUCTO
(
    @NOMBRE NVARCHAR(100),
    @DESCRIPCION NVARCHAR(MAX),
    @PRECIO DECIMAL(18, 2),
    @NOMBRE_CATEGORIA NVARCHAR(100),
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Inicializar valores de salida
        SET @IDRETURN = 0;
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';

        -- Verificar si la categoría es válida
        IF EXISTS (SELECT 1 FROM Categorias WHERE nombre = @NOMBRE_CATEGORIA)
        BEGIN
            -- Insertar el nuevo producto
            INSERT INTO Productos (nombre, descripcion, precio, nombre_categoria, fecha_agregado)
            VALUES (@NOMBRE, @DESCRIPCION, @PRECIO, @NOMBRE_CATEGORIA, GETDATE());

            -- Obtener el ID del nuevo producto
            SET @IDRETURN = SCOPE_IDENTITY();
        END
        ELSE
        BEGIN
            -- Categoría no válida
            SET @IDRETURN = -1;
            SET @ERRORID = 1;
            SET @ERRORDESCRIPCION = 'ERROR: Categoría no válida.';
        END
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
--NO TOCAR

USE BDProyectoWeb
GO
CREATE PROCEDURE SP_ELIMINAR_PRODUCTO
(
    @ID_PRODUCTO INT,
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Inicializar valores de salida
        SET @IDRETURN = 0;
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';

        -- Verificar si el producto existe
        IF EXISTS (SELECT 1 FROM Productos WHERE id_producto = @ID_PRODUCTO)
        BEGIN
            -- Eliminar el producto
            DELETE FROM Productos WHERE id_producto = @ID_PRODUCTO;

            -- Devolver el ID del producto eliminado
            SET @IDRETURN = @ID_PRODUCTO;
        END
        ELSE
        BEGIN
            -- Producto no encontrado
            SET @IDRETURN = -1;
            SET @ERRORID = 1;
            SET @ERRORDESCRIPCION = 'ERROR: Producto no encontrado.';
        END
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
--NO TOCAR
USE BDProyectoWeb
GO
CREATE PROCEDURE SP_ACTUALIZAR_PRODUCTO
(
    @NOMBRE NVARCHAR(100),
    @DESCRIPCION NVARCHAR(MAX),
    @PRECIO DECIMAL(18, 2),
    @NOMBRE_CATEGORIA NVARCHAR(100),
    @RESULTADO NVARCHAR(100) OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Inicializar valores de salida
        SET @RESULTADO = 'Éxito';
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';
 
        -- Verificar si la categoría es válida
        IF EXISTS (SELECT 1 FROM Categorias WHERE nombre = @NOMBRE_CATEGORIA)
        BEGIN
            -- Verificar si el producto existe
            IF EXISTS (SELECT 1 FROM Productos WHERE nombre = @NOMBRE)
            BEGIN
                -- Actualizar el producto
                UPDATE Productos
                SET descripcion = @DESCRIPCION,
                    precio = @PRECIO,
                    nombre_categoria = @NOMBRE_CATEGORIA
                WHERE nombre = @NOMBRE;
 
                -- Confirmar la actualización
                SET @RESULTADO = 'Producto actualizado exitosamente.';
            END
            ELSE
            BEGIN
                -- Producto no encontrado
                SET @RESULTADO = 'Error';
                SET @ERRORID = 2;
                SET @ERRORDESCRIPCION = 'ERROR: Producto no encontrado.';
            END
        END
        ELSE
        BEGIN
            -- Categoría no válida
            SET @RESULTADO = 'Error';
            SET @ERRORID = 1;
            SET @ERRORDESCRIPCION = 'ERROR: Categoría no válida.';
        END
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @RESULTADO = 'Error';
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO

USE BDProyectoWeb
GO
CREATE PROCEDURE SP_INSERTAR_CATEGORIA
(
    @NOMBRE NVARCHAR(100),
    @DESCRIPCION NVARCHAR(100),
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Categorias (nombre, descripcion)
        VALUES (@NOMBRE, @DESCRIPCION);
        SET @IDRETURN = SCOPE_IDENTITY();
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = 'Inserción exitosa';
    END TRY
    BEGIN CATCH
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO

USE BDProyectoWeb
GO
CREATE PROCEDURE ActualizarCategoria
    @NOMBRE NVARCHAR(100),            -- Nombre de la categoría que se va a actualizar
    @NUEVO_NOMBRE NVARCHAR(100),      -- Nuevo nombre de la categoría
    @NUEVA_DESCRIPCION NVARCHAR(100), -- Nueva descripción de la categoría
    @IDRETURN INT OUTPUT,             -- Salida del resultado del procedimiento
    @ERRORID INT OUTPUT,              -- Salida del código de error
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT -- Salida de la descripción del error
AS
BEGIN
    BEGIN TRY
        -- Actualizar la categoría con el nuevo nombre y descripción
        UPDATE Categorias
        SET nombre = @NUEVO_NOMBRE,
            descripcion = @NUEVA_DESCRIPCION
        WHERE nombre = @NOMBRE;
        
        -- Verificar si la actualización fue exitosa
        IF @@ROWCOUNT = 0
        BEGIN
            SET @IDRETURN = 0;
            SET @ERRORID = 1;
            SET @ERRORDESCRIPCION = 'Categoría no encontrada o no actualizada';
        END
        ELSE
        BEGIN
            SET @IDRETURN = 1;
            SET @ERRORID = 0;
            SET @ERRORDESCRIPCION = 'Actualización exitosa';
        END
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @IDRETURN = 0;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END;



--NO TOCAR
--Pruebas
--Agregar usuario

DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_INGRESAR_USUARIO
    @CEDULA = 559595955,          -- Cédula del usuario (debe ser única)
    @NOMBRE = 'daniel',
    @EMAIL = 'dani@gmail.com',
    @PASSWORD = 'securepassword',
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;


------------------------------------------------------
--ELIMINAR USUARIO
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);
EXEC SP_ELIMINAR_USUARIO
    @CEDULA = 559595955,   
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;
SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;

--------------------------------------------------
--Actualizar Usuario
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);
EXEC SP_ACTUALIZAR_USUARIO
    @CEDULA = 11111111,          -- Cédula del usuario
    @NOMBRE = 'daniel',
    @EMAIL = 'dani@gmail.com',
    @PASSWORD = 'newsecurepassword',
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;
SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;
-------------------------------------------------------------------------------------------
--INICIAR SESION
DECLARE @SESION_ID BIGINT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);
EXEC SP_LOGIN_USUARIO
    @EMAIL = 'adriupdated@gmail.com',
    @PASSWORD = 'newsecurepassword',
    @SESION_ID = @SESION_ID OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;
SELECT @SESION_ID AS SESION_ID, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;


-------------------------------------------------------------
--CERRAR SESION // debria de ser por usuario
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_CERRAR_SESION
    @SESION_ID = 9,          -- ID de la sesión que se desea cerrar
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;
-------------------------------------------------------------------------------------
--AGREGAR PRODUCTO
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_AGREGAR_PRODUCTO 
    @NOMBRE = 'Capucchino', 
    @DESCRIPCION = 'de alta calidad de Argentina', 
    @PRECIO = 6.66, 
    @NOMBRE_CATEGORIA = 'Bebidas Postman',
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

SELECT @IDRETURN AS ID, @ERRORID AS ErrorID, @ERRORDESCRIPCION AS ErrorDescripcion;
---------------------------------------------------------------------------------------
--eliminar PRODUCTO
DECLARE @IDRETURN_ELIMINAR INT;
DECLARE @ERRORID_ELIMINAR INT;
DECLARE @ERRORDESCRIPCION_ELIMINAR NVARCHAR(MAX);

-- Reemplaza 1 con el ID del producto que deseas eliminar
EXEC SP_ELIMINAR_PRODUCTO 
    @ID_PRODUCTO = 1,
    @IDRETURN = @IDRETURN_ELIMINAR OUTPUT,
    @ERRORID = @ERRORID_ELIMINAR OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION_ELIMINAR OUTPUT;

SELECT @IDRETURN_ELIMINAR AS ID, @ERRORID_ELIMINAR AS ErrorID, @ERRORDESCRIPCION_ELIMINAR AS ErrorDescripcion;
-------------------------------------------------------------------------------------------------
--ACTUALIZAR PRODUCTO
-- Declarar variables de salida
DECLARE @RESULTADO NVARCHAR(100);
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);
 
-- Ejecutar el procedimiento almacenado
EXEC SP_ACTUALIZAR_PRODUCTO
    @NOMBRE = 'Expresso',
    @DESCRIPCION = 'cafe mucho RAM ',
    @PRECIO = 1200.00,
    @NOMBRE_CATEGORIA = 'Bebidas',
    @RESULTADO = @RESULTADO OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;
 
-- Verificar los valores de salida
SELECT @RESULTADO AS Resultado, @ERRORID AS ErrorID, @ERRORDESCRIPCION AS ErrorDescripcion;
	------------------------------------------------------------------------------
--Actualizar Categoria
DECLARE @IDRETURN INT, @ERRORID INT, @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC ActualizarCategoria
    @NOMBRE = 'Bebidas',
    @NUEVO_NOMBRE = 'Bebidas Premium',
    @NUEVA_DESCRIPCION = 'Bebidas de alta gama',
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

-- Verificar el resultado
SELECT @IDRETURN, @ERRORID, @ERRORDESCRIPCION;

------------------------------------insert-----------------------------------------
--Insertar una categoría de ejemplo
INSERT INTO Categorias (nombre, descripcion) 
VALUES ('Bebidas', 'Todas las bebidas disponibles');

DECLARE @IDRETURN INT, @ERRORID INT, @ERRORDESCRIPCION NVARCHAR(MAX);
EXEC SP_INSERTAR_CATEGORIA 'Maquinas', 'Descripción de la categoría', @IDRETURN OUTPUT, @ERRORID OUTPUT, @ERRORDESCRIPCION OUTPUT;
SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;
GO
------------------------------------SELECTS-----------------------------------------
SELECT * FROM Sesiones;
SELECT * FROM Usuarios;
SELECT * FROM Productos;
SELECT * FROM Categorias;

