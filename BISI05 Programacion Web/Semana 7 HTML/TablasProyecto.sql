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
	cantidad INT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    cedula INT NOT NULL UNIQUE,
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
	id_usuario INT NOT NULL,
	id_producto INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);


CREATE TABLE Tarjetas (
    id_tarjeta INT IDENTITY(1,1) PRIMARY KEY,
    numero_tarjeta INT NOT NULL UNIQUE, 
    fecha_expiracion NVARCHAR(MAX) NOT NULL,
	CVV INT NOT NULL UNIQUE,
	id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
);

CREATE TABLE Compra (
    id_compra INT IDENTITY(1,1) PRIMARY KEY,  
    fecha DATETIME DEFAULT GETDATE() NOT NULL,
    precio_total DECIMAL(18, 2) NOT NULL,
	id_usuario INT NOT NULL,
	id_producto INT NOT NULL,
	id_tarjeta INT NOT NULL,
	--foreign keys
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
	FOREIGN KEY (id_tarjeta) REFERENCES Tarjetas(id_tarjeta)
);

CREATE TABLE EncabezadoFactura (
   id_encabezadoFactura INT IDENTITY(1,1) PRIMARY KEY, 
   --
   id_usuario INT NOT NULL,
   id_compra INT NOT NULL,
   --
   FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
   FOREIGN KEY (id_compra) REFERENCES Compra(id_compra),
);

CREATE TABLE DetalleFactura (
   id_detalleFactura INT IDENTITY(1,1) PRIMARY KEY,
   --
   id_encabezadoFactura INT NOT NULL,
   id_producto INT NOT NULL,
   id_compra INT NOT NULL,
   FOREIGN KEY (id_encabezadoFactura) REFERENCES encabezadoFactura(id_encabezadoFactura),
   FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
   FOREIGN KEY (id_compra) REFERENCES Compra(id_compra),
);

CREATE TABLE Factura (
   id_factura INT IDENTITY(1,1) PRIMARY KEY, 
   --
   id_detalleFactura  INT NOT NULL,
   id_encabezadoFactura  INT NOT NULL,
   FOREIGN KEY (id_encabezadoFactura) REFERENCES EncabezadoFactura(id_encabezadoFactura),
   FOREIGN KEY (id_detalleFactura) REFERENCES DetalleFactura(id_detalleFactura),
);
