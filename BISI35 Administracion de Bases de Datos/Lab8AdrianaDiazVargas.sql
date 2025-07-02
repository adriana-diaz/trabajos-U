--Universidad Latina de Costa Rica
--Curso : BISI35 Administracion de Bases de Datos
--Autora : Adriana Diaz Vargas 
--Profesor : Alejandro Serrano Perez
--Lab 8
--Fecha : 01/06/25

--cambio de bd
USE Northwind;
GO
--1. Cree un procedimiento para insertar registros en la tabla Employees utilizando los campos, LastName, FirstName, Title, Address, City
CREATE PROCEDURE SP_RegistrarEmployees
    @LastName NVARCHAR(50),@FirstName NVARCHAR(50),@Title NVARCHAR(50),@Address NVARCHAR(100),@City NVARCHAR(50)
AS
BEGIN
    INSERT INTO Employees (LastName, FirstName, Title, Address, City)
    VALUES (@LastName, @FirstName, @Title, @Address, @City)
END
GO
	SELECT * FROM Employees
--2. Ejecute 5 veces el procedimiento de insertar (En el campo City envíe provincias de CR, al menos 2 deben ser Heredia (aqui va captura)

EXEC SP_RegistrarEmployees 'Diaz', 'Adriana', 'Developer', 'Av. Central 123', 'Heredia'; --heredia
EXEC SP_RegistrarEmployees 'Bonilla', 'Samuel', 'DBA', 'Calle Real 22', 'Heredia'; --heredia
EXEC SP_RegistrarEmployees 'Goyenaga', 'Ignacio', 'QA', 'Av. 10', 'Alajuela';
EXEC SP_RegistrarEmployees 'Diaz', 'Pedro', 'Consultor', 'Calle 5', 'Cartago';
EXEC SP_RegistrarEmployees 'Vega', 'Zoe', 'Project Manager', 'Diagonal 2', 'Puntarenas';
GO
--3. Cree un procedimiento para editar registros donde el campo City sea Heredia, actualice el campo Title por DBA.(aqui va captura)
CREATE PROCEDURE SP_ActualizarCity
AS
BEGIN
    UPDATE Employees
    SET Title = 'DBA'
    WHERE City = 'Heredia'
END
GO

EXEC SP_ActualizarCity;
--4. Cree un procedimiento para eliminar registros en la tabla Employees donde el campo City sea Heredia, agregue el conteo de registros ROWCOUNT adjunte captura
CREATE PROCEDURE SP_EliminarCity
AS
BEGIN
    DELETE FROM Employees
    WHERE City = 'Heredia';
    PRINT 'Registros eliminados: ' + CAST(@@ROWCOUNT AS VARCHAR);
END
GO

EXEC SP_EliminarCity;
--5. Cree un procedimiento para consultar las tablas ORDERS, [ORDER DETAILS], 
--PRODUCTS debe incluir los campos CUSTOMERID, ORDERID, ORDDERDATE, PRODUCTNAME, UNITPRICE, QUANTITY 
--adjunte captura
CREATE PROCEDURE SP_ConsultarOP
AS
BEGIN
    SELECT 
    O.CustomerID,
     O.OrderID,
     O.OrderDate,
      P.ProductName,
     OD.UnitPrice,
     OD.Quantity
    FROM Orders AS O
    INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
    INNER JOIN Products AS P ON OD.ProductID = P.ProductID
END
GO

EXEC SP_ConsultarOP;

--6. Cree una función que calcule un descuento del 10% para la tabla [ORDER DETAILS], 
--deberá mostrarlo en un select que llame la función, utilice el alias descuento para mostrarlo en pantalla, adjunte captura
CREATE FUNCTION FN_DescuentoLab8 (@Subtotal MONEY)
RETURNS MONEY
AS
BEGIN
    RETURN @Subtotal * 0.10 --10% de descuento
END
GO
SELECT 
    OrderID,ProductID,UnitPrice,Quantity,
    UnitPrice * Quantity AS Subtotal,
    dbo.FN_DescuentoLab8(UnitPrice * Quantity) AS Descuento --alias solicitado
FROM [Order Details];
GO

SELECT 
    OrderID,
    ProductID,
    UnitPrice,
    Quantity,
    UnitPrice * Quantity AS Subtotal,
    dbo.FN_DescuentoLab8(UnitPrice * Quantity) AS Descuento
FROM [Order Details];
GO

--7. Encripte las funciones y Procedimientos creados.
--primero la funcion
ALTER FUNCTION FN_DescuentoLab8 (@Subtotal MONEY)
RETURNS MONEY
WITH ENCRYPTION
AS
BEGIN
    RETURN @Subtotal * 0.10 --10% de descuento
END
GO
SELECT 
    OrderID,ProductID,UnitPrice,Quantity,
    UnitPrice * Quantity AS Subtotal,
    dbo.FN_DescuentoLab8(UnitPrice * Quantity) AS Descuento --alias solicitado
FROM [Order Details];
GO



--ALHORA EL SP
ALTER PROCEDURE SP_ConsultarOP
WITH ENCRYPTION
AS
BEGIN
    SELECT 
    O.CustomerID,
     O.OrderID,
     O.OrderDate,
      P.ProductName,
     OD.UnitPrice,
     OD.Quantity
    FROM Orders AS O
    INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
    INNER JOIN Products AS P ON OD.ProductID = P.ProductID
END

--Ahora si la pruebita
--sp
EXEC sp_helptext SP_ConsultarOP;
--funcion
EXEC sp_helptext FN_DescuentoLab8;
