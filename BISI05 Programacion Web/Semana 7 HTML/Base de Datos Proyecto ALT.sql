USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'ProyectoDB')
DROP DATABASE ProyectoDB
GO

CREATE DATABASE ProyectoDB
GO

USE ProyectoDB
GO
ALTER AUTHORIZATION ON DATABASE::ProyectoDB TO sa
SET DATEFORMAT dmy
SET LANGUAGE spanish

GO
-- Tablas --

CREATE TABLE Categorias (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL UNIQUE,
    descripcion NVARCHAR(100) NOT NULL
);

CREATE TABLE Productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
	id_categoria INT,
    nombre NVARCHAR(100) NOT NULL UNIQUE,
    descripcion NVARCHAR(MAX),
    precio_producto DECIMAL(18, 2) NOT NULL,
    fecha_agregado DATETIME DEFAULT GETDATE() NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    cedula NVARCHAR(20) NOT NULL UNIQUE,
    nombre NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    fecha_registro DATETIME DEFAULT GETDATE() NOT NULL
);

CREATE TABLE Sesiones (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    sesion NVARCHAR(MAX) NOT NULL,
    usuario INT NOT NULL, 
    origen NVARCHAR(MAX) NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_final DATETIME NULL,
    estado INT NOT NULL,
    fecha_actualizacion DATETIME NOT NULL,
    FOREIGN KEY (usuario) REFERENCES Usuarios(id_usuario) 
);

CREATE TABLE Carrito (
    id_carrito INT IDENTITY(1,1) PRIMARY KEY,
	cantidad INT not null,
	--
	id_usuario INT NOT NULL,
	id_producto INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);


CREATE TABLE Tarjetas (
    id_tarjeta INT IDENTITY(1,1) PRIMARY KEY,
    numero_tarjeta NVARCHAR(16) NOT NULL UNIQUE, 
    fecha_expiracion datetime NOT NULL,
	CVV NVARCHAR(5) NOT NULL UNIQUE,
	id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
);

CREATE TABLE Factura (
   id_factura INT IDENTITY(1,1) PRIMARY KEY, 
   fecha DATETIME DEFAULT GETDATE() NOT NULL,
   --
   --solamente trae info del usuario
   id_usuario INT NOT NULL,
   --
   FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
);

CREATE TABLE DetalleFactura (
   id_detalleFactura INT IDENTITY(1,1) PRIMARY KEY,
   --
   id_tarjeta INT,
   id_factura INT, 
   id_producto INT NOT NULL,
   id_carrito INT NOT NULL,
   FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
   FOREIGN KEY (id_carrito) REFERENCES Carrito(id_carrito),
   FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
   FOREIGN KEY (id_tarjeta) REFERENCES Tarjetas(id_tarjeta)
);


--STORED PROCEDURES
USE ProyectoDB
GO
CREATE PROCEDURE SP_INGRESAR_USUARIO
(
    @CEDULA NVARCHAR(20),
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

CREATE PROCEDURE SP_ELIMINAR_USUARIO
(
    @CEDULA NVARCHAR(20),
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

CREATE PROCEDURE SP_ACTUALIZAR_USUARIO
(
    @CEDULA NVARCHAR(20),
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


CREATE PROCEDURE SP_LOGIN_USUARIO
(
    @EMAIL NVARCHAR(100),
    @PASSWORD VARCHAR(255),
    @SESION_ID BIGINT OUTPUT,
    @ID_USUARIO INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Inicializar valores de salida
        SET @SESION_ID = 0;
        SET @ID_USUARIO = 0;
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';

        -- Verificar si las credenciales son válidas
        IF EXISTS (
            SELECT 1
            FROM Usuarios
            WHERE email = @EMAIL AND password = @PASSWORD
        )
        BEGIN
            -- Obtener el ID del usuario
            SET @ID_USUARIO = (SELECT id_usuario FROM Usuarios WHERE email = @EMAIL);

            -- Insertar una nueva sesión
            INSERT INTO Sesiones 
                (sesion, usuario, origen, fecha_inicio, estado, fecha_actualizacion)
            VALUES 
                (NEWID(), @ID_USUARIO, 'Web', GETDATE(), 1, GETDATE());

            -- Obtener el ID de la nueva sesión
            SET @SESION_ID = SCOPE_IDENTITY();
        END
        ELSE
        BEGIN
            -- Credenciales inválidas
            SET @SESION_ID = -1;
            SET @ID_USUARIO = 0;
            SET @ERRORID = 1;
            SET @ERRORDESCRIPCION = 'ERROR DESDE BD: CREDENCIALES INVÁLIDAS';
        END
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @SESION_ID = -1;
        SET @ID_USUARIO = 0;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
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

CREATE PROCEDURE SP_AGREGAR_PRODUCTO
(
    @nombre_categoria NVARCHAR(100),
    @nombre NVARCHAR(100),
    @descripcion NVARCHAR(MAX),
    @precio_producto DECIMAL(18, 2), 
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Verificar si la categoría existe y obtener el ID
        DECLARE @id_categoria INT;

        SELECT @id_categoria = id_categoria
        FROM Categorias
        WHERE nombre = @nombre_categoria;

        IF @id_categoria IS NOT NULL
        BEGIN
            -- Insertar el nuevo producto
            INSERT INTO Productos 
            (
                id_categoria,
                nombre,
                descripcion,
                precio_producto
            )
            VALUES
            (
                @id_categoria,
                @nombre,
                @descripcion,
                @precio_producto
            );

            -- Devolver el ID del nuevo producto
            SET @IDRETURN = SCOPE_IDENTITY();
            SET @ERRORID = 0;
            SET @ERRORDESCRIPCION = '';
        END
        ELSE
        BEGIN
            -- La categoría no existe, devolver error
            SET @IDRETURN = -1;
            SET @ERRORID = 1; -- Categoría no existe
            SET @ERRORDESCRIPCION = 'Categoría especificada no existe.';
        END
    END TRY
    BEGIN CATCH
        -- Capturar errores y devolver información sobre el error
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO

CREATE PROCEDURE SP_ELIMINAR_PRODUCTO
(
    @nombre NVARCHAR(100),
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Verificar si el producto existe
        IF EXISTS (SELECT * FROM Productos WHERE nombre = @nombre)
        BEGIN
            -- Eliminar el producto
            DELETE FROM Productos
            WHERE nombre = @nombre;

            -- Devolver el ID del producto eliminado (si es necesario, si no se puede omitir)
            -- Aquí puedes usar un SELECT para obtener el ID del producto eliminado si es necesario
            SET @IDRETURN = 0; -- Indica éxito
            SET @ERRORID = 0;
            SET @ERRORDESCRIPCION = 'Producto eliminado exitosamente.';
        END
        ELSE
        BEGIN
            -- El producto no existe, devolver error
            SET @IDRETURN = -1;
            SET @ERRORID = 1; -- Producto no existe
            SET @ERRORDESCRIPCION = 'El producto especificado no existe.';
        END
    END TRY
    BEGIN CATCH
        -- Capturar errores y devolver información sobre el error
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO

CREATE PROCEDURE SP_ACTUALIZAR_PRODUCTO
(
    @nombre_actual NVARCHAR(100),  -- Nombre actual del producto a actualizar
    @nuevo_nombre NVARCHAR(100),   -- Nuevo nombre del producto
    @descripcion NVARCHAR(MAX),    -- Nueva descripción del producto
    @precio_producto DECIMAL(18, 2), -- Nuevo precio del producto
    @nombre_categoria NVARCHAR(100), -- Nuevo nombre de la categoría
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        -- Obtener el id_categoria basado en el nombre de la categoría
        DECLARE @id_categoria INT;

        SELECT @id_categoria = id_categoria
        FROM Categorias
        WHERE nombre = @nombre_categoria;

        IF @id_categoria IS NULL
        BEGIN
            -- La categoría no existe, devolver error
            SET @IDRETURN = -1;
            SET @ERRORID = 1; -- Categoría no existe
            SET @ERRORDESCRIPCION = 'Categoría especificada no existe.';
            RETURN;
        END

        -- Verificar si el producto existe
        IF EXISTS (SELECT * FROM Productos WHERE nombre = @nombre_actual)
        BEGIN
            -- Actualizar el producto
            UPDATE Productos
            SET
                nombre = @nuevo_nombre,
                descripcion = @descripcion,
                precio_producto = @precio_producto,
                id_categoria = @id_categoria
            WHERE nombre = @nombre_actual;

            -- Devolver éxito
            SET @IDRETURN = 0;
            SET @ERRORID = 0;
            SET @ERRORDESCRIPCION = 'Producto actualizado exitosamente.';
        END
        ELSE
        BEGIN
            -- El producto no existe, devolver error
            SET @IDRETURN = -1;
            SET @ERRORID = 2; -- Producto no existe
            SET @ERRORDESCRIPCION = 'El producto especificado no existe.';
        END
    END TRY
    BEGIN CATCH
        -- Capturar errores y devolver información sobre el error
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO


CREATE PROCEDURE SP_CONSULTAR_TODOS_PRODUCTOS
AS
BEGIN
    BEGIN TRY
        -- Seleccionar todos los productos
        SELECT
            p.id_producto,
            c.nombre AS categoria_nombre,
            p.nombre AS producto_nombre,
            p.descripcion,
            p.precio_producto,
            p.fecha_agregado
        FROM Productos p
        INNER JOIN Categorias c ON p.id_categoria = c.id_categoria;
        
    END TRY
    BEGIN CATCH
        -- Capturar errores
        SELECT
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
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
GO

CREATE PROCEDURE SP_ELIMINAR_CATEGORIA
(
    @NOMBRE NVARCHAR(100),         -- Nombre de la categoría que se va a eliminar
    @IDRETURN INT OUTPUT,          -- Salida del resultado del procedimiento
    @ERRORID INT OUTPUT,           -- Salida del código de error
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT -- Salida de la descripción del error
)
AS
BEGIN
    BEGIN TRY
        -- Verificar si la categoría existe
        IF EXISTS (SELECT 1 FROM Categorias WHERE nombre = @NOMBRE)
        BEGIN
            -- Eliminar la categoría
            DELETE FROM Categorias
            WHERE nombre = @NOMBRE;

            -- Retornar un valor de éxito
            SET @IDRETURN = 1;
            SET @ERRORID = 0;
            SET @ERRORDESCRIPCION = 'Eliminación exitosa';
        END
        ELSE
        BEGIN
            -- Categoría no encontrada
            SET @IDRETURN = -1;
            SET @ERRORID = 2; -- Categoría no encontrada
            SET @ERRORDESCRIPCION = 'ERROR DESDE BD: CATEGORÍA NO ENCONTRADA';
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


SELECT 
    C.id_carrito,
	C.cantidad,
    U.id_usuario,
    U.nombre AS nombre_usuario,
    P.id_producto,
    P.nombre AS nombre_producto,
    P.descripcion AS descripcion_producto,
    P.precio_producto,
    C.id_usuario,
    C.id_producto
FROM 
    Carrito C
inner JOIN 
    Usuarios U ON C.id_usuario = U.id_usuario
inner JOIN 
    Productos P ON C.id_producto = P.id_producto;
GO

CREATE PROCEDURE SP_Ingresar_carrito
    @id_usuario INT,
    @nombre_producto NVARCHAR(100),
	@cantidad INT,
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        -- Declarar variable para almacenar el id_producto
        DECLARE @id_producto INT;

        -- Buscar el id_producto basado en el nombre del producto
        SELECT @id_producto = id_producto 
        FROM Productos 
        WHERE nombre = @nombre_producto;

        -- Verificar si el producto existe
        IF @id_producto IS NULL
        BEGIN
            SET @IDRETURN = -1;
            SET @ERRORID = 1; -- Producto no encontrado
            SET @ERRORDESCRIPCION = 'El producto especificado no existe';
            RETURN;
        END

        -- Insertar el producto en el carrito
        INSERT INTO Carrito (id_usuario, id_producto, cantidad)
        VALUES (@id_usuario, @id_producto,@cantidad);

        -- Devolver el ID del carrito recién insertado
        SET @IDRETURN = SCOPE_IDENTITY();
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END;
GO


CREATE PROCEDURE SP_INGRESAR_TARJETA
(
    @numero_tarjeta NVARCHAR(16),
    @fecha_expiracion NVARCHAR(MAX), 
    @CVV NVARCHAR(5),
    @id_usuario INT,
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        DECLARE @existe_usuario INT;
        SELECT @existe_usuario = COUNT(*)
        FROM Usuarios
        WHERE id_usuario = @id_usuario;
 
        IF @existe_usuario > 0
        BEGIN
            INSERT INTO Tarjetas (numero_tarjeta,fecha_expiracion,CVV,id_usuario)
            VALUES(@numero_tarjeta,@fecha_expiracion,@CVV,@id_usuario);
 
            SET @IDRETURN = SCOPE_IDENTITY();
            SET @ERRORID = 0;
            SET @ERRORDESCRIPCION = '';
        END
        ELSE
        BEGIN
            SET @IDRETURN = -1;
            SET @ERRORID = 1; 
            SET @ERRORDESCRIPCION = 'Usuario especificado no existe.';
        END
    END TRY
    BEGIN CATCH
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO

 
CREATE PROCEDURE SP_ELIMINAR_TARJETA_POR_NUMERO
(
    @numero_tarjeta NVARCHAR(16),
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        DECLARE @existe_tarjeta INT;
        SELECT @existe_tarjeta = COUNT(*) FROM Tarjetas WHERE numero_tarjeta = @numero_tarjeta;
 
        IF @existe_tarjeta > 0
        BEGIN DELETE FROM Tarjetas WHERE numero_tarjeta = @numero_tarjeta;
            SET @ERRORID = 0;
            SET @ERRORDESCRIPCION = '';
        END
        ELSE
        BEGIN
            SET @ERRORID = 1; -- Tarjeta no existe
            SET @ERRORDESCRIPCION = 'Tarjeta especificada no existe.';
        END
    END TRY
    BEGIN CATCH
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO

CREATE PROCEDURE SP_ACTUALIZAR_TARJETA_POR_NUMERO
(
    @numero_tarjeta NVARCHAR(16),
    @nuevo_numero_tarjeta NVARCHAR(16) = NULL,
    @nueva_fecha_expiracion NVARCHAR(10) = NULL,  
    @nuevo_CVV NVARCHAR(5) = NULL,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        DECLARE @existe_tarjeta INT;
		SELECT @existe_tarjeta = COUNT(*) FROM Tarjetas WHERE numero_tarjeta = @numero_tarjeta;
 
        IF @existe_tarjeta > 0
        BEGIN
            UPDATE Tarjetas
            SET 
                numero_tarjeta = COALESCE(@nuevo_numero_tarjeta, numero_tarjeta),
                fecha_expiracion = COALESCE(@nueva_fecha_expiracion, fecha_expiracion),
                CVV = COALESCE(@nuevo_CVV, CVV)
            WHERE numero_tarjeta = @numero_tarjeta;
 
            SET @ERRORID = 0;
            SET @ERRORDESCRIPCION = '';
        END
        ELSE
        BEGIN
            SET @ERRORID = 1; -- Tarjeta no existe
            SET @ERRORDESCRIPCION = 'Tarjeta especificada no existe.';
        END
    END TRY
    BEGIN CATCH
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO


CREATE PROCEDURE SP_GENERAR_FACTURA(
    @id_usuario INT,
    @id_tarjeta INT
)
AS
BEGIN
    DECLARE @id_factura INT;
    DECLARE @monto_total DECIMAL(18, 2) = 0;
 
    -- Verificar si la tarjeta pertenece al usuario
    IF NOT EXISTS (
        SELECT 1 
        FROM Tarjetas 
        WHERE id_tarjeta = @id_tarjeta 
        AND id_usuario = @id_usuario
    )
    BEGIN
        RAISERROR('La tarjeta proporcionada no pertenece al usuario.', 16, 1);
        RETURN;
    END
 
    -- Verificar si ya existe una factura para este usuario
    SELECT @id_factura = id_factura 
    FROM Factura 
    WHERE id_usuario = @id_usuario;
 
    -- Si no existe, crear una nueva factura
    IF (@id_factura IS NULL)
    BEGIN
        INSERT INTO Factura (id_usuario)
        VALUES (@id_usuario);
 
        SET @id_factura = SCOPE_IDENTITY();
    END
 
    -- Calcular el monto total de los productos en el carrito del usuario
    SELECT @monto_total = SUM(p.precio_producto * c.cantidad)
    FROM Carrito c
    JOIN Productos p ON c.id_producto = p.id_producto
    WHERE c.id_usuario = @id_usuario;
 
    -- Insertar los detalles de la factura en DetalleFactura
    INSERT INTO DetalleFactura (id_tarjeta, id_factura, id_producto, id_carrito)
    SELECT @id_tarjeta, @id_factura, c.id_producto, c.id_carrito
    FROM Carrito c
    WHERE c.id_usuario = @id_usuario;
 
    -- Seleccionar toda la información relevante de la factura y sus detalles
    SELECT 
        f.id_factura,
        f.fecha,
        u.nombre AS nombre_usuario,
        u.cedula,
        p.nombre AS nombre_producto,
        p.precio_producto,
        c.cantidad,
        (p.precio_producto * c.cantidad) AS subtotal,
        @monto_total AS monto_total
    FROM 
        Factura f
    JOIN 
        Usuarios u ON f.id_usuario = u.id_usuario
    JOIN 
        DetalleFactura df ON f.id_factura = df.id_factura
    JOIN 
        Productos p ON df.id_producto = p.id_producto
    JOIN 
        Carrito c ON df.id_carrito = c.id_carrito
    WHERE 
        f.id_factura = @id_factura;
END;
GO


CREATE PROCEDURE SP_Eliminar_Producto_Carrito
    @id_carrito INT,
    @id_usuario INT,
    @IDRETURN INT OUTPUT,
    @ERRORID INT OUTPUT,
    @ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        -- Verificar si el carrito con el id proporcionado existe y pertenece al usuario
        IF NOT EXISTS (
            SELECT 1 
            FROM Carrito 
            WHERE id_carrito = @id_carrito AND id_usuario = @id_usuario
        )
        BEGIN
            SET @IDRETURN = -1;
            SET @ERRORID = 1; -- Carrito no encontrado o no pertenece al usuario
            SET @ERRORDESCRIPCION = 'El carrito especificado no existe o no pertenece al usuario';
            RETURN;
        END
 
        -- Eliminar el producto del carrito
        DELETE FROM Carrito
        WHERE id_carrito = @id_carrito AND id_usuario = @id_usuario;
 
        -- Verificar si se realizó la eliminación
        IF @@ROWCOUNT = 0
        BEGIN
            SET @IDRETURN = -1;
            SET @ERRORID = 2; -- Error en la eliminación
            SET @ERRORDESCRIPCION = 'No se pudo eliminar el producto del carrito';
            RETURN;
        END
 
        -- Retornar éxito en la eliminación
        SET @IDRETURN = 0;
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END;
GO


CREATE PROCEDURE sp_ObtenerProductosCarrito
    @id_usuario INT
AS
BEGIN
    SELECT 
        c.id_producto,
        p.nombre,
        p.descripcion,
        p.precio_producto,
        p.fecha_agregado,
        c.cantidad,
		c.id_carrito
    FROM 
        Carrito c
    INNER JOIN 
        Productos p ON c.id_producto = p.id_producto
    WHERE 
        c.id_usuario = @id_usuario;
END;
GO

CREATE PROCEDURE SP_OBTENER_TARJETAS
    @id_usuario INT
AS
BEGIN
    SELECT 
        t.id_tarjeta,
        t.numero_tarjeta,
        t.fecha_expiracion,
        t.CVV,
        u.nombre AS nombre_usuario,
        u.cedula
    FROM 
        Tarjetas t
    INNER JOIN 
        Usuarios u ON t.id_usuario = u.id_usuario
    WHERE 
        t.id_usuario = @id_usuario;
END;
GO
select * from Usuarios