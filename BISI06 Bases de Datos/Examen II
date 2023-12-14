/** SE CREA LA BASE DE DATOS **/
CREATE DATABASE IF NOT EXISTS EXAMENADRIANAYDANIEL;

/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE EXAMENADRIANAYDANIEL;

/** TABLAS **/

-- tabla Tipo_Mascota
CREATE TABLE Tipo_Mascota (
    Cod_Tipo INT PRIMARY KEY,
    Des_Tipo VARCHAR(100) NULL
);

/** Insertar info en tabla Tipo_Mascota **/
INSERT INTO Tipo_Mascota(Cod_Tipo, Des_Tipo) VALUES (123, 'Tipo 1');
INSERT INTO Tipo_Mascota(Cod_Tipo, Des_Tipo) VALUES (456, 'Tipo 2');
INSERT INTO Tipo_Mascota(Cod_Tipo, Des_Tipo) VALUES (789, 'Tipo 3');
INSERT INTO Tipo_Mascota(Cod_Tipo, Des_Tipo) VALUES (12, 'Tipo 4');

-- Crear la tabla
CREATE TABLE Mascotas (
    Id_Mascota VARCHAR(6) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(255) NULL,
    Descripcion VARCHAR(255) NULL,
    Cod_Tipo INT NOT NULL,
    Fec_Nacimiento DATETIME NULL,
    Fec_Registro DATETIME NULL,
    CONSTRAINT FK_Mascotas_Tipo FOREIGN KEY (Cod_Tipo) REFERENCES Tipo_Mascota(Cod_Tipo),
    CONSTRAINT UQ_Mascotas_Id_Mascota UNIQUE (Id_Mascota)
);

-- Insertar información en la tabla Mascotas
INSERT INTO Mascotas(Id_Mascota, Nombre, Descripcion, Cod_Tipo, Fec_Nacimiento, Fec_Registro) VALUES ('176389', 'PERRITO', 'ESTATURA MEDIA', 123, '2023-01-20', '2023-12-13');

INSERT INTO Mascotas(Id_Mascota, Nombre, Descripcion, Cod_Tipo, Fec_Nacimiento, Fec_Registro) VALUES ('234698', 'GATITO', 'ESTATURA GRANDE', 456, '2020-01-20', '2023-12-13');

INSERT INTO Mascotas(Id_Mascota, Nombre, Descripcion, Cod_Tipo, Fec_Nacimiento, Fec_Registro) VALUES ('396213', 'LOLA', 'ESTATURA MEDIA', 789, '2023-07-20', '2023-12-13');

INSERT INTO Mascotas(Id_Mascota, Nombre, Descripcion, Cod_Tipo, Fec_Nacimiento, Fec_Registro) VALUES ('409678', 'HUELLITAS', 'ESTATURA GRANDE', 12, '2019-02-20', '2023-12-13');

-- tabla Citas
CREATE TABLE Citas (
    Cod_Cita VARCHAR(8) PRIMARY KEY,
    ID_Mascota VARCHAR(6),
    Fecha_Cita DATETIME NULL,
    Diagnostico VARCHAR(255) NULL,
    Tratamiento VARCHAR(255) NULL,
    Monto_Cobrado NUMERIC(10, 2) NULL,
    FOREIGN KEY (ID_Mascota) REFERENCES Mascotas(ID_Mascota)
);
-- Insertar registros en la tabla Citas
INSERT INTO Citas(Cod_Cita, Fecha_Cita, Diagnostico, Tratamiento, Monto_Cobrado)VALUES ('Cita1', '2023-01-22', 'Examen de rutina', 'Vacunación', 75.50);
 
INSERT INTO Citas(Cod_Cita, Fecha_Cita, Diagnostico, Tratamiento, Monto_Cobrado)VALUES ('Cita2', '2023-02-15', 'Chequeo dental', 'Medicación', 100.00);
 
INSERT INTO Citas(Cod_Cita, Fecha_Cita, Diagnostico, Tratamiento, Monto_Cobrado)VALUES ('Cita3', '2023-08-10', 'Consulta general', 'Reposo', 120.00);
 
INSERT INTO Citas(Cod_Cita, Fecha_Cita, Diagnostico, Tratamiento, Monto_Cobrado)VALUES ('Cita4', '2023-03-05', 'Control de peso', 'Dieta especial', 90.75);


DROP DATABASE EXAMENADRIANAYDANIEL
