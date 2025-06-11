--Universidad Latina de Costa Rica
--Curso : BISI35 Administracion de Bases de Datos
--Autora : Adriana Diaz Vargas 
--Profesor : Alejandro Serrano Perez
--Lab 5
--Fecha : 11/06/25
--CAMBIO DE DB
USE MASTER
GO
--Creacion de la base de datos Pais
CREATE DATABASE Pais
on Primary 
(
NAME = PaisPrimary,
FILENAME='C:\ADBD\PaisPrimario\paisPrimario.mdf',
SIZE = 20MB , filegrowth = 30%
)
LOG ON
(
NAME = PaisLogs,
FILENAME='C:\ADBD\PaisLogs\paisPrimario.ldf',
SIZE = 20MB , filegrowth = 30%
);
GO
-- CAMBIO A BASE DE DATOS Pais
USE Pais
GO

--Cree 3 archivos para almacenar los filegroups, llamados padron
ALTER DATABASE Pais
ADD filegroup padron1
GO
ALTER DATABASE Pais
ADD filegroup padron2
GO
ALTER DATABASE Pais
ADD filegroup padron3
GO
--indique size y filegrowth 20bm y 30% respectivamente
ALTER DATABASE Pais
ADD FILE 
(
	Name = PaisParticionado1,
	FILENAME = 'C:\ADBD\PaisParticionado1\PaisParticionado1.ndf',
	SIZE = 20MB, FILEGROWTH = 30%
)
TO FILEGROUP padron1;
GO
ALTER DATABASE Pais
ADD FILE 
(
	Name = PaisParticionado2,
	FILENAME = 'C:\ADBD\PaisParticionado2\PaisParticionado2.ndf',
	SIZE = 20MB, FILEGROWTH = 30%
)
TO FILEGROUP padron2;
GO
ALTER DATABASE Pais
ADD FILE 
(
	Name = PaisParticionado3,
	FILENAME = 'C:\ADBD\PaisParticionado3\PaisParticionado3.ndf',
	SIZE = 20MB, FILEGROWTH = 30%
)
TO FILEGROUP padron3;
GO
--Cree el esquema de partición, este realizará la partición por salario de menor a mayor;
--CREAR FUNCION DE PARTICION
CREATE PARTITION FUNCTION FN_ParticionSalariosPais (BIGINT)
AS RANGE RIGHT FOR VALUES (500000,1000000)
GO

--CREAR SCHEMA DE PARTICION
CREATE PARTITION SCHEME EsquemaparticionSalariosPais AS PARTITION FN_ParticionSalariosPais
TO (padron1, padron2, padron3);
GO
--Cree una tabla persona, con campos ID, nombre, provincia, edad, salario
CREATE TABLE dbo.persona
(
	ID INT NOT NULL,
	nombre NVARCHAR(30) NOT NULL,
	provincia NVARCHAR(30) NOT NULL,
	edad NVARCHAR(3) NOT NULL,
	salario BIGINT NOT NULL,
	constraint PK_ID PRIMARY KEY(salario)
) on EsquemaparticionSalariosPais(salario);
GO

--Inserte 90 registros (30 por cada rango de salario aproximadamente, los 3 rangos de salarios son de 1 a 1,500,000)
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (1, 'Adriana', 'Limón', 35, 251396);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (2, 'Rodolfo', 'Heredia', 43, 165899);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (3, 'Samuel', 'Guanacaste', 61, 450036);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (4, 'Nacho', 'Limón', 51, 325767);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (5, 'tatiana', 'Cartago', 27, 475950);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (6, 'maria', 'Guanacaste', 53, 338594);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (7, 'oscar', 'Guanacaste', 31, 356570);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (8, 'sebastian', 'Limón', 48, 380989);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (9, 'valeria', 'Alajuela', 32, 416515);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (10, 'ariana', 'Cartago', 25, 44585);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (11, 'sara', 'Limón', 31, 372369);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (12, 'diana', 'Cartago', 40, 65044);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (13, 'fabiola', 'Cartago', 57, 436773);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (14, 'manuel', 'Guanacaste', 38, 443296);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (15, 'laura', 'Heredia', 33, 110556);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (16, 'oswaldo', 'Cartago', 62, 3693);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (17, 'paolo', 'Puntarenas', 35, 489219);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (18, 'paulo', 'Guanacaste', 64, 358403);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (19, 'valery', 'Alajuela', 41, 244307);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (20, 'xinia', 'Heredia', 43, 201235);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (21, 'edith', 'Puntarenas', 42, 26939);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (22, 'zoe', 'Puntarenas', 62, 443141);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (23, 'nina', 'Alajuela', 58, 437157);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (24, 'nana', 'Heredia', 46, 153906);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (25, 'valeria', 'Guanacaste', 32, 19047);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (26, 'carlos', 'San José', 62, 289249);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (27, 'claudia', 'Heredia', 18, 76766);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (28, 'ximena', 'Alajuela', 42, 409923);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (29, 'mariana', 'Puntarenas', 24, 416192);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (30, 'gabriel', 'Guanacaste', 26, 45262);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (31, 'randall', 'Heredia', 41, 887262);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (32, 'marvin', 'San José', 18, 785921);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (33, 'susana', 'San José', 61, 661153);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (34, 'rodrigo', 'Cartago', 25, 628377);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (35, 'ricardo', 'Cartago', 41, 960059);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (36, 'andres', 'Limón', 28, 954590);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (37, 'alex', 'Alajuela', 34, 637849);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (38, 'esteban', 'Heredia', 25, 592788);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (39, 'marco', 'Heredia', 52, 627949);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (40, 'adrian', 'Limón', 52, 555017);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (41, 'enzo', 'Puntarenas', 50, 902691);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (42, 'ian', 'Puntarenas', 22, 999047);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (43, 'justin', 'Limón', 59, 951270);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (44, 'sabrina', 'Puntarenas', 56, 521960);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (45, 'ariana', 'Cartago', 58, 636603);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (46, 'olivia', 'Heredia', 45, 725929);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (47, 'taylor', 'Limón', 24, 881246);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (48, 'chayanne', 'Heredia', 26, 765893);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (49, 'luis', 'San José', 25, 728577);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (50, 'miguel', 'Cartago', 29, 991315);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (51, 'miranda', 'Guanacaste', 51, 513546);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (52, 'graciela', 'Cartago', 50, 889804);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (53, 'jose', 'Limón', 40, 959416);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (54, 'leonardo', 'Guanacaste', 41, 665839);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (55, 'luis', 'San José', 54, 835675);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (56, 'duarte', 'Limón', 52, 855702);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (57, 'yeylin', 'Alajuela', 61, 561088);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (58, 'beth', 'Heredia', 57, 989056);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (59, 'eduardo', 'San José', 39, 568841);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (60, 'hugo', 'Heredia', 44, 618452);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (61, 'william', 'Puntarenas', 52, 1447601);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (62, 'sussana', 'Alajuela', 18, 1313150);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (63, 'omar', 'Alajuela', 52, 1439793);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (64, 'veronica', 'San José', 54, 1039354);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (65, 'brian', 'Alajuela', 64, 1193076);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (66, 'kevin', 'Guanacaste', 31, 1214284);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (67, 'brittany', 'Alajuela', 20, 1314878);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (68, 'naomy', 'Heredia', 18, 1065319);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (69, 'fabiana', 'Heredia', 22, 1241026);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (70, 'gabriel', 'Limón', 43, 1482691);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (71, 'roberto', 'Heredia', 31, 1416881);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (72, 'ANTHONY', 'Limón', 56, 1067173);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (73, 'adriana', 'Heredia', 44, 1216689);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (74, 'lilo', 'Guanacaste', 26, 1256952);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (75, 'stitch', 'Limón', 32, 1093265);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (76, 'moana', 'Cartago', 32, 1246459);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (77, 'yasmin', 'Puntarenas', 43, 1288881);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (78, 'cenicienta', 'San José', 59, 1225282);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (79, 'mulan', 'Heredia', 30, 1496258);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (80, 'aurora', 'Alajuela', 49, 1112860);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (81, 'elsa', 'Heredia', 56, 1374326);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (82, 'vanessa', 'Alajuela', 49, 1394071);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (83, 'ziza', 'Puntarenas', 21, 1352229);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (84, 'david', 'Puntarenas', 47, 1431840);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (85, 'alejandro', 'Puntarenas', 54, 1269537);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (86, 'johan', 'Alajuela', 40, 1317825);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (87, 'jachy', 'Heredia', 56, 1257427);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (88, 'kiara', 'Puntarenas', 62, 1177790);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (89, 'luciana', 'Guanacaste', 32, 1218165);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (90, 'andrea', 'Limón', 60, 1313004);
---


--muestra de particion exitosa
SELECT ID, nombre, salario, $PARTITION.FN_ParticionSalariosPais(salario) AS NumParticion
FROM dbo.persona;
GO
--adjuntar captura 
--5 inserts con salarios mayores 1500000
-- INSERTS con salarios mayores a 1,500,000 (fuera de rango de partición)
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (91, 'Daniela', 'San José', 28, 1600000);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (92, 'Luis', 'Alajuela', 35, 1700000);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (93, 'María', 'Cartago', 42, 1800000);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (94, 'Carlos', 'Heredia', 31, 1900000);
INSERT INTO persona (ID, nombre, provincia, edad, salario) VALUES (95, 'Andrea', 'Puntarenas', 26, 2000000);

--Modifique la base de datos cree un filegroup y el archivo adicional para un monto mayor de salarios superior al 1,500,000
ALTER DATABASE Pais
ADD filegroup padron4;
go
--
--creacion de la particion4 para que aqui caigan los salarios superior al 1,500,000
ALTER DATABASE Pais
ADD FILE 
(
	Name = PaisParticionado4,
	FILENAME = 'C:\ADBD\PaisParticionado4\PaisParticionado4.ndf',
	SIZE = 20MB, FILEGROWTH = 30%
)
TO FILEGROUP padron4;-- a este filegruop
GO

--MODIFICAR EL ESQUEMA Y AL FUNCION DE PARTICION
ALTER PARTITION SCHEME EsquemaParticionSalariosPais  NEXT USED padron4;
GO

ALTER PARTITION FUNCTION FN_ParticionSalariosPais() SPLIT RANGE (1500000); --APARTIR DEL 1,500,000
GO

--VERIFICO solo los ultimos 5 registros que meti
SELECT ID, nombre, salario, $PARTITION.FN_ParticionSalariosPais(salario) AS 'Num Partición'
FROM dbo.persona
WHERE ID IN (91, 92, 93, 94, 95);
GO

--Cree Índice agrupado para el ID y
CREATE CLUSTERED INDEX indice_persona_ID ON persona (ID);
GO
-- cree un indice no agrupado por nombre
CREATE NONCLUSTERED INDEX indice_persona_nombre ON persona (nombre);
GO
