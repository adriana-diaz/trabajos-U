/** SE CREA LA BASE DE DATOS **/
CREATE DATABASE IF NOT EXISTS INVENTARIO_ELECTROTIENDA;

/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE INVENTARIO_ELECTROTIENDA;


/**TABLAS revisadas**/
CREATE TABLE Categoria (
    IDCategoria INT,
    NombreCategoria VARCHAR(50),
    DescripcionCategoria VARCHAR(100) NOT NULL,
	ID_Codigo_Producto INT,
    CONSTRAINT PK_Categoria PRIMARY KEY(IDCategoria)
);
CREATE TABLE Proveedor (
    IDProveedor INT,
    NombreProveedor VARCHAR(50),
    DireccionProveedor VARCHAR(100) NOT NULL,
    NumeroDeTelefonoProveedor VARCHAR(50),
    ID_Codigo_Producto INT,
    CONSTRAINT PK_Proveedor PRIMARY KEY(IDProveedor)
);
CREATE TABLE Promociones (
    IDPromociones INT,
    DescuentoPromociones VARCHAR(50),
    Fecha_de_inicio_Promociones datetime NOT NULL,
    Fecha_de_finalizacion_Promociones datetime NOT NULL,
    ID_Codigo_Producto INT,
    CONSTRAINT PK_Promociones PRIMARY KEY(IDPromociones)
);

CREATE TABLE Producto (
    ID_Codigo_Producto INT PRIMARY KEY,
    NombreProducto VARCHAR(50),
    DescripcionProducto VARCHAR(100) NOT NULL,
    PrecioProducto INT NOT NULL,
    Cantidad_en_stock_Producto INT NOT NULL,
    IDCategoria INT,
    IDProveedor INT,
    IDPromociones INT,
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria),
    CONSTRAINT FK_Producto_Proveedor FOREIGN KEY (IDProveedor) REFERENCES Proveedor(IDProveedor),
    CONSTRAINT FK_Producto_Promociones FOREIGN KEY (IDPromociones) REFERENCES Promociones(IDPromociones)
);

CREATE TABLE Estado (
    IDEstado INT,
    NombreEstado VARCHAR(50),
    DescripcionEstado VARCHAR(100) NOT NULL,
	ID_Codigo_Factura INT,
    CONSTRAINT PK_Estado PRIMARY KEY(IDEstado)
);

CREATE TABLE Clientes (
    IDClientes INT,
    NombreClientes VARCHAR(50),
    ApellidoClientes VARCHAR(50),
    DireccionClientes VARCHAR(100) NOT NULL,
    NumeroDeTelefonoClientes VARCHAR(50),
    CorreoElectronicoClientes VARCHAR(50),
    ID_Codigo_Factura INT,
    CONSTRAINT PK_IDClientes PRIMARY KEY(IDClientes,NombreClientes)
);

CREATE TABLE MetododePago (
    IDMetododePago INT,
    TipoMetododePago VARCHAR(50),
    DescripcionMetododePago VARCHAR(100) NOT NULL,
	ID_Codigo_Factura INT,
    CONSTRAINT PK_IDMetododePago PRIMARY KEY(IDMetododePago)
);

CREATE TABLE Empleado (
    IDEmpleado INT,
    NombreEmpleado VARCHAR(50),
    ApellidoEmpleado VARCHAR(50),
	ID_Codigo_Factura INT,
    CONSTRAINT PK_IDEmpleado PRIMARY KEY(IDEmpleado)
);
/**TABLAS NO revisadas**/
CREATE TABLE Factura (
    FacturaID INT PRIMARY KEY,
    Fecha_de_Pedido_Factura DATETIME NOT NULL,
    Detalle VARCHAR(100) NULL,
    Cantidad INT,
    IDClientes INT,
    NombreClientes VARCHAR(100) NULL,
    IDEstado INT,
    IDMetododePago INT,
    IDEmpleado INT,
    CONSTRAINT FK_Factura_Estado FOREIGN KEY (IDEstado) REFERENCES Estado(IDEstado),
    CONSTRAINT FK_Factura_MetododePago FOREIGN KEY (IDMetododePago) REFERENCES MetododePago(IDMetododePago),
    CONSTRAINT FK_Factura_Clientes FOREIGN KEY (IDClientes, NombreClientes) REFERENCES Clientes(IDClientes, NombreClientes),
    CONSTRAINT FK_Factura_Empleado FOREIGN KEY (IDEmpleado) REFERENCES Empleado(IDEmpleado)
);

DROP TABLE Clientes;
