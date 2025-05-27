--Universidad Latina de Costa Rica
--Curso : BISI35 Administracion de Bases de Datos
--Autora : Adriana Diaz Vargas 
--Profesor : Alejandro Serrano Perez
--Lab 3
--Fecha : 26/05/25

--indicaciones 
--1 Cree una base de datos llamada Archivos, cree 2 dos filegroups en el disco C con sus respectivos nombres ArchivoPrimario, ArchivoLog, para el primario asigne un tamaño de 50MB y un crecimiento de archivo del 30%, para el log 80mb y 40%
--2 Cree el filegroup adicional la misma carpeta con el nombre ArchivoAdicional
--3 Modifique el filegroup del primario al adicional
--4 Cree el archivo adicional con las siguientes especificaciones, asigne un tamaño de 100mb y un crecimiento de archivo del 15%, adjunte captura de los 3 archivos en la carpeta
--5 Cree el login AdminBDUser
--6 Cree el user UserBD
--7 Cree el esquema NO_AI para el usuario UserBD
--8 Cree la tabla Laptops (IDLaptops, Marca, Modelo, Descripción, FechaIngreso) , agregue al menos 15 registros y declare un campo en default = ('Sin descripción'), al menos 3 registros deben venir con el valor en default, adjunte captura del select de los 15 registros

--punto 1
USE MASTER
GO
--crear base de datos con los filegroup .mdf y .ldf (con sus respectivos tamaños)
CREATE DATABASE Archivos 
on Primary -- .mdf
(
NAME = 'ArchivoPrimario',
filename = 'C:\ADBD\ArchivoPrimario.mdf',
size = 50MB,
filegrowth = 30%
)

Log on --archivo de logs .ldf
(
NAME = 'ArchivoLog',
filename = 'C:\ADBD\ArchivoLog.ldf',
size = 80MB,
filegrowth = 40%
);
go

--punto 2
--creacion de filegroup adicional 
alter database Archivos
Add filegroup ArchivoAdicional; --grupo de archivos logicos
go
 
 --punto 4
--create archivo adicional (con sus respectivos tamaños segun las  indicaciones)
alter database Archivos
add file
(
NAME = 'ArchivoAdicional',
filename = 'C:\ADBD\ArchivoAdicional.ndf',
size = 100MB,
filegrowth = 15%
)
to filegroup ArchivoAdicional;
go

--punto 3 (Modifique el filegroup del primario al adicional)
--modificar la base de datos para que se use el archivo adicional, se establecce como predetermianado
alter database Archivos
modify filegroup ArchivoAdicional DEFAULT;
GO

--punto 5
--Cree el login AdminBDUser
-- cambio de bd
use master
go

create login AdminBDUser --cree login
with password = 'AdminBDUser123', --asigne contraseña
check_expiration = on, --active expiracion
check_policy = on;
go

--punto 6
--Cree el user UserBD
--cambio de base de datos
use Archivos
go

--crear usuario para la bd asociado al login
--creo un usuario de servicio
create user UserBD for login AdminBDUser;
go

--punto 7
--Cree el esquema NO_AI para el usuario UserBD
--crear schema
create schema NO_AI
AUTHORIZATION UserBD;
go

--punto 8
--creacion de tabla usando schema creado
--uso los atributos que me fueron solicitados
CREATE TABLE NO_AI.Laptops  (
IDLaptops int not null primary key, 
Marca varchar (50) not null,
Modelo varchar (50) not null,
Descripción varchar (150) default ('Sin descripción'), --valor en default
FechaIngreso date not null
);
go

--insertar 15 registros segun las indicaciones
--3 vienen con el valor default solicitado
insert into NO_AI.Laptops (IDLaptops, Marca, Modelo, FechaIngreso)
values
('123456789', 'Dell', 'XR', '2025-03-30');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo, FechaIngreso)
values
('156987425', 'HP', 'ENVY', '2025-04-08');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo, FechaIngreso)
values
('789456123', 'HP', 'ORION', '2025-02-08');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo,Descripción, FechaIngreso)
values
('779416122', 'Microsoft', 'Surface','Microsoft Surface is a series of touchscreen-based personal computers.', '2024-12-06');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo,Descripción, FechaIngreso)
values
('178436142', 'Microsoft', 'Pro','Microsoft pro  es la mejor compu que existe.', '2023-11-25');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo,Descripción, FechaIngreso)
values
('608476232', 'Apple', 'iMac','Diseno Elegante', '2025-03-04');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo,Descripción, FechaIngreso)
values
('515478213', 'Apple', 'MacBooks','Buen rendimiento y ligera en peso', '2025-02-14');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo,Descripción, FechaIngreso)
values
('194478113', 'Lenovo', 'IdeaPad','Ligera en peso y delgada', '2025-04-26');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo,Descripción, FechaIngreso)
values
('198578113', 'Lenovo', 'Yoga ','Bastante movilidad y posibilidad de hacerla modo tablet', '2025-01-01');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo,Descripción, FechaIngreso)
values
('299878463', 'Lenovo', 'Legion','Se adapta a diferentes necesidades de usuarios', '2024-01-11');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo,Descripción, FechaIngreso)
values
('597872422', 'Asus', 'ZenBook','Innovacion en su rendimiento', '2025-02-16');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo,Descripción, FechaIngreso)
values
('447772422', 'Asus', 'ROG ','Innovacion en su ámbito gaming. ', '2024-07-18');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo,Descripción, FechaIngreso)
values
('147574128', 'Dell', 'Inspiron','Innovacion en su ámbito gaming.', '2025-09-01');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo,Descripción, FechaIngreso)
values
('248511118', 'Acer', 'Swift','Alta gama en su ámbito gaming.', '2025-10-30');
go

insert into NO_AI.Laptops (IDLaptops, Marca, Modelo,Descripción, FechaIngreso)
values
('845577138', 'HP', 'Spectre','Rendimeinto superior y avanzado', '2025-09-13');
go

--select para comprobar que la tabla posee 15 regs
select *from NO_AI.Laptops;