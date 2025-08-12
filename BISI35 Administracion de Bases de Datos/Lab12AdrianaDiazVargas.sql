--CLASE 12
--Universidad Latina de Costa Rica
--Curso : BISI35 Administracion de Bases de Datos
--Autora : Adriana Diaz Vargas 
--Profesor : Alejandro Serrano Perez
--Lab 12
--Fecha : 29/07/25
-- clase 12

--1. Cree la base de datos Costa_Rica
create database Costa_Rica
GO

use Costa_Rica
GO
--2. Cree la tabla canton (idcanton, nombrecanton)
CREATE TABLE dbo.canton (
idcanton INT PRIMARY KEY,
nombrecanton VARCHAR(100)
);
--3. Cargue 100 cantones
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (1, 'San José');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (2, 'Escazú');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (3, 'Desamparados');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (4, 'Puriscal');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (5, 'Tarrazú');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (6, 'Aserrí');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (7, 'Mora');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (8, 'Goicoechea');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (9, 'Santa Ana');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (10, 'Alajuelita');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (11, 'Vásquez de Coronado');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (12, 'Acosta');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (13, 'Tibás');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (14, 'Moravia');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (15, 'Montes de Oca');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (16, 'Turrubares');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (17, 'Dota');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (18, 'Curridabat');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (19, 'Pérez Zeledón');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (20, 'León Cortés Castro');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (21, 'Alajuela');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (22, 'San Ramón');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (23, 'Grecia');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (24, 'San Mateo');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (25, 'Atenas');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (26, 'Naranjo');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (27, 'Palmares');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (28, 'Poás');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (29, 'Orotina');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (30, 'San Carlos');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (31, 'Zarcero');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (32, 'Sarchí');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (33, 'Upala');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (34, 'Los Chiles');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (35, 'Guatuso');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (36, 'Cartago');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (37, 'Paraíso');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (38, 'La Unión');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (39, 'Jiménez');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (40, 'Turrialba');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (41, 'Alvarado');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (42, 'Oreamuno');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (43, 'El Guarco');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (44, 'Heredia');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (45, 'Barva');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (46, 'Santo Domingo');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (47, 'Santa Bárbara');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (48, 'San Rafael');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (49, 'San Isidro');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (50, 'Belén');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (51, 'Flores');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (52, 'San Pablo');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (53, 'Liberia');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (54, 'Nicoya');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (55, 'Santa Cruz');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (56, 'Bagaces');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (57, 'Carrillo');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (58, 'Cañas');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (59, 'Abangares');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (60, 'Tilarán');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (61, 'Nandayure');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (62, 'La Cruz');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (63, 'Hojancha');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (64, 'Esparza');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (65, 'Buenos Aires');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (66, 'Montes de Oro');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (67, 'Osa');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (68, 'Quepos');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (69, 'Golfito');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (70, 'Coto Brus');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (71, 'Parrita');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (72, 'Corredores');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (73, 'Garabito');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (74, 'Limón');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (75, 'Pococí');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (76, 'Siquirres');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (77, 'Talamanca');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (78, 'Matina');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (79, 'Guácimo');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (80, 'Canton Extra 1');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (81, 'Canton Extra 2');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (82, 'Canton Extra 3');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (83, 'Canton Extra 4');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (84, 'Canton Extra 5');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (85, 'Canton Extra 6');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (86, 'Canton Extra 7');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (87, 'Canton Extra 8');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (88, 'Canton Extra 9');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (89, 'Canton Extra 10');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (90, 'Canton Extra 11');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (91, 'Canton Extra 12');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (92, 'Canton Extra 13');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (93, 'Canton Extra 14');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (94, 'Canton Extra 15');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (95, 'Canton Extra 16');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (96, 'Canton Extra 17');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (97, 'Canton Extra 18');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (98, 'Canton Extra 19');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (99, 'Canton Extra 20');
INSERT INTO dbo.canton (idcanton, nombrecanton) VALUES (100, 'Canton Extra 21');
--4. Cree un nuevo login de sql
USE Costa_Rica;
GO
CREATE USER Usuario2 FOR LOGIN Usuario2;
GO
GRANT SELECT ON dbo.canton TO Usuario2;
GO
--
EXECUTE AS USER = 'Usuario2';
GO

SELECT * FROM dbo.canton;
GO

REVERT;
GO
--
DROP USER Usuario2;
DROP LOGIN Usuario2;
DROP USER Usuario1;
DROP LOGIN Usuario1;

--5. Inicie sesión en una nueva ventana Usuario1
--lo hice, ahi adjuntare una foto de evidencia
--6. Inicie una transacción explícita, inserte 1 nuevo cantón (sin dar commit o rollback) Usuario2

USE Costa_Rica;
GO
BEGIN TRANSACTION;
GO
INSERT INTO dbo.canton (idcanton, nombrecanton)
VALUES ('103','Carpintera');
GO
--sin commit
--7. Configure el nivel de aislamiento Read uncommitted
USE Costa_Rica;
GO
-- Configurar nivel de aislamiento
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
GO
-- Consulta a la tabla que tiene cambios no confirmados
SELECT * FROM dbo.canton;
GO
--
--8. Realice un select a la tabla cantones, adjunte captura
USE Costa_Rica;
GO

SELECT * FROM canton;
GO

--9. Configure el nivel de aislamiento Read committed
USE Costa_Rica;
GO

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
GO

SELECT * FROM dbo.canton;

--10. Realice un select a la tabla cantones, adjunte captura 
USE Costa_Rica;
GO

SELECT * FROM dbo.canton;
GO