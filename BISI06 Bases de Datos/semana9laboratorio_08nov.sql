/** SE CREA LA BASE DE DATOS**/
CREATE DATABASE Laboratorio_Adriana
GO

 

/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE Laboratorio_Adriana
GO

/** INSTRUCCION QUE PERMITE CREAR LOS DIAGRAMAS**/
Alter authorization on database::Laboratorio_Adriana to sa 

 


/*Establece el formato de la fecha en dia/mes/año, 
cualquiera de las dos*/
SET DATEFORMAT dmy
SET LANGUAGE spanish

 


/*Instruccion que indica que la proxima consulta 
se ejecutará hasta que termine de ejecutarse la sentencia anterior*/
GO 

-----Tabla-----
CREATE TABLE DoctorAdriana1 (
    NumDoctor INT PRIMARY KEY,
    CodHospital VARCHAR(50),
    Apellido VARCHAR(50) NOT NULL,
    Especialidad VARCHAR(100) NOT NULL
);
GO

CREATE TABLE HospitalAdriana (
    Cod_Hospital INT PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL, 
	Telefono VARCHAR(15) NOT NULL,
	Direccion VARCHAR(100) NOT NULL,
	Cant_Camas INT NOT NULL );
);
GO
CREATE TABLE SalaAdriana (
Cod_Sala INT PRIMARY KEY,
 Nombre VARCHAR(50) NOT NULL, 
 Cant_Camas INT NOT NULL, 
 Cod_Hospital INT NOT NULL, 
 FOREIGN KEY (Cod_Hospital) REFERENCES HospitalAdriana(Cod_Hospital) 
 );
 GO

 CREATE TABLE EmpleadoAdriana (
 Id_Empleado INT PRIMARY KEY,
 Apellido VARCHAR(50) NOT NULL,
  Oficio VARCHAR(50) NOT NULL,
   Cod_Jefe VARCHAR(50) NOT NULL,
    Fecha_Ingreso VARCHAR(50) NOT NULL,
	 Salario VARCHAR(50) NOT NULL,
	  Comision VARCHAR(50) NOT NULL,
	   Num_Dpto VARCHAR(50) NOT NULL,
);
GO

CREATE TABLE DepartamentoAdriana (
Num_Departamento INT PRIMARY KEY,
Dpto_Nombre VARCHAR(50) NOT NULL, 
Localizacion VARCHAR(50) NOT NULL, 
Cod_Sala INT NOT NULL,
FOREIGN KEY (Cod_Sala) REFERENCES SalaAdriana(Cod_Sala) 
);
GO