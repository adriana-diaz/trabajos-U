--CLASE 14
--Universidad Latina de Costa Rica
--Curso : BISI35 Administracion de Bases de Datos
--Autora : Adriana Diaz Vargas 
--Profesor : Alejandro Serrano Perez
--Lab 14
--Fecha : 11/08/25
-- clase 14

--Cree una base de datos llamada LabFinal
-- Paso 1: Crear la base de datos LabFinal
--paso 2 Cree 3 archivos con sus respectivos filegroups en el disco C con sus nombres ClaseF_Primary, ClaseF_Log, ClaseF_NDF
--paso 3 : 3 Para los grupos lógicos asigne un tamaño de 50MB y un crecimiento de archivo del 10%, para el log 40mb y 8%, para el adicional 30mb y 5%

CREATE DATABASE LabFinal
ON PRIMARY 
(
    NAME = 'ClaseF_Primary',
    FILENAME = 'C:\ADBD\ClaseF_Primary.mdf',
    SIZE = 50MB,
    FILEGROWTH = 10%
),
FILEGROUP ArchivoAdicional 
(
    NAME = 'ClaseF_NDF',
    FILENAME = 'C:\ADBD\ClaseF_NDF.ndf',
    SIZE = 30MB,
    FILEGROWTH = 5%
)
LOG ON --archivo de logs .ldf
(
    NAME = 'ClaseF_Log',
    FILENAME = 'C:\ADBD\ClaseF_Log.ldf',
    SIZE = 40MB,
    FILEGROWTH = 8%
);
GO
-- 4 Modifique el filegroup del primario ClaseF_Primary a ClaseF_ADD
--create archivo adicional (con sus respectivos tamaños segun las  indicaciones)
ALTER DATABASE LabFinal
ADD FILEGROUP ClaseF_ADD; -- grupo de archivos lógico
GO

-- Crear archivo adicional dentro del filegroup ClaseF_ADD
ALTER DATABASE LabFinal
ADD FILE 
(
    NAME = 'ClaseF_ADD',
    FILENAME = 'C:\ADBD\ClaseF_ADD.ndf',
      SIZE = 50MB,
    FILEGROWTH = 10%
)
TO FILEGROUP ClaseF_ADD;
GO
--Establecer ClaseF_ADD como el filegroup predeterminado
ALTER DATABASE LabFinal
MODIFY FILEGROUP ClaseF_ADD DEFAULT;
GO

--paso 5 Cree el login ADSQL
USE master;
GO

CREATE LOGIN ADSQL 
WITH PASSWORD = 'ADSQLUser123',
CHECK_EXPIRATION = ON,
CHECK_POLICY = ON;
GO

USE LabFinal;
GO

CREATE USER ADSQL FOR LOGIN ADSQL;
GO
--6 Cree el esquema PracticaParte1 para el login ADSQL;
CREATE SCHEMA PracticaParte1 AUTHORIZATION ADSQL;
GO

--7 Cree las tablas Genero_Pelicula, Productora, en la tabla productora declare al menos 1 campo en default = ('Fecha')

CREATE TABLE PracticaParte1.Genero_Pelicula (
    IDGenero INT PRIMARY KEY IDENTITY(1,1),
    NombreGenero VARCHAR(50) NOT NULL UNIQUE
);
GO
CREATE TABLE PracticaParte1.Productora (
    IDProductora INT PRIMARY KEY IDENTITY(1,1),
    NombreProductora VARCHAR(100) NOT NULL UNIQUE,
    PaisOrigen VARCHAR(50),
    FechaRegistro DATE DEFAULT (GETDATE()) -- Campo con valor por default
);
GO
--paso 8
-- Crear tabla Pelicula con relaciones y constraints directos
CREATE TABLE PracticaParte1.Pelicula (
    IDPelicula INT PRIMARY KEY IDENTITY(1,1),
    Titulo VARCHAR(100) NOT NULL,
    AnnoLanzamiento datetime NOT NULL,
    IDGenero INT NOT NULL,
    IDProductora INT NOT NULL,
    CONSTRAINT FK_Pelicula_Genero FOREIGN KEY (IDGenero) REFERENCES PracticaParte1.Genero_Pelicula(IDGenero),
    CONSTRAINT FK_Pelicula_Productora FOREIGN KEY (IDProductora) REFERENCES PracticaParte1.Productora(IDProductora)
);
GO
--9 Inserte 5 registros a las tablas genero y productora respectivamente, 90 registros a la tabla película (puede hacer uso de IA para generar los registros)
INSERT INTO PracticaParte1.Genero_Pelicula (NombreGenero) VALUES ('Acción');
INSERT INTO PracticaParte1.Genero_Pelicula (NombreGenero) VALUES ('Comedia');
INSERT INTO PracticaParte1.Genero_Pelicula (NombreGenero) VALUES ('Drama');
INSERT INTO PracticaParte1.Genero_Pelicula (NombreGenero) VALUES ('Terror');
INSERT INTO PracticaParte1.Genero_Pelicula (NombreGenero) VALUES ('Ciencia Ficción');
INSERT INTO PracticaParte1.Productora (NombreProductora, PaisOrigen) VALUES ('Warner Bros', 'Estados Unidos');
INSERT INTO PracticaParte1.Productora (NombreProductora, PaisOrigen) VALUES ('Universal Pictures', 'Estados Unidos');
INSERT INTO PracticaParte1.Productora (NombreProductora, PaisOrigen) VALUES ('Paramount', 'Estados Unidos');
INSERT INTO PracticaParte1.Productora (NombreProductora, PaisOrigen) VALUES ('Sony Pictures', 'Japón');
INSERT INTO PracticaParte1.Productora (NombreProductora, PaisOrigen) VALUES ('Netflix Studios', 'Estados Unidos');
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Misión Fantasma 87', '2022-05-12', 2, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Sombra Letal 39', '2005-05-31', 1, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Rastro de Sangre 47', '1997-10-07', 3, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Más Allá del Miedo 72', '1993-04-29', 1, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Furia Silenciosa 95', '2018-04-22', 2, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Caída Libre 7', '2018-08-05', 3, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Ecos del Pasado 76', '2007-04-04', 2, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Laberinto Mortal 4', '2022-11-12', 3, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Furia Silenciosa 51', '2006-08-24', 4, 5);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Punto de Quiebre 25', '2008-12-27', 5, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Más Allá del Miedo 95', '2014-06-13', 1, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Misión Fantasma 20', '1996-11-01', 5, 5);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Misión Fantasma 14', '2013-02-08', 1, 1);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Horizonte Rojo 38', '2004-01-01', 1, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Punto de Quiebre 28', '1994-03-01', 1, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('La Última Puerta 92', '2018-03-16', 1, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Horizonte Rojo 15', '2011-07-06', 3, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('El Regreso 86', '1995-11-16', 3, 1);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Invasión 28', '1991-06-01', 2, 5);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Sin Retorno 19', '2019-01-18', 2, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Código Oculto 88', '2020-11-19', 2, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('El Regreso 82', '1994-05-07', 4, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Caída Libre 23', '2008-09-28', 1, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Rastro de Sangre 81', '1996-02-24', 5, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('La Última Puerta 77', '2024-12-07', 5, 5);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Horizonte Rojo 76', '2005-02-27', 3, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Rastro de Sangre 24', '2012-11-20', 5, 1);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('La Cúpula 71', '2020-02-07', 5, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Misión Fantasma 47', '1994-11-21', 4, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Sin Retorno 55', '2009-12-05', 1, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Tiempo de Venganza 78', '2006-09-08', 3, 1);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Invasión 62', '2006-05-11', 2, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('La Cúpula 40', '1993-03-01', 2, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('La Conspiración 87', '2018-09-27', 5, 1);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('La Cúpula 10', '2003-07-30', 3, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Sombra Letal 3', '1994-06-16', 5, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Más Allá del Miedo 34', '2007-03-26', 5, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Código Oculto 82', '2017-12-24', 4, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Horizonte Rojo 58', '1996-02-05', 3, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Invasión 6', '2010-07-21', 2, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Sin Retorno 12', '1998-03-15', 3, 5);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Tiempo de Venganza 19', '1999-07-25', 3, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Más Allá del Miedo 65', '2011-09-13', 2, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('El Regreso 15', '2020-11-06', 2, 5);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Invasión 99', '2009-10-11', 5, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Rastro de Sangre 44', '2022-05-06', 4, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Destino Final 47', '2001-11-15', 2, 5);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Invasión 78', '2001-01-16', 4, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Caída Libre 70', '2002-05-25', 1, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Destino Final 63', '2006-04-29', 1, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('El Regreso 53', '2012-12-17', 4, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Rastro de Sangre 16', '2021-02-11', 4, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('La Cúpula 38', '2011-08-14', 3, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Destino Final 96', '2012-10-22', 4, 1);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Rastro de Sangre 96', '2000-02-18', 3, 1);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Furia Silenciosa 15', '1999-03-01', 3, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Horizonte Rojo 68', '2014-10-17', 4, 1);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Caída Libre 90', '2003-06-24', 4, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Destino Final 45', '2009-02-27', 5, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Sombra Letal 13', '2009-11-03', 3, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Laberinto Mortal 23', '2018-09-14', 1, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Rastro de Sangre 36', '1990-08-31', 4, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Laberinto Mortal 33', '2000-01-17', 4, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('El Regreso 36', '2024-08-09', 4, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Laberinto Mortal 5', '1992-09-23', 1, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Caída Libre 58', '1992-03-27', 5, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Sin Retorno 80', '2000-08-30', 5, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Sueños Rotos 32', '2015-01-12', 3, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Invasión 1', '2010-10-06', 1, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Rastro de Sangre 12', '2013-02-24', 5, 1);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Furia Silenciosa 44', '2003-12-27', 2, 1);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Tiempo de Venganza 98', '2004-05-05', 1, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Sin Retorno 29', '1996-01-07', 1, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('El Regreso 3', '2018-05-07', 1, 1);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('El Regreso 63', '2016-05-05', 4, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Caída Libre 65', '2006-09-06', 4, 5);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('La Conspiración 27', '2003-02-23', 3, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Código Oculto 8', '1997-07-18', 5, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Rastro de Sangre 23', '2018-12-30', 3, 5);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Sin Retorno 92', '2014-09-22', 3, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Invasión 22', '2024-04-13', 5, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Ecos del Pasado 68', '2011-04-27', 4, 5);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Sueños Rotos 24', '2015-07-22', 2, 4);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Invasión 42', '2012-12-27', 2, 5);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Misión Fantasma 21', '2006-01-03', 2, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('El Regreso 64', '2022-07-04', 5, 5);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Sombra Letal 30', '2004-06-28', 3, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Código Oculto 49', '2009-06-28', 2, 2);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('Laberinto Mortal 15', '2004-01-14', 1, 3);
INSERT INTO PracticaParte1.Pelicula (Titulo, AnnoLanzamiento, IDGenero, IDProductora) VALUES ('La Última Puerta 73', '2012-03-10', 2, 3);

--pruebitas
select * from PracticaParte1.Pelicula
select * from PracticaParte1.Productora
select * from PracticaParte1.Genero_Pelicula

--10 Cree 3 archivos adicionales para realizar una partición de la tabla película, adjunte captura
USE master;
GO
--aqui creamos nuevos filgruops con un nombre basico jaja FG_Part1,2,3
ALTER DATABASE LabFinal 
ADD FILEGROUP FG_Part1;
GO
ALTER DATABASE LabFinal 
ADD FILEGROUP FG_Part2;
GO
ALTER DATABASE LabFinal 
ADD FILEGROUP FG_Part3;
GO
--aqui los cree todos con 30 mb de tamaño y 10 de filegrowth
ALTER DATABASE LabFinal 
ADD FILE (
    NAME = 'ArchivoPart1',
    FILENAME = 'C:\ADBD\ArchivoPart1.ndf',
   SIZE = 30MB,
    FILEGROWTH = 10%
) TO FILEGROUP FG_Part1;--filegruop 1
GO

ALTER DATABASE LabFinal 
ADD FILE (
   NAME = 'ArchivoPart2',
    FILENAME = 'C:\ADBD\ArchivoPart2.ndf',
    SIZE = 30MB,
    FILEGROWTH = 10%
) TO FILEGROUP FG_Part2;--filegruop 2
GO
ALTER DATABASE LabFinal 
ADD FILE (
    NAME = 'ArchivoPart3',
    FILENAME = 'C:\ADBD\ArchivoPart3.ndf',
    SIZE = 30MB,
   FILEGROWTH = 10%
) TO FILEGROUP FG_Part3;--filegruop 3
GO
--------+
Use LabFinal --importantisimo esto 
--11 Haga una función y esquema de partición para la tabla película
CREATE PARTITION FUNCTION PF_TitulodeePeliculas (VARCHAR(100))
AS RANGE Right FOR VALUES ('I', 'Q');
GO
-- ahoracreo el esquema de partición que apunte a los filegroups que cree antes
CREATE PARTITION SCHEME PS_TituloPeliculas
AS PARTITION PF_TitulodeePeliculas TO (FG_Part1, FG_Part2, FG_Part3);--FG_Part1 (A - H),FG_Part2 (i - q),FG_Part3 despues de q
GO
SELECT * FROM sys.partition_functions;
SELECT * FROM sys.partition_schemes;

--
--12 Cree un índice particionado, basado en el esquema de partición de la tabla película
CREATE NONCLUSTERED INDEX IX_Pelicula_titulo --conflicto con PK__Pelicula
ON PracticaParte1.Pelicula (Titulo) ON PS_TituloPeliculas (Titulo); --aqui se creara correctamnete lo que hice en linea 258
GO

--prueba
SELECT 
    IDPelicula,
    Titulo,
    $PARTITION.PF_TitulodeePeliculas(Titulo) AS Num_Particion
FROM PracticaParte1.Pelicula;
GO

--13 Cree una tabla de suscriptores donde el cliente adquiere el servicio de streaming de películas con un costo mensual de $4 plan standard individual, $8 plan premium, $20 plan familiar
CREATE TABLE PracticaParte1.Suscriptores (
  IDsuscriptor INT IDENTITY(1,1) PRIMARY KEY,
  Nombrecompleto VARCHAR(100) NOT NULL,
 Correoelectronico VARCHAR(100) NOT NULL UNIQUE,
 Fechainicio DATE NOT NULL,
 Costoomensual DECIMAL(5,2) NOT NULL,
  Tipodeplan VARCHAR(20) NOT NULL CHECK (Tipodeplan IN ('standard', 'premium', 'familiar')),
        CHECK ((Tipodeplan = 'standard' AND Costoomensual = 4.00) OR
     (Tipodeplan = 'premium' AND Costoomensual = 8.00) OR
      (Tipodeplan = 'familiar' AND Costoomensual = 20.00))
);
GO
--insertsss
INSERT INTO PracticaParte1.Suscriptores (Nombrecompleto, Correoelectronico, Fechainicio, Tipodeplan, Costoomensual) VALUES
('Adriana Díaz', 'adriana.diaz@mail.com', '2024-01-10', 'standard', 4.00),
('Valeria Solano', 'valeria.solano@mail.com', '2024-02-15', 'premium', 8.00),
('Samuel Villalobos', 'samuel.v@mail.com', '2024-03-12', 'familiar', 20.00),
('Tatiana Jiménez', 'tatiana.jimenez@mail.com', '2024-03-30', 'standard', 4.00),
('Esteban Rojas', 'esteban.rojas@mail.com', '2024-04-05', 'premium', 8.00),
('Ignacio Castro', 'nacho.castro@mail.com', '2024-04-20', 'familiar', 20.00),
('Sofía Vargas', 'sofia.vargas@mail.com', '2024-05-01', 'standard', 4.00),
('Raúl Gamboa', 'raul.gamboa@mail.com', '2024-05-18', 'premium', 8.00),
('Abril Zúñiga', 'abril.zuniga@mail.com', '2024-06-04', 'familiar', 20.00),
('Paola Mora', 'paola.mora@mail.com', '2024-06-15', 'standard', 4.00),
('Leonel Hernández', 'leonel.hernandez@mail.com', '2024-06-20', 'premium', 8.00),
('Valentina López', 'valentina.lopez@mail.com', '2024-07-02', 'familiar', 20.00),
('Mariela Segura', 'mariela.segura@mail.com', '2024-07-09', 'standard', 4.00),
('Ricardo Méndez', 'ricardo.mendez@mail.com', '2024-07-14', 'premium', 8.00),
('Ian Castillo', 'ian.castillo@mail.com', '2024-07-18', 'familiar', 20.00),
('Daniela Salas', 'daniela.salas@mail.com', '2024-07-20', 'standard', 4.00),
('Javier Arias', 'javier.arias@mail.com', '2024-07-21', 'premium', 8.00),
('Camila Fernández', 'camila.fernandez@mail.com', '2024-07-22', 'familiar', 20.00),
('Tatiana Chaves', 'tatiana.chaves@mail.com', '2024-07-25', 'standard', 4.00),
('Esteban Jiménez', 'esteban.jimenez@mail.com', '2024-07-27', 'premium', 8.00);
GO
--pruebas
select * from PracticaParte1.Suscriptores
GO
--15 Cree una vista que muestre las películas, géneros y productoras asociadas, utilice alias para cada campo
CREATE VIEW PracticaParte1.V_Peliculas
AS
SELECT
   P.IDPelicula AS 'Código de la Película',
  P.Titulo AS 'Título de la Película',
  P.AnnoLanzamiento AS 'Fecha de Lanzamiento de la Película',
  G.NombreGenero AS 'Género de la Película',
   PR.NombreProductora AS 'Productora de la Película',
   PR.PaisOrigen AS 'Pais de Origen de la Película ',
  PR.FechaRegistro AS 'Fecha de Registro de la Productora'
FROM PracticaParte1.Pelicula AS P
INNER JOIN PracticaParte1.Genero_Pelicula AS G ON P.IDGenero = G.IDGenero INNER JOIN PracticaParte1.Productora AS PR ON P.IDProductora = PR.IDProductora;
GO
select * from PracticaParte1.V_Peliculas
go
--16 Encripte la vista, consulte el script que genera la vista y valide que esté encriptada, adjunte captura
ALTER VIEW PracticaParte1.V_Peliculas
WITH ENCRYPTION -- es nada mas poner alter y poner esta linea
AS
SELECT
   P.IDPelicula AS 'Código de la Película',
  P.Titulo AS 'Título de la Película',
  P.AnnoLanzamiento AS 'Fecha de Lanzamiento de la Película',
  G.NombreGenero AS 'Género de la Película',
   PR.NombreProductora AS 'Productora de la Película',
   PR.PaisOrigen AS 'Pais de Origen de la Película ',
  PR.FechaRegistro AS 'Fecha de Registro de la Productora'
FROM PracticaParte1.Pelicula AS P
INNER JOIN PracticaParte1.Genero_Pelicula AS G ON P.IDGenero = G.IDGenero INNER JOIN PracticaParte1.Productora AS PR ON P.IDProductora = PR.IDProductora;
GO
sp_helptext 'PracticaParte1.V_PeliculasCompleta';--Validar que la vista está encriptada
SELECT * FROM PracticaParte1.V_PeliculasCompleta;--encriptar la vista NO impide que se ejecute (paso 17)
--\
--18 Respalde la base de datos y guarde el archivo .bak (No se adjunta en la entrega)
BACKUP DATABASE LabFinal TO DISK = 'C:\ADBD\Backup\Lab14AdrianaDiazVargas.bak';
GO
