/** SE CREA LA BASE DE DATOS **/
CREATE DATABASE IF NOT EXISTS INVENTARIO_ELECTROTIENDA;

/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE INVENTARIO_ELECTROTIENDA;


/**TABLAS**/

CREATE TABLE Producto (
    ID_Codigo_Producto INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Descripcion VARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL, -- Cambiado a DECIMAL para almacenar valores de precios
    Cantidad_en_stock INT NOT NULL, -- Cambiado a INT para almacenar valores de cantidad como números enteros
    IDCategoria INT, -- Necesitas declarar esta columna antes de usarla en la FOREIGN KEY
    IDProveedor INT, -- Necesitas declarar esta columna antes de usarla en la FOREIGN KEY
    IDPromociones INT, -- Necesitas declarar esta columna antes de usarla en la FOREIGN KEY
    FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria),
    FOREIGN KEY (IDProveedor) REFERENCES Proveedor(IDProveedor),
    FOREIGN KEY (IDPromociones) REFERENCES Promociones(IDPromociones)
);
CREATE TABLE Categoria (
    IDCategoria INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Descripcion VARCHAR(100) NOT NULL,
	ID_Codigo_Producto INT,
    FOREIGN KEY (ID_Codigo_Producto) REFERENCES Producto(ID_Codigo_Producto)
);
CREATE TABLE Proveedor (
    IDProveedor INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Direccion VARCHAR(100) NOT NULL,
    NumeroDeTelefono VARCHAR(50),
    ID_Codigo_Producto INT,
    FOREIGN KEY (ID_Codigo_Producto) REFERENCES Producto(ID_Codigo_Producto)
);
CREATE TABLE Promociones (
    IDPromociones INT PRIMARY KEY,
    Descuento VARCHAR(50),
    Fecha_de_inicio VARCHAR(100) NOT NULL,
    Fecha_de_finalizacion VARCHAR(50),
    ID_Codigo_Producto INT,
    FOREIGN KEY (ID_Codigo_Producto) REFERENCES Producto(ID_Codigo_Producto)
);
