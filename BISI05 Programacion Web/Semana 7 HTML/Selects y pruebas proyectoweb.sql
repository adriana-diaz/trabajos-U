--NO TOCAR
--Pruebas
--Agregar usuario LISTO!!!!!!!!
USE BDProyectoWeb
GO
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC SP_INGRESAR_USUARIO
    @CEDULA = 119320150,          -- Cédula del usuario (debe ser única)
    @NOMBRE = 'adriana diaz',
    @EMAIL = 'adri@gmail.com',
    @PASSWORD = '3003',
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
VALUES ('Maquinas', 'Todas las bebidas disponibles');

--AGREGAR PRODUCTO LISTO!!!!!!!!
-- Declarar variables de salida
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

-- Llamar al procedimiento almacenado
EXEC SP_AGREGAR_PRODUCTO
    @nombre_categoria = 'Maquinas',  -- Nombre de la categoría existente
    @nombre = 'Coffee Maker',
    @descripcion = 'de muy alta calidad',
    @precio_producto = 10000,
    @cantidad = 10,
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
	----------------------------------
	--version rapida
INSERT INTO Carrito (id_usuario, id_producto) VALUES (1, 1);  -- Usuario 1 compra Producto 1

--version por el nombre del producto
DECLARE @IDRETURN INT,
        @ERRORID INT,
        @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC [dbo].[SP_AGREGAR_PRODUCTO_AL_CARRITO] 
    @id_usuario = 1,
    @nombre_producto = 'Expresso Doble',
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

-- Verificar el resultado
SELECT @IDRETURN AS ID_CARRITO, 
       @ERRORID AS ERROR_ID, 
       @ERRORDESCRIPCION AS ERROR_DESCRIPCION;
------------------------------------------------------------------------------------
-- Ejecutar el procedimiento almacenado para probarlo
EXEC SP_INGRESAR_TARJETA
    @numero_tarjeta = 545454545, -- Reemplaza con un número de tarjeta válido para prueba
    @fecha_expiracion = '2025-12-31', -- Reemplaza con una fecha de expiración válida
    @CVV = 963, -- Reemplaza con un CVV válido para prueba
    @id_usuario = 2; -- Reemplaza con un ID de usuario válido que exista en la tabla Usuarios

------------------------------------SELECTS-----------------------------------------
-- Inserta un usuario de prueba
INSERT INTO Usuarios (cedula, nombre, email, password)
VALUES (123456789, 'Juan Pérez', 'juan.perez@example.com', 'securepassword');

-- Supongamos que el ID de usuario insertado es 1 y el ID de compra es 1:
-- Inserta un encabezado de factura de prueba
INSERT INTO EncabezadoFactura (id_usuario, id_compra)
VALUES (1, 1);
---------------------------------------------------------------------------------

-- Supongamos que ya has insertado la compra:
INSERT INTO Compra (id_usuario, id_producto, id_tarjeta)
VALUES (2, 2, 2);  -- Ajusta los valores según tu necesidad

-- Luego, ejecuta el procedimiento almacenado para actualizar el precio total
EXEC sp_ActualizarPrecioTotalCompra @id_compra = SCOPE_IDENTITY();


SELECT * FROM Sesiones;
SELECT * FROM Usuarios;
SELECT * FROM Productos;
SELECT * FROM Categorias;
SELECT * FROM Factura;
SELECT * FROM Carrito;
SELECT * FROM Tarjetas;
SELECT * FROM Compra;





