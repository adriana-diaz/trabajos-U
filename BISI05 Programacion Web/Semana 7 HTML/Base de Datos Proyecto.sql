USE master
GO


IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'BDProyectoWeb')
DROP DATABASE BDProyectoWeb
GO

/** SE CREA LA BASE DE DATOS**/
CREATE DATABASE BDProyectoWeb
GO
/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE BDProyectoWeb
GO

/** INSTRUCCION QUE PERMITE CREAR LOS DIAGRAMAS**/
Alter authorization on database::BDProyectoWeb to sa 

/*Establece el formato de la fecha en dia/mes/año, 
cualquiera de las dos*/
SET DATEFORMAT dmy
SET LANGUAGE spanish
/*Instruccion que indica que la proxima consulta 
se ejecutará hasta que termine de ejecutarse la sentencia anterior*/
GO 
--tablas--

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    fecha_registro DATETIME DEFAULT GETDATE() NOT NULL,
);

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
);

-- Crear la tabla Productos sin la clave foránea inicialmente
CREATE TABLE Productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(MAX),
    precio DECIMAL(18, 2) NOT NULL,
    nombre_categoria NVARCHAR(100) NOT NULL, -- Cambiado para usar nombre en lugar de id_categoria
    fecha_agregado DATETIME DEFAULT GETDATE() NOT NULL
);

ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Categorias FOREIGN KEY (nombre_categoria)
REFERENCES Categorias (nombre);

CREATE TABLE Inventario (
    id_inventario INT PRIMARY KEY,
    id_producto INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Compras (
    id_compra INT PRIMARY KEY,
    id_usuario INT,
    fecha_compra  DATETIME DEFAULT GETDATE(),
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE DetalleCompra (
    id_detalle_compra INT PRIMARY KEY,
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

CREATE TABLE Sesiones(
    id BIGINT IDENTITY(1,1) PRIMARY KEY, 
    sesion NVARCHAR(MAX) NOT NULL,  
    usuario BIGINT NOT NULL,  
    origen NVARCHAR(MAX) NULL,  
    fecha_inicio DATETIME NOT NULL,  
    fecha_final DATETIME NULL,  
    estado INT NOT NULL,  
    fecha_actualizacion DATETIME NOT NULL,
);
GO

--STORED PROCEDURES
USE BDProyectoWeb
GO

CREATE PROCEDURE SP_INGRESAR_USUARIO
(
    @ID_USUARIO INT,
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
            INSERT INTO Usuarios (id_usuario, nombre, email, password, fecha_registro)
            VALUES (@ID_USUARIO, @NOMBRE, @EMAIL, @PASSWORD, GETDATE());

            -- Retornar el ID del nuevo usuario
            SET @IDRETURN = @ID_USUARIO;
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

CREATE PROCEDURE SP_ELIMINAR_USUARIO
(
    @ID_USUARIO INT,
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Verificar si el usuario existe
        IF EXISTS (SELECT 1 FROM Usuarios WHERE id_usuario = @ID_USUARIO)
        BEGIN
            -- Eliminar el usuario
            DELETE FROM Usuarios
            WHERE id_usuario = @ID_USUARIO;

            -- Retornar el ID del usuario eliminado
            SET @IDRETURN = @ID_USUARIO;
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
--NO TOCAR
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
    @ID_SESION BIGINT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Inicializar valores de salida
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';

        -- Verificar si la sesión existe
        IF EXISTS (SELECT * FROM Sesiones WHERE id = @ID_SESION)
        BEGIN
            -- Actualizar la sesión para marcarla como cerrada
            UPDATE Sesiones
            SET
                estado = 0,
                fecha_final = GETDATE(),
                fecha_actualizacion = GETDATE()
            WHERE id = @ID_SESION;

            -- No se requiere ID de retorno en este caso
        END
        ELSE
        BEGIN
            -- Sesión no encontrada
            SET @ERRORID = 1;
            SET @ERRORDESCRIPCION = 'ERROR DESDE BD: SESIÓN NO ENCONTRADA';
        END
    END TRY
    BEGIN CATCH
        -- Manejo de errores
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

USE BDProyectoWeb
GO
CREATE PROCEDURE SP_ACTUALIZAR_PRODUCTO
(
    @ID_PRODUCTO INT,
    @NOMBRE NVARCHAR(100),
    @DESCRIPCION NVARCHAR(MAX),
    @PRECIO DECIMAL(18, 2),
    @NOMBRE_CATEGORIA NVARCHAR(100),
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Inicializar valores de salida
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';

        -- Verificar si el producto existe
        IF EXISTS (SELECT 1 FROM Productos WHERE id_producto = @ID_PRODUCTO)
        BEGIN
            -- Verificar si la categoría es válida
            IF EXISTS (SELECT 1 FROM Categorias WHERE nombre = @NOMBRE_CATEGORIA)
            BEGIN
                -- Actualizar el producto
                UPDATE Productos
                SET 
                    nombre = @NOMBRE,
                    descripcion = @DESCRIPCION,
                    precio = @PRECIO,
                    nombre_categoria = @NOMBRE_CATEGORIA,
                    fecha_agregado = GETDATE() -- Puedes ajustar si no quieres actualizar esta fecha
                WHERE id_producto = @ID_PRODUCTO;
            END
            ELSE
            BEGIN
                -- Categoría no válida
                SET @ERRORID = 1;
                SET @ERRORDESCRIPCION = 'ERROR: Categoría no válida.';
            END
        END
        ELSE
        BEGIN
            -- Producto no encontrado
            SET @ERRORID = 2;
            SET @ERRORDESCRIPCION = 'ERROR: Producto no encontrado.';
        END
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO





--Pruebas
--Agregar usuario

DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);
EXEC SP_INGRESAR_USUARIO
    @ID_USUARIO = 119320150,          -- ID del usuario (debe ser único)
    @NOMBRE = 'adrianaa',
    @EMAIL = 'adri@gmail.com',
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
    @ID_USUARIO = 119320150,   -- ID del usuario a eliminar
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;
SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;

--------------------------------------------------
--INICIAR SESION
DECLARE @SESION_ID BIGINT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);
EXEC SP_LOGIN_USUARIO
    @EMAIL = 'adri@gmail.com',
    @PASSWORD = 'securepassword',
    @SESION_ID = @SESION_ID OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;
SELECT @SESION_ID AS SESION_ID, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;


-------------------------------------------------------------
--CERRAR SESION 
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_CERRAR_SESION
    @ID_SESION = 1, -- Reemplaza con el ID de sesión correspondiente
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

SELECT @ERRORID, @ERRORDESCRIPCION;

-------------------------------------------------------------------------------------
--AGREGAR PRODUCTO
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_AGREGAR_PRODUCTO 
    @NOMBRE = 'Café Colombiano', 
    @DESCRIPCION = 'Café de alta calidad de Colombia', 
    @PRECIO = 12.50, 
    @NOMBRE_CATEGORIA = 'Bebidas',
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
-- Variables para probar el procedimiento
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

-- Llamar al procedimiento almacenado para actualizar un producto
EXEC SP_ACTUALIZAR_PRODUCTO
    @ID_PRODUCTO = 2,
    @NOMBRE = 'cAFE ASFDESFGG',
    @DESCRIPCION = 'SDFGGSDGDG',
    @PRECIO = 19.99,
    @NOMBRE_CATEGORIA = 'Bebidas',  -- Asegúrate de que esta categoría exista
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

-- Mostrar los resultados de la ejecución
SELECT 
    @ERRORID AS ErrorID,
    @ERRORDESCRIPCION AS ErrorDescripcion;

------------------------------------insert-----------------------------------------
--Insertar una categoría de ejemplo
INSERT INTO Categorias (id_categoria, nombre, descripcion) 
VALUES (1, 'Bebidas', 'Todas las bebidas disponibles');
------------------------------------SELECTS-----------------------------------------
SELECT * FROM Sesiones;
SELECT * FROM Usuarios;
SELECT * FROM Productos;
