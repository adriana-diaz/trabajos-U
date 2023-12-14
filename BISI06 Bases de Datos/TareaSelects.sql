/** SE CREA LA BASE DE DATOS **/
CREATE DATABASE IF NOT EXISTS EXAMENADRIANAYDANIEL;

/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE EXAMENADRIANAYDANIEL;

/** TABLAS **/

/** tabla Tipo_Mascota**/
CREATE TABLE Tipo_Mascota (
    Cod_Tipo INT PRIMARY KEY,
    Des_Tipo VARCHAR(100) NULL
);

/** Insertar info en tabla Tipo_Mascota **/
INSERT INTO Tipo_Mascota(Cod_Tipo, Des_Tipo) VALUES (123, 'Tipo 1');
INSERT INTO Tipo_Mascota(Cod_Tipo, Des_Tipo) VALUES (456, 'Tipo 2');
INSERT INTO Tipo_Mascota(Cod_Tipo, Des_Tipo) VALUES (789, 'Tipo 3');
INSERT INTO Tipo_Mascota(Cod_Tipo, Des_Tipo) VALUES (12, 'Tipo 4');

/** tabla Mascota**/
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

/**Insertar info en la tabla Mascotas **/
INSERT INTO Mascotas(Id_Mascota, Nombre, Descripcion, Cod_Tipo, Fec_Nacimiento, Fec_Registro) VALUES ('176389', 'RAMBO', 'ESTATURA MEDIA', 123, '2023-01-20', '2023-12-13');
INSERT INTO Mascotas(Id_Mascota, Nombre, Descripcion, Cod_Tipo, Fec_Nacimiento, Fec_Registro) VALUES ('234698', 'ZAVIER', 'ESTATURA GRANDE', 456, '2020-01-20', '2023-12-13');
INSERT INTO Mascotas(Id_Mascota, Nombre, Descripcion, Cod_Tipo, Fec_Nacimiento, Fec_Registro) VALUES ('396213', 'ADRIANA', 'ESTATURA MEDIA', 789, '2023-07-20', '2023-12-13');
INSERT INTO Mascotas(Id_Mascota, Nombre, Descripcion, Cod_Tipo, Fec_Nacimiento, Fec_Registro) VALUES ('409678', 'DANIEL', 'ESTATURA GRANDE', 12, '2019-02-20', '2023-12-13');

/** tabla Citas**/
CREATE TABLE Citas (
    Cod_Cita VARCHAR(8) PRIMARY KEY,
    ID_Mascota VARCHAR(6),
    Fecha_Cita DATETIME NULL,
    Diagnostico VARCHAR(255) NULL,
    Tratamiento VARCHAR(255) NULL,
    Monto_Cobrado NUMERIC(10, 2) NULL,
    FOREIGN KEY (ID_Mascota) REFERENCES Mascotas(ID_Mascota)
);
/**Insertar info en la tabla Citas **/
INSERT INTO Citas(Cod_Cita,ID_Mascota, Fecha_Cita, Diagnostico, Tratamiento, Monto_Cobrado)VALUES ('Cita1','176389', '2023-01-22', 'Examen de rutina', 'Vacunación', 75.50);
INSERT INTO Citas(Cod_Cita,ID_Mascota, Fecha_Cita, Diagnostico, Tratamiento, Monto_Cobrado)VALUES ('Cita2','234698', '2023-02-15', 'Chequeo dental', 'Medicación', 100.00);
INSERT INTO Citas(Cod_Cita,ID_Mascota, Fecha_Cita, Diagnostico, Tratamiento, Monto_Cobrado)VALUES ('Cita3','396213', '2023-08-10', 'Consulta general', 'Reposo', 120.00);
INSERT INTO Citas(Cod_Cita,ID_Mascota, Fecha_Cita, Diagnostico, Tratamiento, Monto_Cobrado)VALUES ('Cita4','409678', '2023-03-05', 'Control de peso', 'Dieta especial', 90.75);


/** Consulta de todas las Mascotas cuya letra inicial del nombre esté entre A y D o entre R y Z **/
SELECT * FROM Mascotas WHERE (Nombre LIKE 'A%' OR Nombre LIKE 'D%') OR (Nombre LIKE 'R%' OR Nombre LIKE 'Z%');
 
/** Consulta de Citas en un rango de fechas y de una mascota específica  **/
SELECT * FROM Citas WHERE ID_Mascota = '176389' AND Fecha_Cita BETWEEN '2022-01-01' AND '2023-12-31' ORDER BY Fecha_Cita;
 
/** Consulta de la cantidad de citas de cada mascota y el monto total  **/
SELECT ID_Mascota, COUNT(*) AS Cantidad_Citas, SUM(Monto_Cobrado) AS Monto_Total FROM Citas GROUP BY ID_Mascota;
 
/** Consulta de la cantidad de citas existentes, el promedio del costo de citas, el costo mínimo y máximo de citas  **/
SELECT COUNT(*) AS Cantidad_Citas, AVG(Monto_Cobrado) AS Promedio_Costo, MIN(Monto_Cobrado) AS Costo_Minimo, MAX(Monto_Cobrado) AS Costo_Maximo FROM Citas;
 
/**Consulta que muestra todos los tipos de mascotas, las mascotas de cada tipo y las citas de las mascotas **/
SELECT tm.Cod_Tipo, tm.Des_Tipo, m.id_mascota, m.Nombre, c.Cod_Cita, c.Fecha_Cita, c.Monto_Cobrado FROM Tipo_Mascota tm JOIN Mascotas m ON tm.Cod_Tipo = m.Cod_tipo
LEFT JOIN Citas c ON m.id_mascota = c.ID_Mascota ORDER BY tm.Cod_Tipo, m.id_mascota, c.Fecha_Cita;
 
/** Consulta que muestra la fecha de nacimiento de la mascota más joven y la fecha de registro más antigua **/
SELECT MIN(Fec_Nacimiento) AS Fecha_Mascota_Mas_Joven, MIN(Fec_Registro) AS Fecha_Registro_Mas_Antiguo FROM Mascotas;
