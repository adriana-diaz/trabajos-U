--CLASE 11
--Universidad Latina de Costa Rica
--Curso : BISI35 Administracion de Bases de Datos
--Autora : Adriana Diaz Vargas 
--Profesor : Alejandro Serrano Perez
--Lab 11
--Fecha : 22/07/25
-- clase 11
--1. Cree la base datos transacciones TarjetaDebito
create database TransaccionesTarjetaDebito
GO

use TransaccionesTarjetaDebito
GO
--2. Cree la tabla movimientos: id transacción, id cliente, tipo de transacción (1,2,3 agregue una regla que solo permita insertar estos valores) monto transacción
CREATE TABLE Movimientos (
    IDtransaccion INT IDENTITY PRIMARY KEY,
    IDcliente INT NOT NULL,
    TipoTransaccion INT CHECK (TipoTransaccion IN (1, 2, 3)), -- 1 si es compra, 2 si es reversión, si es 3 es depósito
    MontoTransaccion MONEY NOT NULL,
);
GO

--3. Cree la tabla cliente: id cliente, nombre cliente, num tarjeta, saldo disponible, fecha vencimiento, codigo seguridad), establezca relaciones de PK y FK según corresponda
Create TABLE Cliente (
    IDcliente INT PRIMARY KEY,
    NombreCliente NVARCHAR(100),
    NumTarjeta VARCHAR(20),
    SaldoDisponible MONEY,
    FechaVencimiento DATE,
    CodigoSeguridad CHAR(3)
);
GO

-- lo ponemos para evitar que se inserten movimientos para un cliente que no existe 
ALTER TABLE Movimientos ADD CONSTRAINT FK_Movimientos_Cliente FOREIGN KEY (IDcliente) REFERENCES Cliente(IDcliente);
GO

--4. Inserte 4 clientes, donde todos los clientes tengan 100,000 de disponible
INSERT INTO Cliente (IDcliente, NombreCliente, NumTarjeta, SaldoDisponible, FechaVencimiento, CodigoSeguridad)
VALUES 
(1, 'Adriana Díaz', '1511-2622-3833-4744', 100000, '2028-12-01', '123'),
(2, 'Valeria Sandoval', '2722-3463-4494-5655', 100000, '2026-08-01', '456'),
(3, 'Nacho Goyenaga', '3343-4944-5755-6966', 100000, '2029-02-01', '789'),
(4, 'Samuel Villalobos', '4244-5585-6669-4777', 100000, '2026-11-01', '012');
GO
--pruebita
select * from Cliente
GO

--5. Cree un procedimiento almacenado utilizando transacciones explícitas
-- Creamos una función que calcula el 2% de impuesto aplicado a depósitos sinpe
CREATE FUNCTION FN_ImpuestoSinpe (@Monto MONEY)
RETURNS MONEY
AS
BEGIN
    RETURN @Monto * 0.02 -- Devuelve el 2% del monto recibido
END;
GO

CREATE PROCEDURE SP_RegistrarMovimiento --si el tipo de movimiento es 1 es una compra, debe restarse el saldo 
    @IDcliente INT,
    @TipoTransaccion INT,  -- 1 si es compra, 2 si es reversión, si es 3 es depósito
    @Monto MONEY

AS
BEGIN
    BEGIN TRANSACTION;

	DECLARE @SaldoDisponible MONEY,
	@NuevoSaldo MONEY,
	@Impuesto MONEY

    -- Obtenemos el saldo actual del cliente
    SELECT @SaldoDisponible = SaldoDisponible
    FROM Cliente
    WHERE IDcliente = @IDcliente;

    -- Validación y procesamiento según el tipo de movimiento
    IF @TipoTransaccion = 1 -- Si es compra
    BEGIN
     IF @Monto > @SaldoDisponible -- Verificamos que el cliente tenga suficiente saldo
     BEGIN
      RAISERROR('Fondos insuficientes, Intente otravez', 16, 1); -- Si no hay saldo suficiente y se lanza error
     ROLLBACK TRANSACTION; --revertimos la transacción
       RETURN;
        END;
        SET @NuevoSaldo = @SaldoDisponible - @Monto; -- ser calcula el nuevo saldo y lo actualizamos

        UPDATE Cliente
        SET SaldoDisponible = @NuevoSaldo
        WHERE IDcliente = @IDcliente;

        -- Insertamos la transacción en la tabla de movimientos
        INSERT INTO Movimientos (IDcliente, TipoTransaccion, MontoTransaccion) VALUES (@IDcliente, @TipoTransaccion, @Monto);
    END

    ELSE IF @TipoTransaccion = 2 --reversion
    BEGIN
        SET @NuevoSaldo = @SaldoDisponible + @Monto; --ya que devuelve dinero SaldoDisponible + Monto es el "nuevo saldo"
        UPDATE Cliente SET SaldoDisponible = @NuevoSaldo WHERE IDcliente = @IDcliente;
        INSERT INTO Movimientos (IDcliente, TipoTransaccion, MontoTransaccion) VALUES (@IDcliente, @TipoTransaccion, @Monto);
    END

    ELSE IF @TipoTransaccion = 3 -- depósito
    BEGIN
     SET @Impuesto = dbo.FN_ImpuestoSinpe(@Monto);
      SET @NuevoSaldo = @SaldoDisponible + (@Monto - @Impuesto); -- Sumamos el monto neto (quitando el impuesto)

     UPDATE Cliente SET SaldoDisponible = @NuevoSaldo WHERE IDcliente = @IDcliente;

    INSERT INTO Movimientos (IDcliente, TipoTransaccion, MontoTransaccion)VALUES (@IDcliente, @TipoTransaccion, @Monto);
    END

    -- Confirmamos la transacción (paso 8)
    COMMIT TRANSACTION;
END;
GO

--ahoras las pruebasss
 EXEC SP_RegistrarMovimiento @IDcliente = 1, @TipoTransaccion = 1, @Monto = 30000;

 SELECT * FROM Cliente;
SELECT * FROM Movimientos;

 EXEC SP_RegistrarMovimiento @IDcliente = 1, @TipoTransaccion = 2, @Monto = 30000;
  SELECT * FROM Cliente;
SELECT * FROM Movimientos;

 EXEC SP_RegistrarMovimiento @IDcliente = 3, @TipoTransaccion = 3, @Monto = 50000;

   SELECT * FROM Cliente;
SELECT * FROM Movimientos;

 EXEC SP_RegistrarMovimiento @IDCliente = 1, @TipoTransaccion = 1, @Monto = 999999;