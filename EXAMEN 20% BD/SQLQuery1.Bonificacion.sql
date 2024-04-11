--USE Northwind
--GO

--1)	Obtener la cantidad total de pedidos realizados.
--SELECT COUNT (*) AS 'Cantidad_Total_Pedidos'  FROM Orders 
--GO

--2)	Mostrar el nombre de los empleados que tienen el título "Sales Representative".
--SELECT FirstName, Lastname FROM Employees WHERE Title = 'Sales representative'
--GO

--3)	Obtener el total de ventas por categoría de producto.
--SELECT COUNT(UnitsOnOrder) As 'Total_Ventas_Categoria' FROM Products GROUP BY CategoryID
--GO

/*4)	Mostrar los 10 clientes con más pedidos realizados.
SELECT TOP 10 ContactName, COUNT(OrderID) AS PedidosRealizados FROM Customers c
JOIN Orders p ON c.CustomerID = p.CustomerID
GROUP BY ContactName
ORDER BY PedidosRealizados DESC;*/
--GO

/*5)	Obtener el nombre del producto y la cantidad de unidades vendidas para los 5 productos más vendidos.
SELECT TOP 5 ProductName, SUM(UnitsOnOrder) AS UnidadesVendidas FROM Products p
JOIN Orders o ON p.ProductID = p.ProductID
GROUP BY ProductName
ORDER BY UnidadesVendidas DESC
GO*/

/*6)	Mostrar el país de los clientes que han realizado pedidos y la cantidad total de pedidos por país, ordenado de mayor a menor.
SELECT  Country, COUNT(OrderID) AS PedidosRealizados FROM  Customers c 
JOIN  Orders p ON c.CustomerID = p.CustomerID
GROUP BY  Country 
ORDER BY PedidosRealizados DESC;
GO*/

/*7)	Obtener el promedio de unidades vendidas por pedido.
SELECT ProductName, AVG(UnitsOnOrder) AS Promedio FROM Products
GROUP BY ProductName
GO*/

/*8)	Listar los productos que contienen la palabra 'chocolate' en su nombre.FR
SELECT ProductName FROM Products WHERE ProductName LIKE  '%Chocolate%'
GO*/

/*9)	Mostrar los nombres de los empleados que tienen una fecha de nacimiento posterior al 1 de enero de 1960.
SELECT FirstName,LastName FROM Employees WHERE BirthDate > '1960-01-01'
GO*/

/*10)	Obtener el nombre del producto, el precio unitario y el nombre del proveedor para todos los productos.
SELECT P.ProductName,P.UnitPrice,S.CompanyName FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
GO*/
