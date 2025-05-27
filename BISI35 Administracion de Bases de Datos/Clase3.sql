USE MASTER
GO
CREATE DATABASE Empresa 
on Primary -- .mdf
(
NAME = 'EmpresaPrimary',
filename = 'C:\ADBD\Empresa.mdf',
size = 50MB,
filegrowth = 15%
)


Log on --archivo de logs
(
NAME = 'EmpresaLogs',
filename = 'C:\ADBD\EmpresaLog.ldf',
size = 100MB,
filegrowth = 20%
);
go



alter database Empresa
Add filegroup Produccion; --grupo de archivos logicos
go

--
--create archivo adicional
alter database Empresa
add file
(
NAME = 'EmpresaProduccion',
filename = 'C:\ADBD\EmpresaProduccion.ndf',
size = 50MB,
filegrowth = 20%
)
to filegroup Produccion;
go

--modificar la base de datos para que se use el archivo adicional, se establecce como predetermianado
alter database Empresa
modify filegroup [Produccion] DEFAULT;
GO



--CREATE TABLA CLIENTE

CREATE TABLE dbo.Cliente (
CodigoCliente int identity (1,1) not null primary key,
Nombre varchar (150) not null,
Direccion varchar (150) not null,
Telefono varchar (20) default ('0000-0000'),
Email varchar (40) not null,
FechaNacimiento date not null,
edad int not null,
CONSTRAINT CHK_Edad Check (Edad >= 18)
--CONSTRAINT CHK_MayoriaEdad Check (DATEDIFF (YEAR,FechaNacimiento,GETDATE())>18)
)

--insertar datos con valores invalidos, violando la restriccion check
insert into dbo.Cliente (Nombre, Direccion, Email, FechaNacimiento, edad)
values
('adriana diaz', 'Heredia', 'adrianadiaz3003@gmail.com', '2005-03-30', 20);
go

--clase 3 parte 2

-- cambio de bd
use master
go

create login UserAdminBD
with password = 'Admin123456',
check_expiration = on,
check_policy = on;
go

--eliminar login
drop login UserAdminBD;
go

--cambio de base de datos
use NorthWind
go

--crear usuario para la bd asociado al login
--creo un usuario de servicio
create user Estudiante for login UserAdminBD;
go

--eliminar usuario
drop user Estudiante;
go


--crear schema
create schema ClaseAdBD
AUTHORIZATION Estudiante;
go

--conceder permisos para crear tablas
GRANT CREATE TABLE TO Estudiante;
GO

--revocar permisos para crear tablas
revoke CREATE TABLE TO Estudiante;
GO



