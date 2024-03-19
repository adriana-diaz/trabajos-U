/** SE CREA LA BASE DE DATOS**/
CREATE DATABASE BD_PROY_Quizzzz2
GO
/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE BD_PROY_Quizzzz2
GO
/** INSTRUCCION QUE PERMITE CREAR LOS DIAGRAMAS**/
Alter authorization on database:: BD_PROY_Quizzzz2 to sa
GO
/*Establece el formato de la fecha en dia/mes/año,
cualquiera de las dos*/
SET DATEFORMAT dmy
SET LANGUAGE spanish
GO
CREATE TABLE PROYECTOS (
COD_PROYECTO VARCHAR(5) NOT NULL,
DESCRIPCION VARCHAR(60) NULL,
COSTO_TOTAL NUMERIC(10,2) NOT NULL,
FEC_INICIO DATE NULL,
FEC_FIN DATE NULL,
CONSTRAINT PK_PROYECTOS PRIMARY KEY(COD_PROYECTO),
)
GO
CREATE TABLE PAGOS(
NUM_PAGO varchar(5) NOT NULL,
DETALLE varchar(60) NULL,
MONTO_ABONO numeric(10, 2) NOT NULL,
FEC_PAGO datetime NULL,
COD_PROYECTO varchar(5) NOT NULL,
CONSTRAINT [PK_PAGO] PRIMARY KEY (NUM_PAGO ASC),
CONSTRAINT [FK_PROYECTOS_PAGOS] FOREIGN KEY(COD_PROYECTO)
REFERENCES PROYECTOS (COD_PROYECTO)
)
 
GO
INSERT INTO PROYECTOS (COD_PROYECTO, DESCRIPCION, COSTO_TOTAL, FEC_INICIO, FEC_FIN)
VALUES
(1,'Construccion Cochera',5000, '01/04/2023','30/09/2023')
INSERT INTO PROYECTOS (COD_PROYECTO, DESCRIPCION, COSTO_TOTAL, FEC_INICIO, FEC_FIN)
VALUES
(2,'Construccion CASA',8000, '01/10/2023','20/08/2024')
GO
 
-- Insertar datos en la tabla PAGOS
INSERT INTO PAGOS (NUM_PAGO, DETALLE, MONTO_ABONO, FEC_PAGO, COD_PROYECTO)
VALUES
('001', 'Pago inicial', 2000.00, '2023-05-15T00:00:00', '1');
 
INSERT INTO PAGOS (NUM_PAGO, DETALLE, MONTO_ABONO, FEC_PAGO, COD_PROYECTO)
VALUES
('002', 'Segundo pago', 1500.00, '2023-06-10T00:00:00', '1');
 
-- Procedimiento Almacenado
CREATE PROCEDURE SP_MontoPendienteeeee
AS
BEGIN
    SELECT PA.NUM_PAGO,
           PA.MONTO_ABONO AS MontoPagado,
           1 AS CantidadPagos,
           (PR.COSTO_TOTAL - PA.MONTO_ABONO) AS MontoPendiente
    FROM PROYECTOS PR
    INNER JOIN PAGOS PA ON PR.COD_PROYECTO = PA.COD_PROYECTO
END
GO
 
EXEC SP_MontoPendienteeeee
 
 
 
-- Vista
CREATE VIEW VW_InfoProyectos AS
SELECT DESCRIPCION AS NombreProyecto,
       LEN(DESCRIPCION) AS CantidadLetras,
       MONTH(FEC_INICIO) AS MesCreacion,
       YEAR(FEC_INICIO) AS AnioCreacion,
       DATEDIFF(DAY, GETDATE(), FEC_FIN) AS DiasParaFinalizar,
       DATEDIFF(WEEK, GETDATE(), FEC_FIN) AS SemanasParaFinalizar,
       DATEDIFF(MONTH, GETDATE(), FEC_FIN) AS MesesParaFinalizar
FROM PROYECTOS
GO
SELECT * FROM VW_InfoProyectos