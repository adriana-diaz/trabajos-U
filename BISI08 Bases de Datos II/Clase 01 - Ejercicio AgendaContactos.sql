/** SE CREA LA BASE DE DATOS**/
CREATE DATABASE Agenda_Didier
GO

/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE Agenda_Didier
GO

/** INSTRUCCION QUE PERMITE CREAR LOS DIAGRAMAS**/
Alter authorization on database::Agenda_Didier to sa 


/*Establece el formato de la fecha en dia/mes/año, 
cualquiera de las dos*/
SET DATEFORMAT dmy
SET LANGUAGE spanish

/** SE CREAN LAS TABLAS DE LA BASE DE DATOS**/
CREATE TABLE Contacto(
	 	Cod_Contacto int NOT NULL,
	 	Nombre varchar(60) NOT NULL,
		FechaNacimiento date NULL,
		Correo varchar(100) NULL
  CONSTRAINT [PK_Contacto] PRIMARY KEY (Cod_Contacto ASC)
);
GO
CREATE TABLE Categoria(
	 	Cod_Categoria int NOT NULL,
	 	Nombre varchar(60) NULL,
  CONSTRAINT [PK_Categoria] PRIMARY KEY (Cod_Categoria ASC)
);
GO
CREATE TABLE NumeroTelefono(
	 	Cod_Numero int NOT NULL,
	 	Numero bigint NOT NULL,
		Cod_Categoria int NOT NULL,
  CONSTRAINT [PK_Numero] PRIMARY KEY (Cod_Numero ASC),
  CONSTRAINT [FK_NumeroTelefono_Categoria] FOREIGN KEY (Cod_Categoria) REFERENCES Categoria(Cod_Categoria)
);
GO
CREATE TABLE RelContactoNumero(
	 	Cod_Contacto int NOT NULL,
	 	Cod_Numero int NOT NULL,
  CONSTRAINT [PK_RelContactoNumero] PRIMARY KEY (Cod_Contacto, Cod_Numero),
  CONSTRAINT [FK_RelContactoNumero_Contacto] FOREIGN KEY (Cod_Contacto)
	REFERENCES Contacto(Cod_Contacto),
  CONSTRAINT [FK_RelContactoNumero_NumeroTelefono] FOREIGN KEY (Cod_Numero) 
	REFERENCES NumeroTelefono(Cod_Numero),
);
GO

/** SE INSERTAN DATOS DE PRUEBAS EN LAS TABLAS DE LA BASE DE DATOS**/
INSERT INTO Categoria (Cod_Categoria, Nombre) VALUES(1, 'Móvil');
INSERT INTO Categoria (Cod_Categoria, Nombre) VALUES(2, 'Hogar');
INSERT INTO Categoria (Cod_Categoria, Nombre) VALUES(3, 'Fax');
INSERT INTO Categoria (Cod_Categoria, Nombre) VALUES(4, 'Trabajo');
GO

INSERT INTO Contacto (Cod_Contacto, Nombre, FechaNacimiento, Correo) VALUES(111, 'Caleb', '01/01/1997', 'caleb.alfaro@gmail.com')
INSERT INTO Contacto (Cod_Contacto, Nombre, FechaNacimiento, Correo) VALUES(222, 'Javier', '12/06/1995', 'jchaconrod@gmail.com')
GO

INSERT INTO NumeroTelefono (Cod_Numero, Numero,Cod_Categoria) VALUES(1, 89803015,1)
INSERT INTO NumeroTelefono (Cod_Numero, Numero,Cod_Categoria) VALUES(2, 22924564,2)
GO

INSERT INTO RelContactoNumero(Cod_Contacto, Cod_Numero) VALUES(111, 1);
INSERT INTO RelContactoNumero(Cod_Contacto, Cod_Numero) VALUES(111, 2);
INSERT INTO RelContactoNumero(Cod_Contacto, Cod_Numero) VALUES(222, 2);
GO
