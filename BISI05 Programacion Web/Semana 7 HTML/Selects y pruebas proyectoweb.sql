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
VALUES ('Bebidas', 'Todas las bolsas disponibles');

--AGREGAR PRODUCTO LISTO!!!!!!!!
-- Declarar variables de salida
DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

-- Llamar al procedimiento almacenado
EXEC SP_AGREGAR_PRODUCTO
    @nombre_categoria = 'Bebidas',  -- Nombre de la categoría existente
    @nombre = 'Te',
    @descripcion = 'de muy alta calidad',
    @precio_producto = 10000,
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

--version por el nombre del producto
DECLARE @IDRETURN INT,
        @ERRORID INT,
        @ERRORDESCRIPCION NVARCHAR(MAX);

EXEC [dbo].[SP_AGREGAR_PRODUCTO_AL_CARRITO] 
    @id_usuario = 1,
    @nombre_producto = 'Te',
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

-- Verificar el resultado
SELECT @IDRETURN AS ID_CARRITO, 
       @ERRORID AS ERROR_ID, 
       @ERRORDESCRIPCION AS ERROR_DESCRIPCION;
------------------------------------------------------------------------------------
-- Ejecutar el procedimiento almacenado para probarlo

DECLARE @IDRETURN INT;
DECLARE @ERRORID INT;
DECLARE @ERRORDESCRIPCION NVARCHAR(MAX);

-- Ejecutar el procedimiento almacenado
EXEC SP_INGRESAR_TARJETA
    @numero_tarjeta = 123453456,  -- Reemplaza con el número de tarjeta real
    @fecha_expiracion = '12/25',          -- Reemplaza con la fecha de expiración real
    @CVV = 123,                           -- Reemplaza con el CVV real
    @id_usuario = 1,                      -- Reemplaza con el ID de usuario real
    @IDRETURN = @IDRETURN OUTPUT,
    @ERRORID = @ERRORID OUTPUT,
    @ERRORDESCRIPCION = @ERRORDESCRIPCION OUTPUT;

-- Mostrar los resultados
SELECT 
    @IDRETURN AS ID_RETURNED,
    @ERRORID AS ERROR_ID,
    @ERRORDESCRIPCION AS ERROR_DESCRIPTION;


------------------------------------SELECTS-----------------------------------------
-- Inserta un usuario de prueba
INSERT INTO Usuarios (cedula, nombre, email, password)
VALUES (123456789, 'Juan Pérez', 'juan.perez@example.com', 'securepassword');
---------------------------------------------------------------------------------

SELECT * FROM Sesiones;
SELECT * FROM Usuarios;
SELECT * FROM Productos;
SELECT * FROM Categorias;
SELECT * FROM Factura;
select * from EncabezadoFactura;
select * from DetalleFactura;
SELECT * FROM Carrito;
SELECT * FROM Tarjetas;

	-- Insertar un usuario
INSERT INTO Usuarios (cedula, nombre, email, password)
VALUES (12345678, 'Juan Pérez', 'juan.perez@example.com', 'contraseña123');

-- Insertar una categoría
INSERT INTO Categorias (nombre, descripcion)
VALUES ('Bebidas', 'maquinas electrónias');

-- Insertar un producto
INSERT INTO Productos (id_categoria, nombre, descripcion, precio_producto, cantidad)
VALUES (1, 'coffe maker', 'alta calidad', 1200.00, 10);

-- Insertar una tarjeta
INSERT INTO Tarjetas (numero_tarjeta, fecha_expiracion, CVV, id_usuario)
VALUES (999999, '12/2025', 853, 3);

---------------------------
USE BDProyectoWeb
GO
CREATE PROCEDURE SP_FACTURA(
@id_usuario INT,
@IDRETURN INT OUTPUT,
@ERRORID INT OUTPUT,
@ERRORDESCRIPCION NVARCHAR(MAX) OUTPUT
)
as begin
DECLARE @EXISTE INT = 0
select @EXISTE = @id_factura from factura WHERE ID = @facturaId
if (@EXISTE = 0)
	INSERT INTO DBO.FACTURA (ID, FECHA) VALUES (@idfactura, @fecha)
ELSE
UPDATE FACTURA SET FECHA = @fecha
WHERE ID = @idfactura

---

exec sp_generar_factura 1

USE BDProyectoWeb
GO
CREATE PROCEDURE SP_GENERAR_FACTURA(
    @id_usuario INT
)
AS
BEGIN
        DECLARE @id_factura INT;
        DECLARE @monto_total DECIMAL(18, 2) = 0;

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
        INSERT INTO DetalleFactura (id_factura, id_producto, id_carrito)
        SELECT @id_factura, c.id_producto, c.id_carrito
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
			@monto_total as monto_total
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
