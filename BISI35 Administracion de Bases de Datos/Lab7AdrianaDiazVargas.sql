--Universidad Latina de Costa Rica
--Curso : BISI35 Administracion de Bases de Datos
--Autora : Adriana Diaz Vargas 
--Profesor : Alejandro Serrano Perez
--Lab 7
--Fecha : 25/06/25
--bajamos la bd desde el campus clase 3
--cambio de bd
USE Northwind
GO
--crear vista basica
--/ paso 1
CREATE VIEW V_Ventas2
AS
SELECT 
O.OrderID,
O.EmployeeID,
O.ShipName,
OD.ProductID,
P.CategoryID,
CA.CategoryName,
CA.Description
FROM Orders AS O
INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
INNER JOIN Products AS P ON OD.ProductID = P.ProductID
INNER JOIN Categories AS CA ON P.CategoryID = CA.CategoryID;

--CONSULTAR VISTA
--/paso2
Select * from dbo.V_Ventas2
GO
--AGREGAR ALIAS A LA VISTA 
--/paso3
ALTER VIEW V_Ventas2
AS
SELECT 
O.OrderID    AS 'Id de la orden', 
O.EmployeeID AS 'Id del empleado',
O.ShipName   AS 'Id del barco',
OD.ProductID AS 'Id del producto',
P.CategoryID AS 'Id de la categoria',
CA.CategoryName AS 'Nombre de la categoria',
CA.Description
FROM Orders AS O
INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
INNER JOIN Products AS P ON OD.ProductID = P.ProductID
INNER JOIN Categories AS CA ON P.CategoryID = CA.CategoryID;
GO
--
--PASO4
Select * from dbo.V_Ventas2
GO
--SP que nos genera un script de como se ve la vista
--/PASO5
SP_HELPTEXT V_Ventas2
GO
--ENCRIPTAR VISTA
--/PASO6
ALTER VIEW V_Ventas2
WITH ENCRYPTION
AS
SELECT 
O.OrderID    AS 'Id de la orden', 
O.EmployeeID AS 'Id del empleado',
O.ShipName   AS 'Id del barco',
OD.ProductID AS 'Id del producto',
P.CategoryID AS 'Id de la categoria',
CA.CategoryName AS 'Nombre de la categoria',
CA.Description
FROM Orders AS O
INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
INNER JOIN Products AS P ON OD.ProductID = P.ProductID
INNER JOIN Categories AS CA ON P.CategoryID = CA.CategoryID;
GO
--Prueba para validar si encripto
SP_HELPTEXT V_Ventas2
GO
--AGREGAR A LA VISTA SCHEMABINDING, GENERA UNA RESTRICCION DE TIPO ESQUEMA 
--PASO 7
ALTER VIEW V_Ventas2
WITH ENCRYPTION, SCHEMABINDING
AS
SELECT 
O.OrderID    AS 'Id de la orden', 
O.EmployeeID AS 'Id del empleado',
O.ShipName   AS 'Id del barco',
OD.ProductID AS 'Id del producto',
P.CategoryID AS 'Id de la categoria',
CA.CategoryName AS 'Nombre de la categoria',
CA.Description
FROM Orders AS O
INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
INNER JOIN Products AS P ON OD.ProductID = P.ProductID
INNER JOIN Categories AS CA ON P.CategoryID = CA.CategoryID;
GO
--paso 8 / ELIMINAR TABLA QUE ESTE ASOCIADA A LA VISTA (SPOILER NO DEJA)
DROP TABLE dbo.[Order Details]
GO
--CREAR VISTA 
--PASO9
CREATE VIEW V_ClientesPorPais2
AS
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Country
FROM dbo.Customers
WHERE Country = 'USA'
GO
--MODIFICAR UNA VISTA (la de arriba) CON FILTRO EN ESPECIFICO (LIMITAR INSERTS UNICAMENTE A UN PAIS EN ESPECIFICO)
--PASO9
ALTER VIEW V_ClientesPorPais2
AS
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Country
FROM dbo.Customers
WHERE Country = 'MEXICO'
WITH CHECK OPTION 
GO
--INSERTAR DATOS VALIDOS POR MEDIO DE LA VISTA
--PASO10
INSERT INTO V_ClientesPorPais2
(CustomerID,CompanyName,ContactName,ContactTitle,Country)
VALUES
('IT1', 'INTEL', 'ADRIANA DIAZ', 'IT', 'MEXICO')
GO

--INSERTAR DATOS INVALIDOS POR MEDIO DE LA VISTA
--PASO11
INSERT INTO V_ClientesPorPais2
(CustomerID,CompanyName,ContactName,ContactTitle,Country)
VALUES
('IT2', 'IBM', 'JOSE DIAZ', 'IT', 'USA')
GO
