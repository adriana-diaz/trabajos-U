--NO TOCAR
--Pruebas
--Agregar usuario
USE BDProyectoWeb
GO
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
    @CEDULA = 559595955,          -- Cédula del usuario
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
    @NOMBRE = 'Latte', 
    @DESCRIPCION = 'de alta calidad de Argentina', 
    @PRECIO = 6.66, 
    @NOMBRE_CATEGORIA = 'Bebidas',
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

SELECT @IDRETURN AS ID, @ERRORID AS ErrorID, @ERRORDESCRIPCION AS ErrorDescripcion;
---------------------------------------------------------------------------------------
--eliminar PRODUCTO
DECLARE @IDRETURN INT, @ERRORID INT, @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_ELIMINAR_PRODUCTO
    @NOMBRE = 'Latte postman',
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

-- Verificar el resultado
SELECT @IDRETURN AS Resultado, @ERRORID AS CodigoError, @ERRORDESCRIPCION AS DescripcionError;

-------------------------------------------------------------------------------------------------
--ACTUALIZAR PRODUCTO
-- Declarar variables de salida
DECLARE @IDRETURN INT, @ERRORID INT, @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_ACTUALIZAR_PRODUCTO
    @NOMBRE_ORIGINAL = 'Latte',
    @NUEVO_NOMBRE = 'latte BD',
    @NUEVA_DESCRIPCION = 'BD granos',
    @NUEVO_PRECIO = 30.00,
    @NUEVO_NOMBRE_CATEGORIA = 'Bebidas',
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

-- Verificar el resultado
SELECT @IDRETURN AS Resultado, @ERRORID AS CodigoError, @ERRORDESCRIPCION AS DescripcionError;

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
--Eliminar categoria 
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_ELIMINAR_CATEGORIA
    @NOMBRE = 'Bebidas Postman',  -- Nombre de la categoría que deseas eliminar
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;
----------------------------------------------------------------------------
--Consultar Inventario 
EXEC SP_CONSULTAR_INVENTARIO
    @NOMBRE_PRODUCTO = 'Capucchino';  -- Reemplaza con el nombre del producto que deseas consultar
GO
--ingresar
-- Declarar las variables de salida
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);
 
-- Ejecutar el procedimiento
EXEC SP_INSERTAR_INVENTARIO 
    @NOMBRE_PRODUCTO = 'Latte',  -- Reemplaza con el nombre del producto
    @CANTIDAD = 100,                       -- Reemplaza con la cantidad que deseas insertar
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;
 
-- Mostrar los resultados
SELECT 
    @IDRETURN AS IDRETURN, 
    @ERRORID AS ErrorID, 
    @ERRORDESCRIPCION AS ErrorDescripcion;
GO
--ACTUALIZAR
-- Declarar las variables de salida
DECLARE @ERRORID_UPDATE INT;
DECLARE @ERRORDESCRIPCION_UPDATE NVARCHAR(MAX);
 
-- Ejecutar el procedimiento
EXEC SP_ACTUALIZAR_INVENTARIO 
    @NOMBRE_PRODUCTO = 'Capucchino',  -- Reemplaza con el nombre del producto
    @CANTIDAD = 150,                       -- Reemplaza con la cantidad que deseas actualizar
    @ERRORID = @ERRORID_UPDATE OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION_UPDATE OUTPUT;
 
-- Mostrar los resultados
SELECT 
    @ERRORID_UPDATE AS ErrorID, 
    @ERRORDESCRIPCION_UPDATE AS ErrorDescripcion;
GO
--eliminar
-- Declarar las variables de salida
DECLARE @IDRETURN_DELETE INT;
DECLARE @ERRORID_DELETE INT;
DECLARE @ERRORDESCRIPCION_DELETE NVARCHAR(MAX);
 
-- Ejecutar el procedimiento
EXEC SP_ELIMINAR_INVENTARIO
    @NOMBRE_PRODUCTO = 'Capucchino',  -- Reemplaza con el nombre del producto
    @IDRETURN = @IDRETURN_DELETE OUTPUT,
    @ERRORID = @ERRORID_DELETE OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION_DELETE OUTPUT;
 
-- Mostrar los resultados
SELECT 
    @IDRETURN_DELETE AS IDRETURN, 
    @ERRORID_DELETE AS ErrorID, 
    @ERRORDESCRIPCION_DELETE AS ErrorDescripcion;
GO

--consultar
EXEC SP_CONSULTAR_INVENTARIO
    @NOMBRE_PRODUCTO = 'Capucchino';  -- Reemplaza con el nombre del producto que deseas consultar
GO
--------------------------------------------------------------------------------
--Compras
-- Ejecutar el procedimiento SP_INSERTAR_COMPRA

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
SELECT * FROM Inventario;

