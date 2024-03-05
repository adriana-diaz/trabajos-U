USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'BD_PROY_ADRIANA')
DROP DATABASE BD_PROY_ADRIANA
GO
/** SE CREA LA BASE DE DATOS**/
CREATE DATABASE BD_PROY_ADRIANA
GO
 
/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE BD_PROY_ADRIANA
GO

/*Establece el formato de la fecha en dia/mes/año, 
cualquiera de las dos*/
SET DATEFORMAT dmy
SET LANGUAGE spanish
GO
/*Creación de las tablas*/
--Se crea la tabla Clientes
CREATE TABLE CLIENTES(
	CODIGO_CLIENTE numeric(5, 0)	NOT NULL,
	NOMBRE			VARCHAR(25)		NOT NULL,
	DIRECCION		VARCHAR(50)		NOT NULL,
	PROVINCIA		VARCHAR(20)		NULL,
	TELEFONO		VARCHAR(11)		NULL
CONSTRAINT [PK_CLIENTES] PRIMARY KEY ([CODIGO_CLIENTE])
) 
GO
--Se crea la tabla Proyectos
CREATE TABLE PROYECTOS (
	COD_PROYECTO	VARCHAR(5)		NOT NULL,
	DESCRIPCION		VARCHAR(60)		NULL,
	COSTO_TOTAL		NUMERIC(10,2)	NOT NULL,
	MONTO_PAGADO	NUMERIC(10,2)	NOT NULL,
	FEC_INICIO		DATETIME		NOT NULL,
	FEC_FIN			DATETIME		NOT NULL,
	CODIGO_CLIENTE	NUMERIC(5, 0)	NOT NULL,
	CONSTRAINT PK_PROYECTOS PRIMARY KEY(COD_PROYECTO), 
	CONSTRAINT FK_CLIENTES_PROYECTOS FOREIGN KEY (CODIGO_CLIENTE) 
	REFERENCES CLIENTES(CODIGO_CLIENTE),
	CONSTRAINT CHK_NOPAGOSDEMAS CHECK (MONTO_PAGADO <= COSTO_TOTAL)
)
GO
/*ALTER TABLE PROYECTOS ADD MONTO_PAGADO NUMERIC(10,2) NOT NULL DEFAULT(0)
GO */
--Se crea la tabla Pagos
CREATE TABLE PAGOS(
	NUM_PAGO		INT				NOT NULL ,
	DETALLE			VARCHAR(60)		NULL,
	MONTO			NUMERIC(10,2)	NOT NULL,
	FEC_PAGO		DATETIME		NOT NULL,
	COD_PROYECTO	VARCHAR(5)		NOT NULL,
	CONSTRAINT PK_PAGOS PRIMARY KEY(NUM_PAGO),
	CONSTRAINT FK_PROYECTOS_PAGOS FOREIGN KEY(COD_PROYECTO) REFERENCES PROYECTOS(COD_PROYECTO)
)
GO
--Se crea la tabla Pagos (Aca se guardan en un futuro los consecutivos de proyectos y pagos)
CREATE TABLE PARAMETROS(
	COD_PARAMETRO	INT				NOT NULL ,
	DETALLE			VARCHAR(60)		NOT NULL,
	CONSECUTIVO		INT				NOT NULL,
	CONSTRAINT PK_PARAMETROS PRIMARY KEY(COD_PARAMETRO)
)
GO
-- Inserción de datos en la tabla de Clientes
INSERT INTO CLIENTES([CODIGO_CLIENTE],[NOMBRE],[DIRECCION],[PROVINCIA],[TELEFONO])
     VALUES(1,'Pedro','San Pablo', 'Heredia','8825-6467')
INSERT INTO CLIENTES([CODIGO_CLIENTE],[NOMBRE],[DIRECCION],[PROVINCIA],[TELEFONO])
     VALUES(2,'Ana','San Padro', 'San Jose','8815-6764')
GO
-- Inserción de datos en la tabla de Proyectos
INSERT INTO PROYECTOS (COD_PROYECTO,DESCRIPCION, COSTO_TOTAL,MONTO_PAGADO,FEC_INICIO,FEC_FIN, CODIGO_CLIENTE) VALUES
	(1,'Construccion Cochera',50000,0,'01/05/2022','30/03/2023',1)
INSERT INTO PROYECTOS (COD_PROYECTO,DESCRIPCION, COSTO_TOTAL,MONTO_PAGADO,FEC_INICIO,FEC_FIN,CODIGO_CLIENTE) VALUES
	(2,'Pintura Exterior',80000,0,'01/08/2022','20/12/2023', 1)
INSERT INTO PROYECTOS (COD_PROYECTO,DESCRIPCION, COSTO_TOTAL,MONTO_PAGADO,FEC_INICIO,FEC_FIN,CODIGO_CLIENTE) VALUES
	(3,'Cambio de techos',95000,0,'01/10/2023','20/03/2024', 2)
GO
-- Inserción de datos en la tabla de Parámetros
INSERT INTO PARAMETROS (COD_PARAMETRO,DETALLE,CONSECUTIVO) VALUES
	(1,'Consecutivo Proyectos',5)
INSERT INTO PARAMETROS (COD_PARAMETRO,DETALLE,CONSECUTIVO) VALUES
	(2,'Consecutivo Pagos',525)
GO
-- Inserción de datos en la tabla de PAGOS
INSERT INTO PAGOS (NUM_PAGO,DETALLE, MONTO,FEC_PAGO,COD_PROYECTO) VALUES
	(1124321,'Construccion Casa',50000,'01/05/2022',1)
	GO


/**ENUNCIADOS**/

/*1. Crear un procedimiento que reciba como parametros 
TODOS los datos de pagos de un proyecto. Debe validar que el 
proyecto exista y en caso afirmativo insertar el pago.*/

-- Crear un procedimiento almacenado
-- Crear un procedimiento almacenado
CREATE PROCEDURE InsertarPago
    @COD_PROYECTO VARCHAR(5),
    @DETALLE VARCHAR(60),
    @MONTO NUMERIC(10, 2),
    @FEC_PAGO DATETIME
AS
BEGIN
    -- Verificar si el proyecto existe
    IF EXISTS (SELECT 1 FROM PROYECTOS WHERE COD_PROYECTO = @COD_PROYECTO)
    BEGIN
        -- Insertar el pago
        INSERT INTO PAGOS (DETALLE, MONTO, FEC_PAGO, COD_PROYECTO)
        VALUES (@DETALLE, @MONTO, @FEC_PAGO, @COD_PROYECTO)
        PRINT 'Pago insertado correctamente.'
    END
    ELSE
    BEGIN
        PRINT 'El proyecto no existe. No se pudo insertar el pago.'
    END
END
GO

EXEC InsertarPago
    @COD_PROYECTO = 'ADRIANA_PROYECTO',
    @DETALLE = 'PROYECTO U',
    @MONTO = 1000, 
    @FEC_PAGO = '2024-03-05 14:30:00' 

/** EJERCICIO 2**/
/*2. Modificar el procedimiento de insertar pago para que:
	-*- En caso de existir el proyecto obtener el MONTO_PAGADO del proyecto
	-*- Sumarle al acumulado el monto  del pago
	- Insertar el nuevo pago
	-*- Actualizar el campo MONTO_PAGADO de proyectos, 
		con el nuevo monto (MONTO_PAGADO + MONTO) */

CREATE PROCEDURE InsertarPagoModificado
    @COD_PROYECTO VARCHAR(5),
    @DETALLE VARCHAR(60),
    @MONTO NUMERIC(10, 2),
    @FEC_PAGO DATETIME
AS
BEGIN
    DECLARE @MontoActual NUMERIC(10, 2)

    -- Verificar si el proyecto existe
    IF EXISTS (SELECT 1 FROM PROYECTOS WHERE COD_PROYECTO = @COD_PROYECTO)
    BEGIN
        -- Obtener el MONTO_PAGADO actual
        SELECT @MontoActual = MONTO_PAGADO FROM PROYECTOS WHERE COD_PROYECTO = @COD_PROYECTO

        -- Sumar el monto del nuevo pago al acumulado
        SET @MontoActual = @MontoActual + @MONTO

        -- Insertar el nuevo pago
        INSERT INTO PAGOS (DETALLE, MONTO, FEC_PAGO, COD_PROYECTO)
        VALUES (@DETALLE, @MONTO, @FEC_PAGO, @COD_PROYECTO)

        -- Actualizar el campo MONTO_PAGADO en PROYECTOS
        UPDATE PROYECTOS SET MONTO_PAGADO = @MontoActual WHERE COD_PROYECTO = @COD_PROYECTO

        PRINT 'Pago insertado y MONTO_PAGADO actualizado correctamente.'
    END
    ELSE
    BEGIN
        PRINT 'El proyecto no existe. No se pudo insertar el pago.'
    END
END
GO
/** PRUEBA **/
-- Ejecutar el procedimiento almacenado
EXEC InsertarPagoModificado
    @COD_PROYECTO = 'ADRIANA_PROYECTO',
    @DETALLE = 'PROYECTO U',
    @MONTO =  85340,
    @FEC_PAGO = '2024-03-05 14:30:00' 

/** EJERCICIO3 **/

/*3. Modificar el procedimiento de insertar pago para que:
	- En caso de existir el proyecto obtener el MONTO_PAGADO del proyecto
	- Sumarle al acumulado el monto  del pago
	*- Validar que monto acumulado no supere COSTO_TOTAL. No hacer 
			el insert y el update (print abono supera costo total)
	- Insertar el nuevo pago
	- Actualizar el campo MONTO_PAGADO de proyectos, 
		con el nuevo monto (MONTO_PAGADO + MONTO) */

CREATE PROCEDURE Ejercicio3
    @COD_PROYECTO VARCHAR(5),
    @DETALLE VARCHAR(60),
    @MONTO NUMERIC(10, 2),
    @FEC_PAGO DATETIME
AS
BEGIN
    DECLARE @MontoActual NUMERIC(10, 2)
    DECLARE @CostoTotal NUMERIC(10, 2)

    -- Verificar si el proyecto existe
    IF EXISTS (SELECT 1 FROM PROYECTOS WHERE COD_PROYECTO = @COD_PROYECTO)
    BEGIN
        -- Obtener el MONTO_PAGADO actual y el COSTO_TOTAL
        SELECT @MontoActual = MONTO_PAGADO, @CostoTotal = COSTO_TOTAL
        FROM PROYECTOS WHERE COD_PROYECTO = @COD_PROYECTO

        -- Sumar el monto del nuevo pago al acumulado
        SET @MontoActual = @MontoActual + @MONTO

        -- Validar que el monto acumulado no supere el COSTO_TOTAL
        IF @MontoActual <= @CostoTotal
        BEGIN
            -- Insertar el nuevo pago
            INSERT INTO PAGOS (DETALLE, MONTO, FEC_PAGO, COD_PROYECTO)
            VALUES (@DETALLE, @MONTO, @FEC_PAGO, @COD_PROYECTO)

            -- Actualizar el campo MONTO_PAGADO en PROYECTOS
            UPDATE PROYECTOS SET MONTO_PAGADO = @MontoActual WHERE COD_PROYECTO = @COD_PROYECTO

            PRINT 'Pago insertado y MONTO_PAGADO actualizado correctamente.'
        END
        ELSE
        BEGIN
            PRINT 'El abono supera el costo total del proyecto. No se pudo insertar el pago.'
        END
    END
    ELSE
    BEGIN
        PRINT 'El proyecto no existe. No se pudo insertar el pago.'
    END
END
GO


-- Ejecutar el procedimiento almacenado
EXEC Ejercicio3
    @COD_PROYECTO = 'ADRIANA_PROYECTO',
    @DETALLE = 'PROYECTO U',
    @MONTO = 100
    @FEC_PAGO = '2024-03-05 14:30:00'


	/** ejercicio 4 **/

	CREATE PROCEDURE InsertarPagoConsecutivo
    @COD_PROYECTO VARCHAR(5),
    @DETALLE VARCHAR(60),
    @MONTO NUMERIC(10, 2),
    @FEC_PAGO DATETIME
AS
BEGIN
    DECLARE @MontoActual NUMERIC(10, 2)
    DECLARE @Consecutivo INT

    -- Verificar si el proyecto existe
    IF EXISTS (SELECT 1 FROM PROYECTOS WHERE COD_PROYECTO = @COD_PROYECTO)
    BEGIN
        -- Obtener el MONTO_PAGADO actual
        SELECT @MontoActual = MONTO_PAGADO FROM PROYECTOS WHERE COD_PROYECTO = @COD_PROYECTO

        -- Sumar el monto del nuevo pago al acumulado
        SET @MontoActual = @MontoActual + @MONTO

        -- Buscar el código del último pago
        SELECT @Consecutivo = MAX(NUM_PAGO) FROM PAGOS

        -- Generar el valor del siguiente consecutivo
        SET @Consecutivo = @Consecutivo + 1

        -- Insertar el nuevo pago
        INSERT INTO PAGOS (NUM_PAGO, DETALLE, MONTO, FEC_PAGO, COD_PROYECTO)
        VALUES (@Consecutivo, @DETALLE, @MONTO, @FEC_PAGO, @COD_PROYECTO)

        -- Actualizar el campo MONTO_PAGADO en PROYECTOS
        UPDATE PROYECTOS SET MONTO_PAGADO = @MontoActual WHERE COD_PROYECTO = @COD_PROYECTO

        PRINT 'Pago insertado y MONTO_PAGADO actualizado correctamente.'
    END
    ELSE
    BEGIN
        PRINT 'El proyecto no existe. No se pudo insertar el pago.'
    END
END
GO


-- Ejecutar el procedimiento almacenado
EXEC InsertarPagoConsecutivo
    @COD_PROYECTO = 'TU_CODIGO_PROYECTO',
    @DETALLE = 'Detalles del pago',
    @MONTO = 100.00, -- Cambia esto al monto real del pago
    @FEC_PAGO = '2024-03-05 14:30:00' -- Cambia esto a la fecha y hora real del pago
