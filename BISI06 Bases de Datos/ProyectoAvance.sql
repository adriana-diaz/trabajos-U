USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'INVENTARIO_ELECTROTIENDA')
DROP DATABASE [INVENTARIO_ELECTROTIENDA]
GO

CREATE DATABASE INVENTARIO_ELECTROTIENDA
GO
PRINT 'BASE DE DATOS CREADA'

USE INVENTARIO_ELECTROTIENDA
GO

CREATE TABLE Proveedor (
    IDProveedor INT NOT NULL,
    NombreProveedor VARCHAR(50) NOT NULL,
    DireccionProveedor VARCHAR(100) NOT NULL,
    NumeroDeTelefonoProveedor VARCHAR(8) NOT NULL,
    ID_Codigo_Producto INT,
    CONSTRAINT PK_Proveedor PRIMARY KEY(IDProveedor)
);
GO 
PRINT 'TABLA PROVEEDOR CREADA'
/**inicio tabla promocion**/
CREATE TABLE Promociones (
    IDPromociones INT NOT NULL,
    DescuentoPromociones VARCHAR(50) NOT NULL,
    Fecha_de_inicio_Promociones datetime NOT NULL,
    Fecha_de_finalizacion_Promociones datetime NOT NULL,
    ID_Codigo_Producto INT,
    CONSTRAINT PK_Promociones PRIMARY KEY(IDPromociones)
)
GO
PRINT 'TABLA PROMOCION CREADA'

CREATE TABLE Categoria (
    IDCategoria INT NOT NULL,
    NombreCategoria VARCHAR(50)NOT NULL,
    DescripcionCategoria VARCHAR(100) NOT NULL,
	ID_Codigo_Producto INT,
    CONSTRAINT PK_Categoria PRIMARY KEY(IDCategoria)
)
GO
PRINT 'TABLA CATEGORIA CREADA'

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Producto_Categoria]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT FK_Producto_Categoria
GO

CREATE TABLE Producto (
    ID_Codigo_Producto INT PRIMARY KEY,
    NombreProducto VARCHAR(50) not null,
    DescripcionProducto VARCHAR(100) NOT NULL,
    Cantidad_en_stock_Producto INT NOT NULL,
    Costo DECIMAL(10, 2) NOT NULL,
    IDCategoria INT,
    IDProveedor INT,
    IDPromociones INT,
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria),
    CONSTRAINT FK_Producto_Proveedor FOREIGN KEY (IDProveedor) REFERENCES Proveedor(IDProveedor),
    CONSTRAINT FK_Producto_Promociones FOREIGN KEY (IDPromociones) REFERENCES Promociones(IDPromociones)
)
GO
PRINT 'TABLA PRODUCTO CREADA'

CREATE TABLE Estado (
    IDEstado INT,
    NombreEstado VARCHAR(50),
    DescripcionEstado VARCHAR(100) NOT NULL,
	ID_Codigo_Factura INT,
    CONSTRAINT PK_Estado PRIMARY KEY(IDEstado)
)
GO
PRINT 'TABLA Estado CREADA'

CREATE TABLE Clientes (
    IDClientes INT,
    NombreClientes VARCHAR(50),
    ApellidoClientes VARCHAR(50),
    DireccionClientes VARCHAR(100) NOT NULL,
    NumeroDeTelefonoClientes VARCHAR(50),
    CorreoElectronicoClientes VARCHAR(50),
    ID_Codigo_Factura INT,
    CONSTRAINT PK_IDClientes PRIMARY KEY(IDClientes)
)
GO
PRINT 'TABLA Clientes CREADA'

CREATE TABLE Empleado (
    IDEmpleado INT,
    NombreEmpleado VARCHAR(50),
    ApellidoEmpleado VARCHAR(50),
	ID_Codigo_Factura INT,
    CONSTRAINT PK_IDEmpleado PRIMARY KEY(IDEmpleado)
)
GO
PRINT 'TABLA Empleado CREADA'

CREATE TABLE MetododePago (
    IDMetododePago INT,
    TipoMetododePago VARCHAR(50),
    DescripcionMetododePago VARCHAR(100) NOT NULL,
    MontoVendido INT NOT NULL,
    ID_Codigo_Factura INT,
	FechaMetododePago datetime NOT NULL,
    CONSTRAINT PK_IDMetododePago PRIMARY KEY(IDMetododePago),
    CONSTRAINT UQ_MetododePago_MontoVendido UNIQUE (MontoVendido)
)
GO
PRINT 'TABLA MetododePago CREADA'

CREATE TABLE Factura (
    ID_Codigo_Factura INT PRIMARY KEY,
    Fecha_de_Pedido_Factura DATETIME NOT NULL,
    DetalleFactura VARCHAR(100) NULL,
    CantidadFactura INT,
	IDClientes INT,
    NombreClientes VARCHAR(50),
    MontoVendido INT,
    IDEstado INT,
    IDMetododePago INT,
    IDEmpleado INT
    CONSTRAINT FK_Factura_Estado FOREIGN KEY (IDEstado) REFERENCES Estado(IDEstado),
    CONSTRAINT FK_Factura_MetododePago FOREIGN KEY (IDMetododePago) REFERENCES MetododePago(IDMetododePago),
    CONSTRAINT FK_Factura_Clientes FOREIGN KEY (IDClientes) REFERENCES Clientes(IDClientes),
    CONSTRAINT FK_Factura_Empleado FOREIGN KEY (IDEmpleado) REFERENCES Empleado(IDEmpleado),
)
GO
PRINT 'TABLA Factura CREADA'

CREATE TABLE Pedido (
    IDPedido INT PRIMARY KEY,
    Fecha_de_Pedido DATETIME NOT NULL,
    Cantidad INT,
    ID_Codigo_Producto INT,
    ID_Codigo_Factura INT,
	NombreProducto VARCHAR(50),
    CONSTRAINT FK_Pedido_Producto FOREIGN KEY (ID_Codigo_Producto) REFERENCES Producto(ID_Codigo_Producto),
    CONSTRAINT FK_Pedido_Factura FOREIGN KEY (ID_Codigo_Factura) REFERENCES Factura(ID_Codigo_Factura)
)
GO
PRINT 'TABLA Pedido CREADA'

INSERT INTO Proveedor(IDProveedor,NombreProveedor,DireccionProveedor,NumeroDeTelefonoProveedor,ID_Codigo_Producto) VALUES(1,'APPLE','COSTA RICA','89785634','1');
INSERT INTO Proveedor(IDProveedor,NombreProveedor,DireccionProveedor,NumeroDeTelefonoProveedor,ID_Codigo_Producto) VALUES(2,'SAMSUNG','COSTA RICA','12569818','2');
INSERT INTO Proveedor(IDProveedor,NombreProveedor,DireccionProveedor,NumeroDeTelefonoProveedor,ID_Codigo_Producto) VALUES(3,'XIAOMI','COSTA RICA','09785634','3');
INSERT INTO Proveedor(IDProveedor,NombreProveedor,DireccionProveedor,NumeroDeTelefonoProveedor,ID_Codigo_Producto) VALUES(4,'HUAWEI','COSTA RICA','98562356','4');
PRINT 'INSERTAR INFORMACION PROVEEDOR'

INSERT INTO Promociones(IDPromociones,DescuentoPromociones,Fecha_de_inicio_Promociones,Fecha_de_finalizacion_Promociones,ID_Codigo_Producto) VALUES(1,'50% DE DESCUENTO','2013-01-20','2024-01-20','1');
INSERT INTO Promociones(IDPromociones,DescuentoPromociones,Fecha_de_inicio_Promociones,Fecha_de_finalizacion_Promociones,ID_Codigo_Producto) VALUES(2,'20% DE DESCUENTO','2023-02-20','2024-02-20','2');
INSERT INTO Promociones(IDPromociones,DescuentoPromociones,Fecha_de_inicio_Promociones,Fecha_de_finalizacion_Promociones,ID_Codigo_Producto) VALUES(3,'70% DE DESCUENTO','2023-03-20','2024-03-20','3');
INSERT INTO Promociones(IDPromociones,DescuentoPromociones,Fecha_de_inicio_Promociones,Fecha_de_finalizacion_Promociones,ID_Codigo_Producto) VALUES(4,'10% DE DESCUENTO','2023-04-20','2024-04-20','4');
PRINT 'INSERTAR INFORMACION PROMOCIONES'

INSERT INTO Categoria(IDCategoria,NombreCategoria,DescripcionCategoria,ID_Codigo_Producto) VALUES(1,'CELULARES','CELULARES NUEVOS Y USADOS','1');
INSERT INTO Categoria(IDCategoria,NombreCategoria,DescripcionCategoria,ID_Codigo_Producto) VALUES(2,'COMPUTADORAS','COMPUTADORAS NUEVAS Y USADAS','2');
INSERT INTO Categoria(IDCategoria,NombreCategoria,DescripcionCategoria,ID_Codigo_Producto) VALUES(3,'TELEVISORES','PANTALLAS NUEVAS Y USADAS','3');
INSERT INTO Categoria(IDCategoria,NombreCategoria,DescripcionCategoria,ID_Codigo_Producto) VALUES(4,'CABLES','CABLES PARA CADA DISPOSITIVO','4') ;
PRINT 'INSERTAR INFORMACION CATEGORIA'

INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto,IDCategoria,IDProveedor,IDPromociones) VALUES(1,'IPHONE 15','ESTADO NUEVO','1000000','16','1','1','1');
INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto,IDCategoria,IDProveedor,IDPromociones) VALUES(2,'HP LAPTOP','ESTADO NUEVO','2300000','90','2','2','2');
INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto,IDCategoria,IDProveedor,IDPromociones) VALUES(3,'TV SAMSUNG','ESTADO NUEVO','890000','53','3','3','3');
INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto,IDCategoria,IDProveedor,IDPromociones) VALUES(4,'CABLE TIPO C','ESTADO NUEVO','4450000','75','4','4','4');
PRINT 'INSERTAR INFORMACION PRODUCTO'

INSERT INTO Estado(IDEstado,NombreEstado,DescripcionEstado,ID_Codigo_Factura) VALUES(1,'NUEVO','Comprado recientemente','11111111');
INSERT INTO Estado(IDEstado,NombreEstado,DescripcionEstado,ID_Codigo_Factura) VALUES(2,'NUEVO','Comprado hace un mes','22222222');
INSERT INTO Estado(IDEstado,NombreEstado,DescripcionEstado,ID_Codigo_Factura) VALUES(3,'NUEVO','Comprado recientemente','3333333');
INSERT INTO Estado(IDEstado,NombreEstado,DescripcionEstado,ID_Codigo_Factura) VALUES(4,'NUEVO','Comprado hace un mes','444444');
PRINT 'INSERTAR INFORMACION ESTADO'

INSERT INTO Clientes(IDClientes,NombreClientes,ApellidoClientes,DireccionClientes,NumeroDeTelefonoClientes,CorreoElectronicoClientes,ID_Codigo_Factura) VALUES(1,'Adriana','Diaz','Heredia','89785634','adriana@gmail.com','11111111');
INSERT INTO Clientes(IDClientes,NombreClientes,ApellidoClientes,DireccionClientes,NumeroDeTelefonoClientes,CorreoElectronicoClientes,ID_Codigo_Factura) VALUES(2,'Maria','Martinez','San Jose','89098765','mariam@gmail.com','22222222');
INSERT INTO Clientes(IDClientes,NombreClientes,ApellidoClientes,DireccionClientes,NumeroDeTelefonoClientes,CorreoElectronicoClientes,ID_Codigo_Factura) VALUES(3,'Jose','Blanco','Cartago','23674356','joseb@hotmail.com','3333333');
INSERT INTO Clientes(IDClientes,NombreClientes,ApellidoClientes,DireccionClientes,NumeroDeTelefonoClientes,CorreoElectronicoClientes,ID_Codigo_Factura) VALUES(4,'Laura','Vargas','Puntarenas','12894356','lauravargas@hotmail.com','444444');
PRINT 'INSERTAR INFORMACION CLIENTES'

INSERT INTO Empleado(IDEmpleado,NombreEmpleado,ApellidoEmpleado,ID_Codigo_Factura) VALUES(001,'Rodolfo','Diaz','1');
INSERT INTO Empleado(IDEmpleado,NombreEmpleado,ApellidoEmpleado,ID_Codigo_Factura) VALUES(200,'Pedro','Sanchez','2');
INSERT INTO Empleado(IDEmpleado,NombreEmpleado,ApellidoEmpleado,ID_Codigo_Factura) VALUES(089,'Jose','Murillo','3');
INSERT INTO Empleado(IDEmpleado,NombreEmpleado,ApellidoEmpleado,ID_Codigo_Factura) VALUES(003,'Raul','Cajina','4');
PRINT 'INSERTAR INFORMACION EMPLEADO'

INSERT INTO MetododePago(IDMetododePago,TipoMetododePago,DescripcionMetododePago,MontoVendido,ID_Codigo_Factura,FechaMetododePago) VALUES(1,'Efectivo','Completo','1500','11111111','2023-02-28');
INSERT INTO MetododePago(IDMetododePago,TipoMetododePago,DescripcionMetododePago,MontoVendido,ID_Codigo_Factura,FechaMetododePago) VALUES(2,'Tarjeta','Completo','20000','22222222','2022-09-30');
INSERT INTO MetododePago(IDMetododePago,TipoMetododePago,DescripcionMetododePago,MontoVendido,ID_Codigo_Factura,FechaMetododePago) VALUES(3,'Simpe Movil','Completo','9000','3333333','2023-04-30');
INSERT INTO MetododePago(IDMetododePago,TipoMetododePago,DescripcionMetododePago,MontoVendido,ID_Codigo_Factura,FechaMetododePago) VALUES(4,'Efectivo','Completo','6000','444444','2023-01-12');
PRINT 'INSERTAR INFORMACION METODODEPAGO'

INSERT INTO Factura(ID_Codigo_Factura,Fecha_de_Pedido_Factura,DetalleFactura,CantidadFactura,IDClientes,NombreClientes,MontoVendido,IDEstado,IDMetododePago,IDEmpleado) VALUES(11111111,'2023-01-30','SE REALIZO UNA FACTURA DE LAPTOP HP','1','1','Adriana','1500','1','1','001');
INSERT INTO Factura(ID_Codigo_Factura,Fecha_de_Pedido_Factura,DetalleFactura,CantidadFactura,IDClientes,NombreClientes,MontoVendido,IDEstado,IDMetododePago,IDEmpleado) VALUES(22222222,'2023-08-20','SE REALIZO UNA FACTURA DE UN TECLADO Y MOUSE','2','2','Maria','20000','2','2','200');
INSERT INTO Factura(ID_Codigo_Factura,Fecha_de_Pedido_Factura,DetalleFactura,CantidadFactura,IDClientes,NombreClientes,MontoVendido,IDEstado,IDMetododePago,IDEmpleado) VALUES(3333333,'2023-01-10','SE REALIZO UNA FACTURA DE IPHONE 15','1','3','Jose','9000','3','3','089');
INSERT INTO Factura(ID_Codigo_Factura,Fecha_de_Pedido_Factura,DetalleFactura,CantidadFactura,IDClientes,NombreClientes,MontoVendido,IDEstado,IDMetododePago,IDEmpleado) VALUES(444444,'2023-05-20','SE REALIZO UNA FACTURA DE MONITOR','3','4','Laura','6000','4','4','003');
PRINT 'INSERTAR INFORMACION FACTURA'

INSERT INTO Pedido(IDPedido,Fecha_de_Pedido,Cantidad,ID_Codigo_Producto,ID_Codigo_Factura,NombreProducto) VALUES(1,'2023-01-30','1','1','11111111','IPHONE 15')
INSERT INTO Pedido(IDPedido,Fecha_de_Pedido,Cantidad,ID_Codigo_Producto,ID_Codigo_Factura,NombreProducto) VALUES(2,'2022-08-20','2','2','22222222','HP LAPTOP');
INSERT INTO Pedido(IDPedido,Fecha_de_Pedido,Cantidad,ID_Codigo_Producto,ID_Codigo_Factura,NombreProducto) VALUES(3,'2023-01-10','1','2','3333333','TV SAMSUNG');
INSERT INTO Pedido(IDPedido,Fecha_de_Pedido,Cantidad,ID_Codigo_Producto,ID_Codigo_Factura,NombreProducto) VALUES(4,'2024-05-20','3','3','444444','CABLE TIPO C');
PRINT 'INSERTAR INFORMACION PEDIDO'


SELECT * FROM Proveedor;
PRINT 'SELECT PROVEEDOR'

SELECT * FROM Promociones;
PRINT 'SELECT Promociones'

SELECT * FROM Categoria;
PRINT 'SELECT Categoria'

SELECT * FROM Producto;
PRINT 'SELECT Producto'

SELECT * FROM Estado;
PRINT 'SELECT Estado'

SELECT * FROM Clientes;
PRINT 'SELECT Clientes'

SELECT * FROM MetododePago;
PRINT 'SELECT MetododePago'

SELECT * FROM Factura;
PRINT 'SELECT Factura'

SELECT * FROM Pedido;
PRINT 'SELECT Pedido'

SELECT *FROM Producto INNER JOIN Promociones ON Promociones.IDPromociones = Producto.ID_Codigo_Producto;
PRINT 'JOIN ENTRE TABLA PRODUCTO Y TABLA PROMOCIONES'

SELECT * FROM Producto INNER JOIN Proveedor ON Producto.IDProveedor = Proveedor.IDProveedor;
PRINT 'JOIN ENTRE TABLA PRODUCTO Y TABLA PROVEEDOR'

SELECT * FROM Producto INNER JOIN Categoria ON Producto.ID_Codigo_Producto = Categoria.IDCategoria;
PRINT 'JOIN ENTRE TABLA PRODUCTO Y TABLA CATEGORIA'

SELECT
    C.IDClientes,
    C.NombreClientes,
    F.ID_Codigo_Factura,
    F.Fecha_de_Pedido_Factura
FROM
    Clientes C
    JOIN Factura F ON C.IDClientes = F.IDClientes
WHERE
    C.IDClientes = '1'
    AND F.Fecha_de_Pedido_Factura BETWEEN '2014-05-05' AND '2023-05-06';
PRINT 'Consulta 1 / Cantidad de facturas realizadas en un Rango de Fechas'
---------------------------------------------------------------------------------
SELECT
    F.ID_Codigo_Factura,
    F.Fecha_de_Pedido_Factura,
    P.ID_Codigo_Producto,
    P.NombreProducto,
    P.Cantidad_en_stock_Producto AS CantidadFacturada
FROM
    Pedido PD
    JOIN Factura F ON PD.ID_Codigo_Factura = F.ID_Codigo_Factura
    JOIN Producto P ON PD.ID_Codigo_Producto = P.ID_Codigo_Producto
WHERE
    F.ID_Codigo_Factura = '22222222';

PRINT 'CONSULTA 2 / Listar todos los productos de una factura en específico'
---------------------------------------------------------------------------------
SELECT
    M.IDMetododePago,
    M.TipoMetododePago,
    SUM(M.MontoVendido) AS MontoTotalVendido
FROM
    MetododePago M
WHERE
    M.FechaMetododePago BETWEEN '2014-05-05' AND '2023-05-06'
GROUP BY
    M.IDMetododePago, M.TipoMetododePago;
PRINT 'Consulta 3 / Desplegar el monto vendido entre un rango de fechas por método de pago.'
-------------------------------------------------------------------------------
SELECT
    COUNT(*) AS CantidadFacturas,
    Fecha_de_Pedido_Factura
FROM
    Factura
WHERE
    Fecha_de_Pedido_Factura BETWEEN '2014-05-05' AND '2023-05-06'
GROUP BY
    Fecha_de_Pedido_Factura;
PRINT 'Consulta 4 / Mostrar la cantidad de facturas realizadas en un Rango de Fechas.'
-----------------------------------------------------------------------------
SELECT
    c.IDCategoria AS Codigo_Categoria,
    c.NombreCategoria AS Categoria,
    SUM(p.Costo) AS CostoTotal,
    AVG(p.Costo) AS PromedioCosto,
    MIN(p.Costo) AS MinimoCosto,
    MAX(p.Costo) AS MaximoCosto
FROM Producto p
INNER JOIN Categoria c ON p.IDCategoria = c.IDCategoria
GROUP BY c.IDCategoria, c.NombreCategoria;
PRINT 'CONSULTA 5 / Mostar para cada categoría el costo total de los productos asociados, el promedio, el
mínimo y el máximo.'
