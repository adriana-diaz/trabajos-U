--Universidad Latina de Costa Rica
--Curso : BISI35 Administracion de Bases de Datos
--Autora : Adriana Diaz Vargas 
--Profesor : Alejandro Serrano Perez
--Lab 1
--Fecha : 14/05/25

--indicaciones 
--1. Cree la base de datos con el nombre BDVentasTecnica
--2. Cree las tablas adjuntas, recuerde utilizar correctamente el tipo de dato según corresponda
--3. Cree las relaciones de PK y FK
--4. Inserte 15 registros a cada tabla
--5. Haga un select a cada una de las tablas con sus registros, adjunte captura
--6. Haga un select de dos tablas haciendo uso de join, adjunte captura
--7. Respalde la base de datos con el nombre VentasL1.bak conserve el archivo para el Lab2.

--creacion de la bd
Create database BDVentasTecnica
use BDVentasTecnica

--Tablas

--tabla provincia
Create table Provincia (
CodigoProvincia int PRIMARY KEY,
NombreProvincia varchar(100),
);
--tabla Sucursal
Create table Sucursal (
Codigo_Sucursal varchar(100) PRIMARY KEY,
Nombre_Sucursal varchar(100),
CodigoProvincia int,
Cantón varchar(100),
Distrito varchar(100),
Meta_mensual float,
IDGerente varchar(100),
FOREIGN KEY (CodigoProvincia) REFERENCES Provincia(CodigoProvincia)
);
--tabla Vendedor
Create table Vendedor (
ID_Vendedor varchar(100) PRIMARY KEY,
Cedula_Vendedor varchar(100),
Nombre_Vendedor varchar(100),
Apellido1_Vendedor varchar(100),
Apellido2_Vendedor varchar(100),
Edad_Vendedor int,
Cargo_Vendedor varchar(100),
Correo_Vendedor varchar(100),
Fecha_ingreso_Vendedor date,
Sucursal varchar(100),
FOREIGN KEY (Sucursal) REFERENCES Sucursal(Codigo_Sucursal)
);
--tabla Producto
create table Producto (
ID_Producto varchar(100) primary key,
Marca varchar(100),
Modelo varchar(100),
Descripción varchar(100),
Precio int,
Stock int,
Imagen varbinary(max)
);
--tabla Cliente
create table Cliente (
ID_Cliente varchar(100) primary key,
Cedula_Cliente varchar(100),
Nombre_Cliente varchar(100),
Apellido1_Cliente varchar(100),
Apellido2_Cliente varchar(100),
Correo_Cliente varchar(100),
Celular_Cliente varchar(8)
);
--tabla Detalle_factura
create table Detalle_factura (
ID_Factura int primary key,
Producto varchar(100),
Cantidad int,
Total int,
FOREIGN KEY (Producto) REFERENCES Producto(ID_Producto)
);
--tabla Venta
create table Venta (
ID_Venta int primary key,
ID_Detalle_Factura int,
Fecha date,
Total int,
Cliente varchar(100),
Vendedor varchar(100),
    FOREIGN KEY (ID_Detalle_Factura) REFERENCES Detalle_factura(ID_Factura),
    FOREIGN KEY (Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (Vendedor) REFERENCES Vendedor(ID_Vendedor)
);

--registros de la tabla provincia
INSERT INTO Provincia (CodigoProvincia, NombreProvincia) VALUES
(1, 'San Jose'),
(2, 'Heredia'),
(3, 'Cartago'),
(4, 'Guanacaste'),
(5, 'Limon'),
(6, 'Puntarenas'),
(7, 'Alajuela'),
(8, 'Veracruz'),
(9, 'Yucatán'),
(10, 'Barcelona'),
(11, 'Sevilla'),
(12, 'Madrid'),
(13, 'British'),
(14, 'Columbia'),
(15, 'Alberta');
GO

select * from Provincia

--registros de la tabla sucursal 
INSERT INTO Sucursal
  (Codigo_Sucursal, Nombre_Sucursal, CodigoProvincia, Cantón, Distrito, Meta_mensual, IDGerente)
VALUES
('SUC001',  'Sucursal San José',          1,  'San José',        'Catedral',        10000.00, 'GER001'),
('SUC002',  'Sucursal Escazú',            2,  'Escazú',          'Escazú',          11000.00, 'GER002'),
('SUC003',  'Sucursal Desamparados',      3,  'Desamparados',    'Desamparados',    12000.00, 'GER003'),
('SUC004',  'Sucursal Alajuelita',        4,  'Alajuelita',      'San Felipe',      13000.00, 'GER004'),
('SUC005',  'Sucursal Goicoechea',        5,  'Goicoechea',      'Guadalupe',       14000.00, 'GER005'),
('SUC006',  'Sucursal Montes de Oca',     6,  'Montes de Oca',   'San Pedro',       15000.00, 'GER006'),
('SUC007',  'Sucursal Curridabat',        7,  'Curridabat',      'Curridabat',      16000.00, 'GER007'),
('SUC008',  'Sucursal Tibás',             8,  'Tibás',           'San Juan',        17000.00, 'GER008'),
('SUC009',  'Sucursal Moravia',           9,  'Moravia',         'San Vicente',     18000.00, 'GER009'),
('SUC010',  'Sucursal Santa Ana',        10,  'Santa Ana',       'Santa Ana',       19000.00, 'GER010'),
('SUC011',  'Sucursal Alajuela',         11,  'Alajuela',        'Alajuela',        20000.00, 'GER011'),
('SUC012',  'Sucursal Heredia',          12,  'Heredia',         'Heredia',         21000.00, 'GER012'),
('SUC013',  'Sucursal Santo Domingo',    13,  'Santo Domingo',   'Santo Domingo',   22000.00, 'GER013'),
('SUC014',  'Sucursal San Pablo',        14,  'San Pablo',       'San Pablo',       23000.00, 'GER014'),
('SUC015',  'Sucursal Cartago',          15,  'Cartago',         'Occidental',      24000.00, 'GER015');
GO
select * from Sucursal

--registros de la tabla vendedor

INSERT INTO Vendedor
  (ID_Vendedor, Cedula_Vendedor, Nombre_Vendedor, Apellido1_Vendedor, Apellido2_Vendedor, Edad_Vendedor, Cargo_Vendedor, Correo_Vendedor, Fecha_ingreso_Vendedor, Sucursal)
VALUES
('VEN001',  '100000001', 'Adriana',    'Diaz', 'Vargas', 26, 'Asesor',     'adriana.diaz@empresa.com',    '2025-05-01', 'SUC001'),
('VEN002',  '100000002', 'Emmanuel',   'Diaz', 'Vargas', 27, 'Ejecutivo',  'emmanuel.diaz@empresa.com',   '2025-05-02', 'SUC002'),
('VEN003',  '100000003', 'Jorge',      'Diaz', 'Vargas', 28, 'Supervisor', 'jorge.diaz@empresa.com',      '2025-05-03', 'SUC003'),
('VEN004',  '100000004', 'Lorenzo',    'Diaz', 'Vargas', 29, 'Asesor',     'lorenzo.diaz@empresa.com',    '2025-05-04', 'SUC004'),
('VEN005',  '100000005', 'Randall',    'Diaz', 'Vargas', 30, 'Ejecutivo',  'randall.diaz@empresa.com',    '2025-05-05', 'SUC005'),
('VEN006',  '100000006', 'Ignacio',    'Diaz', 'Vargas', 31, 'Supervisor', 'ignacio.diaz@empresa.com',    '2025-05-06', 'SUC006'),
('VEN007',  '100000007', 'Valeria',    'Diaz', 'Vargas', 32, 'Asesor',     'valeria.diaz@empresa.com',    '2025-05-07', 'SUC007'),
('VEN008',  '100000008', 'Sebastian',  'Diaz', 'Vargas', 33, 'Ejecutivo',  'sebastian.diaz@empresa.com',  '2025-05-08', 'SUC008'),
('VEN009',  '100000009', 'Rodolfo',    'Diaz', 'Vargas', 34, 'Supervisor', 'rodolfo.diaz@empresa.com',    '2025-05-09', 'SUC009'),
('VEN010',  '100000010', 'Paola',      'Diaz', 'Vargas', 35, 'Asesor',     'paola.diaz@empresa.com',      '2025-05-10', 'SUC010'),
('VEN011',  '100000011', 'Tatiana',    'Diaz', 'Vargas', 36, 'Ejecutivo',  'tatiana.diaz@empresa.com',    '2025-05-11', 'SUC011'),
('VEN012',  '100000012', 'Melissa',    'Diaz', 'Vargas', 37, 'Supervisor', 'melissa.diaz@empresa.com',    '2025-05-12', 'SUC012'),
('VEN013',  '100000013', 'Gloriana',   'Diaz', 'Vargas', 38, 'Asesor',     'gloriana.diaz@empresa.com',   '2025-05-13', 'SUC013'),
('VEN014',  '100000014', 'Fiorella',   'Diaz', 'Vargas', 39, 'Ejecutivo',  'fiorella.diaz@empresa.com',   '2025-05-14', 'SUC014'),
('VEN015',  '100000015', 'Zoe',        'Diaz', 'Vargas', 40, 'Supervisor', 'zoe.diaz@empresa.com',        '2025-05-15', 'SUC015');
GO
select * from Vendedor

--registros de la tabla de Productos
INSERT INTO Producto
  (ID_Producto, Marca, Modelo, [Descripción], Precio, Stock, Imagen)
VALUES
('PROD001',  'L''Oreal',   'Modelo 1',  'Producto de belleza 1',  5100, 15, NULL),
('PROD002',  'Maybelline','Modelo 2',  'Producto de belleza 2',  5200, 20, NULL),
('PROD003',  'Revlon',    'Modelo 3',  'Producto de belleza 3',  5300, 25, NULL),
('PROD004',  'Nivea',     'Modelo 4',  'Producto de belleza 4',  5400, 30, NULL),
('PROD005',  'Neutrogena','Modelo 5',  'Producto de belleza 5',  5500, 35, NULL),
('PROD006',  'L''Oreal',   'Modelo 6',  'Producto de belleza 6',  5600, 40, NULL),
('PROD007',  'Maybelline','Modelo 7',  'Producto de belleza 7',  5700, 45, NULL),
('PROD008',  'Revlon',    'Modelo 8',  'Producto de belleza 8',  5800, 50, NULL),
('PROD009',  'Nivea',     'Modelo 9',  'Producto de belleza 9',  5900, 55, NULL),
('PROD010', 'Neutrogena','Modelo 10', 'Producto de belleza 10', 6000, 60, NULL),
('PROD011', 'L''Oreal',   'Modelo 11', 'Producto de belleza 11', 6100, 65, NULL),
('PROD012', 'Maybelline','Modelo 12', 'Producto de belleza 12', 6200, 70, NULL),
('PROD013', 'Revlon',    'Modelo 13', 'Producto de belleza 13', 6300, 75, NULL),
('PROD014', 'Nivea',     'Modelo 14', 'Producto de belleza 14', 6400, 80, NULL),
('PROD015', 'Neutrogena','Modelo 15', 'Producto de belleza 15', 6500, 85, NULL);
GO
select * from Producto

--registros de la tabla de cliente
INSERT INTO Cliente
  (ID_Cliente, Cedula_Cliente, Nombre_Cliente, Apellido1_Cliente, Apellido2_Cliente, Correo_Cliente, Celular_Cliente)
VALUES
('CLI001', '119320150', 'Carlos',     'Soto',    'Ramírez', 'carlos.soto@correo.com',     '89109876'),
('CLI002', '118540233', 'María',      'Jiménez', 'López',   'maria.jimenez@correo.com',   '88451234'),
('CLI003', '117289654', 'Luis',       'Castro',  'Mora',    'luis.castro@correo.com',     '87562345'),
('CLI004', '118932104', 'Andrea',     'Vargas',  'Solís',   'andrea.vargas@correo.com',   '89781236'),
('CLI005', '119876321', 'Esteban',    'Zúñiga',  'Pérez',   'esteban.zuniga@correo.com',  '89123456'),
('CLI006', '119453786', 'Daniela',    'Hernández','Cruz',   'daniela.hernandez@correo.com','88234567'),
('CLI007', '117654829', 'José',       'Rodríguez','Rojas',  'jose.rodriguez@correo.com',  '89987654'),
('CLI008', '118234567', 'Sofía',      'Mejía',   'Campos',  'sofia.mejia@correo.com',     '88671234'),
('CLI009', '119765432', 'Mauricio',   'Alvarado','Vega',    'mauricio.alvarado@correo.com','86543218'),
('CLI010', '119003214', 'Isabel',     'Fonseca', 'Núñez',   'isabel.fonseca@correo.com',  '88112233'),
('CLI011', '116789432', 'Diego',      'Monge',   'Chaves',  'diego.monge@correo.com',     '89334455'),
('CLI012', '117112233', 'Camila',     'Ureña',   'Gómez',   'camila.urena@correo.com',    '87775544'),
('CLI013', '118998877', 'Ricardo',    'Cordero', 'Salas',   'ricardo.cordero@correo.com', '89001122'),
('CLI014', '119101010', 'Natalia',    'Pizarro', 'León',    'natalia.pizarro@correo.com', '88336677'),
('CLI015', '119555888', 'Fernando',   'Marín',   'Delgado', 'fernando.marin@correo.com',  '86551133');
GO



--registros de la tabla Detalles de factura
INSERT INTO Detalle_factura (ID_Factura, Producto, Cantidad, Total) VALUES
(1,  'PROD001',  2,  10200),
(2,  'PROD002',  3,  15600),
(3,  'PROD003',  4,  21200),
(4,  'PROD004',  5,  27000),
(5,  'PROD005',  1,   5500),
(6,  'PROD006',  2,  11200),
(7,  'PROD007',  3,  17100),
(8,  'PROD008',  4,  23200),
(9,  'PROD009',  5,  29500),
(10, 'PROD010', 1,   6000),
(11, 'PROD011', 2,  12200),
(12, 'PROD012', 3,  18600),
(13, 'PROD013', 4,  25200),
(14, 'PROD014', 5,  32000),
(15, 'PROD015', 1,   6500);
GO

--registros de la tabla de Ventas
INSERT INTO Venta (ID_Venta, ID_Detalle_Factura, Fecha, Total, Cliente, Vendedor) VALUES
(1,  1,  '2025-05-01', 10200, 'CLI001',  'VEN001'),
(2,  2,  '2025-05-02', 15600, 'CLI002',  'VEN002'),
(3,  3,  '2025-05-03', 21200, 'CLI003',  'VEN003'),
(4,  4,  '2025-05-04', 27000, 'CLI004',  'VEN004'),
(5,  5,  '2025-05-05',  5500, 'CLI005',  'VEN005'),
(6,  6,  '2025-05-06', 11200, 'CLI006',  'VEN006'),
(7,  7,  '2025-05-07', 17100, 'CLI007',  'VEN007'),
(8,  8,  '2025-05-08', 23200, 'CLI008',  'VEN008'),
(9,  9,  '2025-05-09', 29500, 'CLI009',  'VEN009'),
(10, 10, '2025-05-10',  6000, 'CLI010', 'VEN010'),
(11, 11, '2025-05-11', 12200, 'CLI011', 'VEN011'),
(12, 12, '2025-05-12', 18600, 'CLI012', 'VEN012'),
(13, 13, '2025-05-13', 25200, 'CLI013', 'VEN013'),
(14, 14, '2025-05-14', 32000, 'CLI014', 'VEN014'),
(15, 15, '2025-05-15',  6500, 'CLI015', 'VEN015');
GO
--Los selects 

-- Seleccionar todos los registros de la tabla Provincia
SELECT * FROM Provincia;

-- Seleccionar todos los registros de la tabla Sucursal
SELECT * FROM Sucursal;

-- Seleccionar todos los registros de la tabla Vendedor
SELECT * FROM Vendedor;

-- Seleccionar todos los registros de la tabla Cliente
SELECT * FROM Cliente;

-- Seleccionar todos los registros de la tabla Producto
SELECT * FROM Producto;

-- Seleccionar todos los registros de la tabla Detalle_factura
SELECT * FROM Detalle_factura;

-- Seleccionar todos los registros de la tabla Venta
SELECT * FROM Venta;


--Select de dos tablas haciendo uso de join
SELECT 
    V.ID_Venta,
    C.Nombre_Cliente,
    C.Apellido1_Cliente,
    V.Fecha,
    V.Total
FROM Venta V
JOIN Cliente C ON V.Cliente = C.ID_Cliente;


--backup completo de la base de datos
backup database BDVentasTecnica to disk = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\Lab1AdrianaDiazVargas.bak' ;