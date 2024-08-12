--NO TOCAR
--Pruebas
--Agregar usuario LISTO!!!!!!!!
USE BDProyectoWeb
GO
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_INGRESAR_USUARIO
    @CEDULA = 1194256555,          -- Cédula del usuario (debe ser única)
    @NOMBRE = 'fito diaz',
    @EMAIL = 'fito@gmail.com',
    @PASSWORD = 'fitolol',
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;


------------------------------------------------------
--ELIMINAR USUARIO LISTO!!!!!!!!
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);
EXEC SP_ELIMINAR_USUARIO
    @CEDULA = 1194256555,   
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;
SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;

--------------------------------------------------
--Actualizar Usuario LISTO!!!!!!!!
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);
EXEC SP_ACTUALIZAR_USUARIO
    @CEDULA = 119320150,          -- Cédula del usuario
    @NOMBRE = 'adri diaz 2',
    @EMAIL = 'adri@gmail.com',
    @PASSWORD = 'newsecurepassword',
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;
SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;
-------------------------------------------------------------------------------------------
--INICIAR SESION LISTO!!!!!!!!
DECLARE @SESION_ID BIGINT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);
EXEC SP_LOGIN_USUARIO
    @EMAIL = 'adri@gmail.com',
    @PASSWORD = 'newsecurepassword',
    @SESION_ID = @SESION_ID OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;
SELECT @SESION_ID AS SESION_ID, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;


-------------------------------------------------------------
--CERRAR SESION // debria de ser por usuario LISTO!!!!!!!!
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_CERRAR_SESION
    @SESION_ID = 1,          -- ID de la sesión que se desea cerrar
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;
-------------------------------------------------------------------------------------
--INSERTS CATEGORIAS
--Insertar una categoría de ejemplo
INSERT INTO Categorias (nombre, descripcion) 
VALUES ('Prueba', 'Todas las bebidas disponibles');

--AGREGAR PRODUCTO LISTO!!!!!!!!
-- Declarar variables de salida
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

-- Llamar al procedimiento almacenado
EXEC SP_AGREGAR_PRODUCTO
    @nombre_categoria = 'Maquinas',  -- Nombre de la categoría existente
    @nombre = 'Choreador',
    @descripcion = 'Alta calidad',
    @precio_producto = 7500,
    @cantidad = 70,
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

-- Verificar el resultado
SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;

SELECT * FROM Productos;

---------------------------------------------------------------------------------------
--eliminar PRODUCTO
-- Declarar variables de salida
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

-- Llamar al procedimiento almacenado
EXEC SP_ELIMINAR_PRODUCTO
    @nombre = 'Choreador',  -- Nombre del producto a eliminar
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

-- Verificar el resultado
SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;

SELECT * FROM Productos;
-------------------------------------------------------------------------------------------------
--ACTUALIZAR PRODUCTO
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

-- Llamar al procedimiento almacenado
EXEC SP_ACTUALIZAR_PRODUCTO
    @nombre_actual = 'Expresso',  -- Nombre del producto a actualizar
    @nuevo_nombre = 'Expresso Doble',   -- Nuevo nombre del producto
    @descripcion = 'un mejor expresso.',
    @precio_producto = 2600,
    @cantidad = 15,
    @nombre_categoria = 'Bebidas',  -- Nueva categoría del producto
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

-- Verificar el resultado
SELECT @IDRETURN AS IDRETURN, @ERRORID AS ERRORID, @ERRORDESCRIPCION AS ERRORDESCRIPCION;


SELECT * FROM Productos;
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

SELECT * FROM Categorias;


--Eliminar categoria 
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_ELIMINAR_CATEGORIA
    @NOMBRE = 'Prueba',  -- Nombre de la categoría que deseas eliminar
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
-- Declarar las variables necesarias
---------------------------------------------------
--detalleCompra
-- Declarar las variables necesarias
DECLARE @sesion NVARCHAR(MAX) = '93868743-D0DC-4510-A2DC-6CFC47BF92A9';  -- Reemplaza con el identificador de sesión válido
DECLARE @nombre_producto NVARCHAR(100) = 'Latte';
DECLARE @cantidad_producto INT = 2;
DECLARE @precio_producto DECIMAL(18, 2) = 100.50;
DECLARE @total_compra DECIMAL(10, 2) = 201.00;
DECLARE @fecha_compra DATETIME = GETDATE();
 
-- Ejecutar el procedimiento almacenado y obtener el nombre del usuario
EXEC InsertarDetalleCompra 
    @sesion = @sesion,
    @nombre_producto = @nombre_producto,
    @cantidad_producto = @cantidad_producto,
    @precio_producto = @precio_producto,
    @total_compra = @total_compra,
    @fecha_compra = @fecha_compra;


------------------------------------SELECTS-----------------------------------------
SELECT * FROM Sesiones;
SELECT * FROM Usuarios;
SELECT * FROM Productos;
SELECT * FROM Categorias;
SELECT * FROM Inventario;
SELECT * FROM Factura;
