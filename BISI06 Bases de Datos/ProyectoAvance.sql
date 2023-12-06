/** SE CREA LA BASE DE DATOS **/
CREATE DATABASE IF NOT EXISTS INVENTARIO_ELECTROTIENDA;

/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE INVENTARIO_ELECTROTIENDA;


/**TABLAS**/
CREATE TABLE Categoria (
    IDCategoria INT,
    NombreCategoria VARCHAR(50),
    DescripcionCategoria VARCHAR(100) NOT NULL,
	ID_Codigo_Producto INT,
    CONSTRAINT PK_Categoria PRIMARY KEY(IDCategoria)
);
/**Insertar info en tabla categoria**/
INSERT INTO Categoria(IDCategoria,NombreCategoria,DescripcionCategoria) VALUES(1,'PANTALLAS','PANTALLAS DE TODOS LOS TIPOS');
INSERT INTO Categoria(IDCategoria,NombreCategoria,DescripcionCategoria) VALUES(2,'CELULARES','CELULARES NUEVOS Y USADOS');
INSERT INTO Categoria(IDCategoria,NombreCategoria,DescripcionCategoria) VALUES(3,'COMPUTADORAS','COMPUTADORAS NUEVOS Y USADOS');
INSERT INTO Categoria(IDCategoria,NombreCategoria,DescripcionCategoria) VALUES(4,'ELECTRONICOS','ELECTRONICOS PARA CADA DISPOSITIVO') ;
/**SELECTS CATEGORIA**/
SELECT * FROM Categoria;

CREATE TABLE Proveedor (
    IDProveedor INT,
    NombreProveedor VARCHAR(50),
    DireccionProveedor VARCHAR(100) NOT NULL,
    NumeroDeTelefonoProveedor VARCHAR(8),
    ID_Codigo_Producto INT,
    CONSTRAINT PK_Proveedor PRIMARY KEY(IDProveedor)
);
/**Insertar info en tabla Proveedor**/
INSERT INTO Proveedor(IDProveedor,NombreProveedor,DireccionProveedor,NumeroDeTelefonoProveedor) VALUES(1,'APPLE','COSTA RICA','89785634');
INSERT INTO Proveedor(IDProveedor,NombreProveedor,DireccionProveedor,NumeroDeTelefonoProveedor) VALUES(2,'SAMSUNG','COSTA RICA','12569818');
INSERT INTO Proveedor(IDProveedor,NombreProveedor,DireccionProveedor,NumeroDeTelefonoProveedor) VALUES(3,'XIAOMI','COSTA RICA','09785634');
INSERT INTO Proveedor(IDProveedor,NombreProveedor,DireccionProveedor,NumeroDeTelefonoProveedor) VALUES(4,'HUAWEI','COSTA RICA','98562356');
/**SELECTS Proveedor**/
SELECT * FROM Proveedor;

CREATE TABLE Promociones (
    IDPromociones INT,
    DescuentoPromociones VARCHAR(50),
    Fecha_de_inicio_Promociones datetime NOT NULL,
    Fecha_de_finalizacion_Promociones datetime NOT NULL,
    ID_Codigo_Producto INT,
    CONSTRAINT PK_Promociones PRIMARY KEY(IDPromociones)
);
/**Insertar info en tabla Promociones**/
INSERT INTO Promociones(IDPromociones,DescuentoPromociones,Fecha_de_inicio_Promociones,Fecha_de_finalizacion_Promociones) VALUES(1,'50% DE DESCUENTO','2023-01-20','2024-01-20');
INSERT INTO Promociones(IDPromociones,DescuentoPromociones,Fecha_de_inicio_Promociones,Fecha_de_finalizacion_Promociones) VALUES(2,'20% DE DESCUENTO','2023-02-20','2024-02-20');
INSERT INTO Promociones(IDPromociones,DescuentoPromociones,Fecha_de_inicio_Promociones,Fecha_de_finalizacion_Promociones) VALUES(3,'70% DE DESCUENTO','2023-03-20','2024-03-20');
INSERT INTO Promociones(IDPromociones,DescuentoPromociones,Fecha_de_inicio_Promociones,Fecha_de_finalizacion_Promociones) VALUES(4,'10% DE DESCUENTO','2023-04-20','2024-04-20');

/**SELECTS Promociones**/
SELECT * FROM Promociones;

CREATE TABLE Producto (
    ID_Codigo_Producto INT PRIMARY KEY,
    NombreProducto VARCHAR(50),
    DescripcionProducto VARCHAR(100) NOT NULL,
    Cantidad_en_stock_Producto INT NOT NULL,
    Costo DECIMAL(10, 2) NOT NULL,
    IDCategoria INT,
    IDProveedor INT,
    IDPromociones INT,
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria),
    CONSTRAINT FK_Producto_Proveedor FOREIGN KEY (IDProveedor) REFERENCES Proveedor(IDProveedor),
    CONSTRAINT FK_Producto_Promociones FOREIGN KEY (IDPromociones) REFERENCES Promociones(IDPromociones)
);
/**Insertar info en tabla Producto**/
INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto) VALUES(1,'IPHONE 15','ESTADO NUEVO','1000000','16');
INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto) VALUES(2,'HP LAPTOP','ESTADO NUEVO','2300000','90');
INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto) VALUES(3,'TV SAMSUNG','ESTADO NUEVO','890000','53');
INSERT INTO Producto(ID_Codigo_Producto,NombreProducto,DescripcionProducto,Costo,Cantidad_en_stock_Producto) VALUES(4,'CABLE TIPO C','ESTADO NUEVO','4450000','75');

/**SELECTS Producto**/
SELECT * FROM Producto;

/** Mostar para cada categoría el costo total de los productos asociados, el promedio, el
mínimo y el máximo. Mostrar el código de la categoría y los montos solicitados.**/
SELECT
    c.ID_Codigo_Producto AS Codigo_Categoria,
    c.NombreCategoria AS Categoria,
    SUM(p.Costo) AS CostoTotal,
    AVG(p.Costo) AS PromedioCosto,
    MIN(p.Costo) AS MinimoCosto,
    MAX(p.Costo) AS MaximoCosto
FROM
    Categoria c
JOIN
    Producto p ON c.ID_Codigo_Producto = p.ID_Codigo_Producto
GROUP BY
    c.ID_Codigo_Producto, c.NombreCategoria;

CREATE TABLE Estado (
    IDEstado INT,
    NombreEstado VARCHAR(50),
    DescripcionEstado VARCHAR(100) NOT NULL,
	ID_Codigo_Factura INT,
    CONSTRAINT PK_Estado PRIMARY KEY(IDEstado)
);
/**Insertar info en tabla Estado**/
INSERT INTO Estado(IDEstado,NombreEstado,DescripcionEstado) VALUES(1,'NUEVO','Comprado recientemente');
INSERT INTO Estado(IDEstado,NombreEstado,DescripcionEstado) VALUES(2,'NUEVO','Comprado hace un mes');
INSERT INTO Estado(IDEstado,NombreEstado,DescripcionEstado) VALUES(3,'NUEVO','Comprado recientemente');
INSERT INTO Estado(IDEstado,NombreEstado,DescripcionEstado) VALUES(4,'NUEVO','Comprado hace un mes');

/**SELECTS Estado**/
SELECT * FROM Estado;


CREATE TABLE Clientes (
    IDClientes INT,
    NombreClientes VARCHAR(50),
    ApellidoClientes VARCHAR(50),
    DireccionClientes VARCHAR(100) NOT NULL,
    NumeroDeTelefonoClientes VARCHAR(50),
    CorreoElectronicoClientes VARCHAR(50),
    ID_Codigo_Factura INT,
    CONSTRAINT PK_IDClientes PRIMARY KEY(IDClientes)
);
/**Insertar info en tabla Clientes**/
INSERT INTO Clientes(IDClientes,NombreClientes,ApellidoClientes,DireccionClientes,NumeroDeTelefonoClientes,CorreoElectronicoClientes) VALUES(1,'Adriana','Diaz','Heredia','89785634','adriana@gmail.com');
INSERT INTO Clientes(IDClientes,NombreClientes,ApellidoClientes,DireccionClientes,NumeroDeTelefonoClientes,CorreoElectronicoClientes) VALUES(2,'Maria','Martinez','San Jose','89098765','mariam@gmail.com');
INSERT INTO Clientes(IDClientes,NombreClientes,ApellidoClientes,DireccionClientes,NumeroDeTelefonoClientes,CorreoElectronicoClientes) VALUES(3,'Jose','Blanco','Cartago','23674356','joseb@hotmail.com');
INSERT INTO Clientes(IDClientes,NombreClientes,ApellidoClientes,DireccionClientes,NumeroDeTelefonoClientes,CorreoElectronicoClientes) VALUES(4,'Laura','Vargas','Puntarenas','12894356','lauravargas@hotmail.com');

/**SELECTS Clientes**/
SELECT * FROM Clientes;


CREATE TABLE Empleado (
    IDEmpleado INT,
    NombreEmpleado VARCHAR(50),
    ApellidoEmpleado VARCHAR(50),
	ID_Codigo_Factura INT,
    CONSTRAINT PK_IDEmpleado PRIMARY KEY(IDEmpleado)
);
/**Insertar info en tabla Empleado**/
INSERT INTO Empleado(IDEmpleado,NombreEmpleado,ApellidoEmpleado) VALUES(001,'Rodolfo','Diaz');
INSERT INTO Empleado(IDEmpleado,NombreEmpleado,ApellidoEmpleado) VALUES(200,'Pedro','Sanchez');
INSERT INTO Empleado(IDEmpleado,NombreEmpleado,ApellidoEmpleado) VALUES(089,'Jose','Murillo');
INSERT INTO Empleado(IDEmpleado,NombreEmpleado,ApellidoEmpleado) VALUES(003,'Raul','Cajina');

/**SELECTS Empleado**/
SELECT * FROM Empleado;

CREATE TABLE MetododePago (
    IDMetododePago INT,
    TipoMetododePago VARCHAR(50),
    DescripcionMetododePago VARCHAR(100) NOT NULL,
    MontoVendido INT NOT NULL,
    ID_Codigo_Factura INT,
    CONSTRAINT PK_IDMetododePago PRIMARY KEY(IDMetododePago),
    CONSTRAINT UQ_MetododePago_MontoVendido UNIQUE (MontoVendido)
);
/**Insertar info en tabla MetododePago**/
INSERT INTO MetododePago(IDMetododePago,TipoMetododePago,DescripcionMetododePago,MontoVendido) VALUES(1,'Efectivo','Completo','1500');
INSERT INTO MetododePago(IDMetododePago,TipoMetododePago,DescripcionMetododePago,MontoVendido) VALUES(2,'Tarjeta','Completo','20000');
INSERT INTO MetododePago(IDMetododePago,TipoMetododePago,DescripcionMetododePago,MontoVendido) VALUES(3,'Simpe Movil','Completo','9000');
INSERT INTO MetododePago(IDMetododePago,TipoMetododePago,DescripcionMetododePago,MontoVendido) VALUES(4,'Efectivo','Completo','6000');

/**SELECTS MetododePago**/
SELECT * FROM MetododePago;

CREATE TABLE Factura (
    IDFactura INT PRIMARY KEY,
    Fecha_de_Pedido_Factura DATETIME NOT NULL,
    DetalleFactura VARCHAR(100) NULL,
    CantidadFactura INT,
    IDClientes INT,
    MontoVendido INT,
    IDEstado INT,
    IDMetododePago INT,
    IDEmpleado INT,
    CONSTRAINT FK_Factura_Estado FOREIGN KEY (IDEstado) REFERENCES Estado(IDEstado),
    CONSTRAINT FK_Factura_MetododePago FOREIGN KEY (IDMetododePago) REFERENCES MetododePago(IDMetododePago),
    CONSTRAINT FK_Factura_Clientes FOREIGN KEY (IDClientes) REFERENCES Clientes(IDClientes),
    CONSTRAINT FK_Factura_Empleado FOREIGN KEY (IDEmpleado) REFERENCES Empleado(IDEmpleado),
    CONSTRAINT FK_Factura_MontoVendido FOREIGN KEY (MontoVendido) REFERENCES MetododePago(MontoVendido)
);
/**Insertar info en tabla Factura**/
INSERT INTO Factura(IDFactura,Fecha_de_Pedido_Factura,DetalleFactura,CantidadFactura) VALUES(1,'2023-01-30','SE REALIZO UNA FACTURA DE LAPTOP HP','1');
INSERT INTO Factura(IDFactura,Fecha_de_Pedido_Factura,DetalleFactura,CantidadFactura) VALUES(2,'2023-08-20','SE REALIZO UNA FACTURA DE UN TECLADO Y MOUSE','2');
INSERT INTO Factura(IDFactura,Fecha_de_Pedido_Factura,DetalleFactura,CantidadFactura) VALUES(3,'2023-01-10','SE REALIZO UNA FACTURA DE IPHONE 15','1');
INSERT INTO Factura(IDFactura,Fecha_de_Pedido_Factura,DetalleFactura,CantidadFactura) VALUES(4,'2023-05-20','SE REALIZO UNA FACTURA DE MONITOR','3');

/**SELECTS Factura**/
SELECT * FROM Factura;

CREATE TABLE Pedido (
    IDPedido INT PRIMARY KEY,
    Fecha_de_Pedido DATETIME NOT NULL,
    Cantidad INT,
    ID_Codigo_Producto INT,
    IDFactura INT,
    CONSTRAINT FK_Pedido_Producto FOREIGN KEY (ID_Codigo_Producto) REFERENCES Producto(ID_Codigo_Producto),
    CONSTRAINT FK_Pedido_Factura FOREIGN KEY (IDFactura) REFERENCES Factura(IDFactura)
);
/**Insertar info en tabla Pedido**/
INSERT INTO Pedido(IDPedido,Fecha_de_Pedido,Cantidad) VALUES(1,'2023-01-30','1');
INSERT INTO Pedido(IDPedido,Fecha_de_Pedido,Cantidad) VALUES(2,'2023-08-20','2');
INSERT INTO Pedido(IDPedido,Fecha_de_Pedido,Cantidad) VALUES(3,'2023-01-10','1');
INSERT INTO Pedido(IDPedido,Fecha_de_Pedido,Cantidad) VALUES(4,'2023-05-20','3');
/**SELECTS Pedido**/
SELECT * FROM Pedido;

DROP DATABASE INVENTARIO_ELECTROTIENDA;
