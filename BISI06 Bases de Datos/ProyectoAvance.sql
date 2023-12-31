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
    CONSTRAINT PK_Proveedor PRIMARY KEY(IDProveedor)
);
GO 
PRINT 'TABLA PROVEEDOR CREADA'
CREATE TABLE Promociones (
    IDPromociones INT NOT NULL,
    DescuentoPromociones VARCHAR(50) NOT NULL,
    Fecha_de_inicio_Promociones datetime NOT NULL,
    Fecha_de_finalizacion_Promociones datetime NOT NULL,
    CONSTRAINT PK_Promociones PRIMARY KEY(IDPromociones)
)
GO
PRINT 'TABLA PROMOCION CREADA'

CREATE TABLE Categoria (
    IDCategoria INT NOT NULL,
    NombreCategoria VARCHAR(50)NOT NULL,
    DescripcionCategoria VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Categoria PRIMARY KEY(IDCategoria)
)
GO
PRINT 'TABLA CATEGORIA CREADA'

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
    CONSTRAINT PK_IDClientes PRIMARY KEY(IDClientes)
)
GO
PRINT 'TABLA Clientes CREADA'

CREATE TABLE Empleado (
    IDEmpleado INT,
    NombreEmpleado VARCHAR(50),
    ApellidoEmpleado VARCHAR(50),
    CONSTRAINT PK_IDEmpleado PRIMARY KEY(IDEmpleado)
)
GO
PRINT 'TABLA Empleado CREADA'

CREATE TABLE MetododePago (
    IDMetododePago INT,
    TipoMetododePago VARCHAR(50),
    DescripcionMetododePago VARCHAR(100) NOT NULL,
	FechaMetododePago datetime NOT NULL,
    CONSTRAINT PK_IDMetododePago PRIMARY KEY(IDMetododePago)
)
GO
PRINT 'TABLA MetododePago CREADA'

CREATE TABLE Factura (
    ID_Codigo_Factura INT PRIMARY KEY,
    Fecha_de_Factura DATETIME NOT NULL,
    DetalleFactura VARCHAR(100) NULL,
    CantidadFactura INT,
	IDClientes INT,
    MontoVendido DECIMAL(10,2),
    IDEstado INT,
    IDMetododePago INT,
    IDEmpleado INT,
    CONSTRAINT FK_Factura_Estado FOREIGN KEY (IDEstado) REFERENCES Estado(IDEstado),
    CONSTRAINT FK_Factura_MetododePago FOREIGN KEY (IDMetododePago) REFERENCES MetododePago(IDMetododePago),
    CONSTRAINT FK_Factura_Clientes FOREIGN KEY (IDClientes) REFERENCES Clientes(IDClientes),
    CONSTRAINT FK_Factura_Empleado FOREIGN KEY (IDEmpleado) REFERENCES Empleado(IDEmpleado)
)
GO
PRINT 'TABLA Factura CREADA'

CREATE TABLE Pedido (
    IDPedido INT PRIMARY KEY,
    Fecha_de_Pedido DATETIME NOT NULL,
    Cantidad INT,
    CONSTRAINT FK_Pedido_Producto FOREIGN KEY (IDPedido) REFERENCES Producto(ID_Codigo_Producto),
    CONSTRAINT FK_Pedido_Factura FOREIGN KEY (IDPedido) REFERENCES Factura(ID_Codigo_Factura)
)
GO
PRINT 'TABLA Pedido CREADA'

INSERT INTO Proveedor(IDProveedor,NombreProveedor,DireccionProveedor,NumeroDeTelefonoProveedor) VALUES(1,'APPLE','COSTA RICA','89785634');
INSERT INTO Proveedor(IDProveedor,NombreProveedor,DireccionProveedor,NumeroDeTelefonoProveedor) VALUES(2,'SAMSUNG','COSTA RICA','12569818');
INSERT INTO Proveedor(IDProveedor,NombreProveedor,DireccionProveedor,NumeroDeTelefonoProveedor) VALUES(3,'XIAOMI','COSTA RICA','09785634');
INSERT INTO Proveedor(IDProveedor,NombreProveedor,DireccionProveedor,NumeroDeTelefonoProveedor) VALUES(4,'HUAWEI','COSTA RICA','98562356');
PRINT 'INFORMACION INSERTADA DE PROVEEDOR'

INSERT INTO Promociones(IDPromociones,DescuentoPromociones,Fecha_de_inicio_Promociones,Fecha_de_finalizacion_Promociones) VALUES(1,'50% DE DESCUENTO','2013-01-20','2024-01-20');
INSERT INTO Promociones(IDPromociones,DescuentoPromociones,Fecha_de_inicio_Promociones,Fecha_de_finalizacion_Promociones) VALUES(2,'20% DE DESCUENTO','2023-02-20','2024-02-20');
INSERT INTO Promociones(IDPromociones,DescuentoPromociones,Fecha_de_inicio_Promociones,Fecha_de_finalizacion_Promociones) VALUES(3,'70% DE DESCUENTO','2023-03-20','2024-03-20');
INSERT INTO Promociones(IDPromociones,DescuentoPromociones,Fecha_de_inicio_Promociones,Fecha_de_finalizacion_Promociones) VALUES(4,'10% DE DESCUENTO','2023-04-20','2024-04-20');
PRINT 'INFORMACION INSERTADA DE PROMOCIONES'

INSERT INTO Categoria(IDCategoria,NombreCategoria,DescripcionCategoria) VALUES(1,'CELULARES','CELULARES NUEVOS Y USADOS');
INSERT INTO Categoria(IDCategoria,NombreCategoria,DescripcionCategoria) VALUES(2,'COMPUTADORAS','COMPUTADORAS NUEVAS Y USADAS');
INSERT INTO Categoria(IDCategoria,NombreCategoria,DescripcionCategoria) VALUES(3,'TELEVISORES','PANTALLAS NUEVAS Y USADAS');
INSERT INTO Categoria(IDCategoria,NombreCategoria,DescripcionCategoria) VALUES(4,'CABLES','CABLES PARA CADA DISPOSITIVO') ;
PRINT 'INFORMACION INSERTADA DE CATEGORIA'

INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto,IDCategoria,IDProveedor,IDPromociones) VALUES(1,'IPHONE 15','ESTADO NUEVO',1000000,16,1,1,1);
INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto,IDCategoria,IDProveedor,IDPromociones) VALUES(2,'HP LAPTOP','ESTADO NUEVO',2300000,90,2,2,2);
INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto,IDCategoria,IDProveedor,IDPromociones) VALUES(3,'TV SAMSUNG','ESTADO NUEVO',890000,53,3,3,3);
INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto,IDCategoria,IDProveedor,IDPromociones) VALUES(4,'CABLE TIPO C','ESTADO NUEVO',4450000,75,4,4,4);
INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto,IDCategoria,IDProveedor,IDPromociones) VALUES(5,'TECLADO Y MOUSE','ESTADO NUEVO',20000,100,2,4,4);
PRINT 'INFORMACION INSERTADA DE PRODUCTO'

INSERT INTO Estado(IDEstado,NombreEstado,DescripcionEstado) VALUES(1,'NUEVO','Comprado recientemente');
INSERT INTO Estado(IDEstado,NombreEstado,DescripcionEstado) VALUES(2,'NUEVO','Comprado hace un mes');
INSERT INTO Estado(IDEstado,NombreEstado,DescripcionEstado) VALUES(3,'NUEVO','Comprado recientemente');
INSERT INTO Estado(IDEstado,NombreEstado,DescripcionEstado) VALUES(4,'NUEVO','Comprado hace un mes');
PRINT 'INFORMACION INSERTADA DE ESTADO'

INSERT INTO Clientes(IDClientes,NombreClientes,ApellidoClientes,DireccionClientes,NumeroDeTelefonoClientes,CorreoElectronicoClientes) VALUES(1,'Adriana','Diaz','Heredia','89785634','adriana@gmail.com');
INSERT INTO Clientes(IDClientes,NombreClientes,ApellidoClientes,DireccionClientes,NumeroDeTelefonoClientes,CorreoElectronicoClientes) VALUES(2,'Maria','Martinez','San Jose','89098765','mariam@gmail.com');
INSERT INTO Clientes(IDClientes,NombreClientes,ApellidoClientes,DireccionClientes,NumeroDeTelefonoClientes,CorreoElectronicoClientes) VALUES(3,'Jose','Blanco','Cartago','23674356','joseb@hotmail.com');
INSERT INTO Clientes(IDClientes,NombreClientes,ApellidoClientes,DireccionClientes,NumeroDeTelefonoClientes,CorreoElectronicoClientes) VALUES(4,'Laura','Vargas','Puntarenas','12894356','lauravargas@hotmail.com');
PRINT 'INFORMACION INSERTADA DE CLIENTES'

INSERT INTO Empleado(IDEmpleado,NombreEmpleado,ApellidoEmpleado) VALUES(001,'Rodolfo','Diaz');
INSERT INTO Empleado(IDEmpleado,NombreEmpleado,ApellidoEmpleado) VALUES(200,'Pedro','Sanchez');
INSERT INTO Empleado(IDEmpleado,NombreEmpleado,ApellidoEmpleado) VALUES(089,'Jose','Murillo');
INSERT INTO Empleado(IDEmpleado,NombreEmpleado,ApellidoEmpleado) VALUES(003,'Raul','Cajina');
PRINT 'INFORMACION INSERTADA DE EMPLEADO'

INSERT INTO MetododePago(IDMetododePago,TipoMetododePago,DescripcionMetododePago,FechaMetododePago) VALUES(1,'Efectivo','Completo','2023-02-28');
INSERT INTO MetododePago(IDMetododePago,TipoMetododePago,DescripcionMetododePago,FechaMetododePago) VALUES(2,'Tarjeta','Completo','2022-09-30');
INSERT INTO MetododePago(IDMetododePago,TipoMetododePago,DescripcionMetododePago,FechaMetododePago) VALUES(3,'Simpe Movil','Completo','2023-04-30');
INSERT INTO MetododePago(IDMetododePago,TipoMetododePago,DescripcionMetododePago,FechaMetododePago) VALUES(4,'Efectivo','Completo','2023-01-12');
PRINT 'INFORMACION INSERTADA DE METODODEPAGO'

INSERT INTO Factura(ID_Codigo_Factura,Fecha_de_Factura,DetalleFactura,CantidadFactura,IDClientes,MontoVendido,IDEstado,IDMetododePago,IDEmpleado) VALUES(1,'2023-11-30','SE REALIZO UNA FACTURA DE LAPTOP HP',1,1,1500,1,1,001);
INSERT INTO Factura(ID_Codigo_Factura,Fecha_de_Factura,DetalleFactura,CantidadFactura,IDClientes,MontoVendido,IDEstado,IDMetododePago,IDEmpleado) VALUES(2,'2023-11-30','SE REALIZO UNA FACTURA DE UN TECLADO Y MOUSE',2,2,20000,2,2,200);
INSERT INTO Factura(ID_Codigo_Factura,Fecha_de_Factura,DetalleFactura,CantidadFactura,IDClientes,MontoVendido,IDEstado,IDMetododePago,IDEmpleado) VALUES(3,'2023-11-10','SE REALIZO UNA FACTURA DE IPHONE 15',1,3,9000,3,3,089);
INSERT INTO Factura(ID_Codigo_Factura,Fecha_de_Factura,DetalleFactura,CantidadFactura,IDClientes,MontoVendido,IDEstado,IDMetododePago,IDEmpleado) VALUES(4,'2023-12-01','SE REALIZO UNA FACTURA DE MONITOR',3,4,6000,4,4,003);
INSERT INTO Factura(ID_Codigo_Factura,Fecha_de_Factura,DetalleFactura,CantidadFactura,IDClientes,MontoVendido,IDEstado,IDMetododePago,IDEmpleado) VALUES(5,'2023-12-01','SE REALIZO UNA FACTURA DE IPHONE 15',1,3,12000,3,1,001);
INSERT INTO Factura(ID_Codigo_Factura,Fecha_de_Factura,DetalleFactura,CantidadFactura,IDClientes,MontoVendido,IDEstado,IDMetododePago,IDEmpleado) VALUES(6,'2023-12-05','SE REALIZO UNA FACTURA DE UN TECLADO Y MOUSE',1,3,20000,3,1,001);
PRINT 'INFORMACION INSERTADA DE FACTURA'

INSERT INTO Pedido(IDPedido,Fecha_de_Pedido,Cantidad) VALUES(1,'2023-01-30',1);
INSERT INTO Pedido(IDPedido,Fecha_de_Pedido,Cantidad) VALUES(2,'2022-08-20',2);
INSERT INTO Pedido(IDPedido,Fecha_de_Pedido,Cantidad) VALUES(3,'2023-01-10',1);
INSERT INTO Pedido(IDPedido,Fecha_de_Pedido,Cantidad) VALUES(4,'2024-05-20',3);
PRINT 'INFORMACION INSERTADA DE PEDIDO'


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

DECLARE @CodigoCliente INT
Set @CodigoCliente = 1

DECLARE @FechaInicio DateTime
SET @FechaInicio = DATEADD(month, -2, GETDATE())

DECLARE @FechaFin DateTime
SET @FechaFin = GETDATE()

SELECT
    C.IDClientes,
    C.NombreClientes + ' ' + C.ApellidoClientes NombreCompleto,
    F.ID_Codigo_Factura,
    F.Fecha_de_Factura,
	P.Fecha_de_Pedido
FROM
    Clientes C
    JOIN Factura F ON C.IDClientes = F.IDClientes
	INNER JOIN Pedido P ON F.ID_Codigo_Factura = P.IDPedido
WHERE
    C.IDClientes = @CodigoCliente AND 
	F.Fecha_de_Factura BETWEEN @FechaInicio AND @FechaFin;
PRINT 'Consulta 1 / Cantidad de facturas realizadas en un Rango de Fechas'
---------------------------------------------------------------------------------
SELECT
    F.ID_Codigo_Factura,
    F.Fecha_de_Factura,
    P.ID_Codigo_Producto,
    P.NombreProducto,
    P.Cantidad_en_stock_Producto AS CantidadFacturada
FROM
    Pedido PD
    JOIN Factura F ON PD.IDPedido = F.ID_Codigo_Factura
    JOIN Producto P ON PD.IDPedido = P.ID_Codigo_Producto
WHERE
    F.ID_Codigo_Factura = '2';

PRINT 'CONSULTA 2 / Listar todos los productos de una factura en específico'
---------------------------------------------------------------------------------
SELECT
    M.IDMetododePago,
    M.TipoMetododePago,
    SUM(F.MontoVendido) AS MontoTotalVendido
FROM
    MetododePago M
	INNER JOIN Factura F ON M.IDMetododePago = F.IDMetododePago
WHERE
    M.FechaMetododePago BETWEEN '2014-05-05' AND '2023-05-06'
GROUP BY
    M.IDMetododePago, M.TipoMetododePago;
PRINT 'Consulta 3 / Desplegar el monto vendido entre un rango de fechas por método de pago.'
-------------------------------------------------------------------------------
SELECT
    COUNT(*) AS CantidadFacturas,
    Fecha_de_Factura
FROM
    Factura
WHERE
    Fecha_de_Factura BETWEEN '2014-05-05' AND '2023-12-15'
GROUP BY
    Fecha_de_Factura;
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
