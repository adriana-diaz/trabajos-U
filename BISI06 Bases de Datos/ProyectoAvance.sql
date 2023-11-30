/** SE CREA LA BASE DE DATOS **/
CREATE DATABASE IF NOT EXISTS INVENTARIO_ELECTROTIENDA;

/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE INVENTARIO_ELECTROTIENDA;


/**TABLAS revisadas**/
CREATE TABLE Categoria (
    IDCategoria INT,
    Nombre VARCHAR(50),
    Descripcion VARCHAR(100) NOT NULL,
	ID_Codigo_Producto INT,
    CONSTRAINT PK_Categoria PRIMARY KEY(IDCategoria)
);
CREATE TABLE Proveedor (
    IDProveedor INT,
    Nombre VARCHAR(50),
    Direccion VARCHAR(100) NOT NULL,
    NumeroDeTelefono VARCHAR(50),
    ID_Codigo_Producto INT,
    CONSTRAINT PK_Proveedor PRIMARY KEY(IDProveedor)
);
CREATE TABLE Promociones (
    IDPromociones INT,
    Descuento VARCHAR(50),
    Fecha_de_inicio VARCHAR(100) NOT NULL,
    Fecha_de_finalizacion VARCHAR(50),
    ID_Codigo_Producto INT,
    CONSTRAINT PK_Promociones PRIMARY KEY(IDPromociones)
);

CREATE TABLE Producto (
    ID_Codigo_Producto INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Descripcion VARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Cantidad_en_stock INT NOT NULL,
    IDCategoria INT,
    IDProveedor INT,
    IDPromociones INT,
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria),
    CONSTRAINT FK_Producto_Proveedor FOREIGN KEY (IDProveedor) REFERENCES Proveedor(IDProveedor),
    CONSTRAINT FK_Producto_Promociones FOREIGN KEY (IDPromociones) REFERENCES Promociones(IDPromociones)
);


