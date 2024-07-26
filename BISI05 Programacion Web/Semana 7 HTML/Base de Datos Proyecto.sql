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
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    fecha_registro DATETIME DEFAULT GETDATE() NOT NULL,
);

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

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
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
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

--sp
USE BDProyectoWeb
GO
CREATE PROCEDURE SP_INGRESAR_USUARIO
(
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
        IF EXISTS (SELECT * FROM Usuarios WHERE email = @EMAIL)
        BEGIN
            SET @IDRETURN = -1;
            SET @ERRORID = 1; -- Correo ya registrado
            SET @ERRORDESCRIPCION = 'ERROR DESDE BD: CORREO YA REGISTRADO';
        END
        ELSE
        BEGIN
            INSERT INTO Usuarios (nombre, email, password, fecha_registro)
            VALUES (@NOMBRE, @EMAIL, @PASSWORD, GETDATE());

            SET @IDRETURN = SCOPE_IDENTITY();
        END
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
        IF EXISTS (SELECT * FROM Usuarios WHERE id_usuario = @ID_USUARIO)
        BEGIN
            DELETE FROM Usuarios
            WHERE id_usuario = @ID_USUARIO;

            SET @IDRETURN = @ID_USUARIO;
        END
        ELSE
        BEGIN
            SET @IDRETURN = -1;
            SET @ERRORID = 2; -- Usuario no encontrado
            SET @ERRORDESCRIPCION = 'ERROR DESDE BD: USUARIO NO ENCONTRADO';
        END
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
CREATE PROCEDURE SP_LOGIN_USUARIO
(
    @EMAIL NVARCHAR(100),
    @PASSWORD NVARCHAR(255),
    @ID_USUARIO BIGINT OUTPUT,
    @FECHA_REGISTRO DATETIME OUTPUT,
    @NOMBRE NVARCHAR(100) OUTPUT,
    @SESION_ID BIGINT OUTPUT
)
AS
BEGIN
    SET @ID_USUARIO = 0;
    SET @FECHA_REGISTRO = NULL;
    SET @NOMBRE = '';
    SET @SESION_ID = 0;

    IF EXISTS (
        SELECT id_usuario, nombre, fecha_registro
        FROM Usuarios
        WHERE email = @EMAIL
            AND password = @PASSWORD
    )
    BEGIN
        -- Obtener los detalles del usuario
        SELECT @ID_USUARIO = id_usuario, 
               @FECHA_REGISTRO = fecha_registro, 
               @NOMBRE = nombre
        FROM Usuarios
        WHERE email = @EMAIL
            AND password = @PASSWORD;

        -- Insertar una nueva sesión
        INSERT INTO Sesiones 
            (sesion, usuario, origen, fecha_inicio, estado, fecha_actualizacion)
        VALUES 
            (NEWID(), @ID_USUARIO, 'Web', GETUTCDATE(), 1, GETUTCDATE());

        -- Obtener el ID de la nueva sesión
        SET @SESION_ID = SCOPE_IDENTITY();
    END
END
GO

---------------------------------------------------------------------------------------
USE BDProyectoWeb
GO
CREATE PROCEDURE [dbo].[SP_CERRAR_SESION]
(
    @SESION_ID BIGINT
)
AS
BEGIN
    -- Actualizar el estado de la sesión a inactiva y registrar la fecha de cierre
    UPDATE Sesiones
    SET
        estado = 0,  -- Estado 0 indica que la sesión está cerrada
        fecha_final = GETUTCDATE(),  -- Fecha y hora en que se cerró la sesión
        fecha_actualizacion = GETUTCDATE()  -- Fecha y hora de la última actualización
    WHERE
        id = @SESION_ID;

    -- Opcionalmente, puedes agregar una verificación de si la sesión fue efectivamente cerrada
    IF @@ROWCOUNT = 0
    BEGIN
        -- Puedes manejar el caso en que no se encontró ninguna sesión para cerrar (opcional)
        PRINT 'No se encontró ninguna sesión activa para el ID especificado.';
    END
END
GO

--pruebas


--agregar usuario
DECLARE @IDRETURN INT,
        @ERRORID INT,
        @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_INGRESAR_USUARIO 
    @NOMBRE = 'a', 
    @EMAIL = 'awew@example.com', 
    @PASSWORD = 'password123', 
    @IDRETURN = @IDRETURN OUTPUT, 
    @ERRORID = @ERRORID OUTPUT, 
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

SELECT @IDRETURN AS ID_RETURN, 
       @ERRORID AS ERROR_ID, 
       @ERRORDESCRIPCION AS ERROR_DESCRIPCION;
------------------------------------------------------
--ELIMINAR USUARIO

DECLARE @IDRETURN INT,
        @ERRORID INT,
        @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_ELIMINAR_USUARIO 
    @ID_USUARIO = 1, 
    @IDRETURN = @IDRETURN OUTPUT, 
    @ERRORID = @ERRORID OUTPUT, 
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

SELECT @IDRETURN AS ID_RETURN, 
       @ERRORID AS ERROR_ID, 
       @ERRORDESCRIPCION AS ERROR_DESCRIPCION;
--------------------------------------------------
--INICIAR SESION
DECLARE @ID_USUARIO BIGINT,
        @FECHA_REGISTRO DATETIME,
        @NOMBRE NVARCHAR(100),
        @SESION_ID BIGINT;

EXEC SP_LOGIN_USUARIO 
    @EMAIL = 'awew@example.com',
    @PASSWORD = 'password123',
    @ID_USUARIO = @ID_USUARIO OUTPUT,
    @FECHA_REGISTRO = @FECHA_REGISTRO OUTPUT,
    @NOMBRE = @NOMBRE OUTPUT,
    @SESION_ID = @SESION_ID OUTPUT;

SELECT @ID_USUARIO AS ID_USUARIO, 
       @FECHA_REGISTRO AS FECHA_REGISTRO, 
       @NOMBRE AS NOMBRE, 
       @SESION_ID AS SESION_ID;

-------------------------------------------------------------
EXEC SP_CERRAR_SESION 
    @SESION_ID = 0;  -- Reemplaza con el ID de sesión obtenido al iniciar sesión
-------------------------------------------------------------------------------------
SELECT * FROM Sesiones;

SELECT u.email
FROM Sesiones s
INNER JOIN Usuarios u ON s.usuario = u.id_usuario
WHERE s.sesion = 'B3578023-4AA9-41D9-855E-FD7FC6518206';
