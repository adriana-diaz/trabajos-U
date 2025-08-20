--CLASE 15
--Universidad Latina de Costa Rica
--Curso : BISI35 Administracion de Bases de Datos
--Autora : Adriana Diaz Vargas 
--Profesor : Alejandro Serrano Perez
--Lab 15
--Fecha : 18/08/25
-- clase 15

--19 Elimine la base de datos LabFinal (adjunte captura)
drop database LabFinal;
--20 Utilice el respaldo .bak que creó en el punto 17 de este laboratorio y haga la restauración del respaldo
USE master
GO
RESTORE DATABASE LabFinal
FROM DISK = N'C:\ADBD\Backup\Lab14AdrianaDiazVargas.bak'
WITH REPLACE;

--21 Renombre la base de Datos LabFinal por el nombre HBO
ALTER DATABASE LabFinal MODIFY NAME = HBO;

--22 A la tabla suscriptores, agregue los campos (correo, password, numero de tarjeta)
ALTER TABLE PracticaParte1.Suscriptores
 ADD
  Correo VARCHAR(100), 
  Password NVARCHAR(20), 
  NumerodeTarjeta VARCHAR(19); 
GO

--23 Haga una vista que muestre la tabla suscriptores enmascare el correo (alejandro.serrano2@ulatina.net --> ale**@mail.net) 
--y el número de tarjeta (1111-1111-1111-1111 --> 1111-****-****-***1)
create view PracticaParte1.V_Suscriptores
as select
IDsuscriptor,
  Nombrecompleto,
  Correoelectronico,
  Fechainicio,
  Costoomensual,
  Tipodeplan,
  LEFT(Correoelectronico, 3) + '@mail.' + RIGHT(Correoelectronico, 3) AS CorreoE,
  LEFT(NumerodeTarjeta, 5) + '****-****-***' + RIGHT(NumerodeTarjeta, 1) AS NumerodeTarjeta
  from PracticaParte1.Suscriptores;
  GO
  --prueba
  select * from PracticaParte1.V_Suscriptores;
--24 Cree una tabla llamada facturas la cual registra los pagos mensuales de los suscriptores,
--haga las relaciones de PK y FK con las tablas existentes, según corresponda
USE HBO;
GO

CREATE TABLE PracticaParte1.Facturas (
    IDFactura INT PRIMARY KEY IDENTITY(1,1),
    IDsuscriptor INT NOT NULL,
    FechaFactura DATE NOT NULL DEFAULT(GETDATE()),
    MontoPagado DECIMAL(5,2) NOT NULL,
    EstadodelPago VARCHAR(20), 
    CONSTRAINT FK_Facturas_Suscriptores FOREIGN KEY (IDsuscriptor) REFERENCES PracticaParte1.Suscriptores(IDsuscriptor)
);
GO
--25 Realice una función que calcule los siguientes impuestos IVA (13%) HOSPITALES (6%), 
--modifique la tabla facturas y cree 3 campos nuevos, los dos impuestos y un campo de total (monto suscripción + IVA + HOSPITALES), no olvide la nomenclatura de las funciones
CREATE FUNCTION PracticaParte1.F_IVA (@Monto DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
  RETURN @Monto * 0.13; -- Función para calcular IVA (13%)
END;
GO

CREATE FUNCTION PracticaParte1.F_Hospitales (@Monto DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
 RETURN @Monto * 0.06; -- Función para calcular HOSPITALES (6%)
END;
GO
---
--altero la tabla para ingresar campos nuevos
ALTER TABLE PracticaParte1.Facturas
ADD 
IVA DECIMAL(10,2),
HOSPITALES DECIMAL(10,2),
TOTAL DECIMAL(10,2);
GO
--
--actualize todas las filas de la tabla Facturas 
--para recalcular los impuestos y el total
UPDATE PracticaParte1.Facturas
SET IVA = PracticaParte1.F_IVA(MontoPagado),
    HOSPITALES = PracticaParte1.F_Hospitales(MontoPagado),
    TOTAL = MontoPagado + PracticaParte1.F_IVA(MontoPagado) + PracticaParte1.F_Hospitales(MontoPagado);
GO
--26 Cree un trigger after insert que al insertar un suscriptor nuevo,
--llame a la función que calcula los impuestos e inserte los datos, incluso los totales correctamente en la tabla
CREATE TRIGGER PracticaParte1.TR_SuscriptorNuevo
ON PracticaParte1.Suscriptores
AFTER INSERT
AS
BEGIN
    INSERT INTO PracticaParte1.Facturas (
        IDsuscriptor, 
        MontoPagado, 
        IVA, 
        HOSPITALES, 
        TOTAL, 
        FechaFactura
    )
    SELECT 
        i.IDsuscriptor,
        i.Costoomensual,
        PracticaParte1.F_IVA(i.Costoomensual),
        PracticaParte1.F_Hospitales(i.Costoomensual),
        i.Costoomensual + PracticaParte1.F_IVA(i.Costoomensual) + PracticaParte1.F_Hospitales(i.Costoomensual),
        GETDATE()
    FROM inserted i;
END;
GO

---
--27 Cree un procedimiento almacenado que permita registrar nuevos suscriptores 
--(tome en cuenta que el SP tiene que disparar el trigger), ejecute un insert, adjunte captura
CREATE PROCEDURE PracticaParte1.SP_RegistrarSuscriptor
    @Nombrecompleto VARCHAR(100),
    @Correoelectronico VARCHAR(100),
    @Fechainicio DATE,
    @Tipodeplan VARCHAR(20),
    @Costoomensual DECIMAL(5,2),
    @Correo VARCHAR(100),
    @Password VARCHAR(100),
    @NumerodeTarjeta VARCHAR(25)
AS
BEGIN
    INSERT INTO PracticaParte1.Suscriptores
    (Nombrecompleto, Correoelectronico, Fechainicio, Tipodeplan, Costoomensual, Correo, Password, NumerodeTarjeta)
    VALUES
    (@Nombrecompleto, @Correoelectronico, @Fechainicio, @Tipodeplan, @Costoomensual, @Correo, @Password, @NumerodeTarjeta);
END;
GO

---
---paso 28
CREATE TABLE PracticaParte1.Visualizaciones (
    IDVisualizacion INT IDENTITY(1,1) PRIMARY KEY,
    IDsuscriptor INT NOT NULL,
    IDPelicula INT NOT NULL,
    FechadeVisualizacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (IDsuscriptor) REFERENCES PracticaParte1.Suscriptores(IDsuscriptor),
    FOREIGN KEY (IDPelicula) REFERENCES PracticaParte1.Pelicula(IDPelicula)
);
--inserts
-- Visualizaciones para Suscriptor 1 (4 visualizaciones)
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (1, 1);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (1, 2);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (1, 3);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (1, 4);

-- Visualizaciones para Suscriptor 2 (6 visualizaciones)
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (2, 5);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (2, 6);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (2, 7);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (2, 8);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (2, 9);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (2, 10);

-- Visualizaciones para Suscriptor 3 (8 visualizaciones)
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (3, 11);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (3, 12);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (3, 13);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (3, 14);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (3, 15);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (3, 16);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (3, 17);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (3, 18);

-- Visualizaciones para Suscriptor 4 (10 visualizaciones)
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (4, 19);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (4, 20);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (4, 21);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (4, 22);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (4, 23);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (4, 24);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (4, 25);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (4, 26);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (4, 27);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (4, 28);

-- Visualizaciones para Suscriptor 5 (17 visualizaciones)
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 29);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 30);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 31);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 32);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 33);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 34);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 35);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 36);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 37);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 38);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 39);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 40);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 41);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 42);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 43);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 44);
INSERT INTO PracticaParte1.Visualizaciones (IDsuscriptor, IDPelicula) VALUES (5, 45);

-- 30. Crear tabla Descuentos relacionada con Suscriptores y Visualizaciones
CREATE TABLE PracticaParte1.Descuentos (
    IDDescuento INT IDENTITY(1,1) PRIMARY KEY,
    IDsuscriptor INT NOT NULL,
    IDvisualizacion INT NOT NULL,
    PorcentajedeDescuento DECIMAL(5,2) NOT NULL CHECK (PorcentajedeDescuento >= 0 AND PorcentajedeDescuento <= 100),
    MontoDescontado DECIMAL(10,2) NOT NULL,
    FechadeAplicacion DATE NOT NULL DEFAULT GETDATE(),
	CONSTRAINT FK_Descuento_Suscriptor FOREIGN KEY (IDsuscriptor) REFERENCES PracticaParte1.Suscriptores (IDsuscriptor),
    CONSTRAINT FK_Descuento_Visualizacion FOREIGN KEY (IDvisualizacion) REFERENCES PracticaParte1.Visualizaciones (IDvisualizacion)
);
GO
--31: sp que registra descuentos de los suscriptores con base a cuantas pelis ven
CREATE OR ALTER PROCEDURE PracticaParte1.SP_RegistrarDescuentosss --nombre
AS
BEGIN
    INSERT INTO PracticaParte1.Descuentos ( --llama a los atributos de la tabla descuentos
        IDsuscriptor,
        IDvisualizacion,
        PorcentajedeDescuento,
        MontoDescontado,
        FechadeAplicacion
    )
    SELECT 
        V.IDsuscriptor, MAX(V.IDvisualizacion),
        CASE COUNT(*) -- las reglas impuestas
            WHEN 6 THEN 1
            WHEN 9 THEN 2
            WHEN 12 THEN 3
            WHEN 15 THEN 5
            ELSE 0
        END AS PorcentajeDescuento, CASE COUNT(*) -- las reglas impuestas p[ara actualizar el costo
            WHEN 6 THEN ROUND(0.01 * S.Costoomensual, 2)
            WHEN 9 THEN ROUND(0.02 * S.Costoomensual, 2)
            WHEN 12 THEN ROUND(0.03 * S.Costoomensual, 2)
            WHEN 15 THEN ROUND(0.05 * S.Costoomensual, 2)
            ELSE 0
        END AS MontoDescontado,
        GETDATE()
    FROM PracticaParte1.Visualizaciones V INNER JOIN PracticaParte1.Suscriptores S ON V.IDsuscriptor = S.IDsuscriptor
    GROUP BY V.IDsuscriptor, S.Costoomensual;
END;
GO

--pruebitas
exec PracticaParte1.SP_RegistrarDescuentosss;
select * from PracticaParte1.Descuentos;
select * from PracticaParte1.Visualizaciones;