--CLASE 9
--Universidad Latina de Costa Rica
--Curso : BISI35 Administracion de Bases de Datos
--Autora : Adriana Diaz Vargas 
--Profesor : Alejandro Serrano Perez
--Lab 9
--Fecha : 08/07/25
--CAMBIO DE BD
--1. Cree una nueva base de datos llamada ControlInventario.
CREATE DATABASE ControlInventario;
GO

USE ControlInventario;
GO
--paso 2
--  -Inventario: Contiene información sobre los productos en stock, incluyendo un identificador único para cada producto, su nombre y la cantidad disponible, precio del artículo
CREATE TABLE Inventario (
    ID_Producto INT PRIMARY KEY,
    Nombre NVARCHAR(150),
    CantidadDisponible INT,
    Precio MONEY
);
GO

---Ventas: Contiene información sobre las ventas, incluyendo un identificador único para cada venta, id cliente, el producto vendido y la cantidad vendida.
CREATE TABLE Ventas (
    ID_Venta INT IDENTITY(1,1) PRIMARY KEY,
    ID_Cliente INT,
    ID_Producto INT,
    CantidadVendida INT
);
GO
--paso 3
--3.Desarrollar un trigger llamado TR_ControlVentas que se dispare automáticamente cada vez que se registre una nueva venta en la tabla Ventas.
CREATE TRIGGER TR_ControlVentas
ON Ventas
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @ID_Producto INT, @CantidadVendida INT, @ID_Cliente INT, @Existencias INT;

    -- aqui va a obtener los datos insertados desde la tabla temporal inserted
    SELECT 
        @ID_Producto = ID_Producto, @CantidadVendida = CantidadVendida,@ID_Cliente = ID_Cliente
    FROM inserted;

    -- aqui deberás realizar el select previo mostrando las unidades disponibles
    SELECT @Existencias = CantidadDisponible
    FROM Inventario
    WHERE ID_Producto = @ID_Producto;

    PRINT 'Unidades disponibles antes de la venta: ' + CAST(@Existencias AS VARCHAR);
    -- Verificar que haya suficientes existencias del producto antes de realizar la venta.
    -- Si la cantidad vendida es mayor que la cantidad disponible en el inventario,
    -- la venta no debe registrarse y se debe mostrar un mensaje de error.
    IF @CantidadVendida > @Existencias
    BEGIN
        RAISERROR('No hay suficiente inventario para realizar la venta.', 16, 1);
        RETURN;
    END
    -- Realice el insert de la venta
    INSERT INTO Ventas (ID_Cliente, ID_Producto, CantidadVendida)
    SELECT ID_Cliente, ID_Producto, CantidadVendida
    FROM inserted;

    -- Restar la cantidad vendida del producto correspondiente
    -- en la tabla Inventario.

    UPDATE Inventario
    SET CantidadDisponible = CantidadDisponible - @CantidadVendida
    WHERE ID_Producto = @ID_Producto;

    -- Deberá realizar el select posterior mostrando las unidades disponibles
    -- después del insert de la venta
    DECLARE @NuevoStock INT;
    SELECT @NuevoStock = CantidadDisponible FROM Inventario WHERE ID_Producto = @ID_Producto;

    PRINT 'Unidades disponibles después de la venta: ' + CAST(@NuevoStock AS VARCHAR);
END
GO

select * from Ventas
select * from Inventario
INSERT INTO Inventario (ID_Producto, Nombre, CantidadDisponible, Precio) VALUES
(4, 'Barbie', 10, 5000);
GO

INSERT INTO Ventas (ID_Cliente, ID_Producto, CantidadVendida)
VALUES (119320150, 1, 3);  -- Venta de 3 unidades

INSERT INTO Ventas (ID_Cliente, ID_Producto, CantidadVendida)
VALUES (119320150, 2, 6);  -- aqui deberia de fallar ya q solo hay 5 no 6