Use Northwind

Select* From Categories
Select* From CustomerDemographics
Select* From CustomerCustomerDemo
Select* From Customers
Select* From EmployeeTerritories
Select* From Employees
Select* From [Order Details]
Select* From Orders
Select* From Products
Select* From Region
Select* From Shippers
Select* From Suppliers
Select* From Territories
--Consultas
--1)	Obtener la cantidad total de pedidos realizados.
Select count( OrderID) From Orders

--2)	Mostrar el nombre de los empleados que tienen el título "Sales Representative".

Select FirstName,LastName From Employees Where Title Like 'Sales Representative'

--3)	Obtener el total de ventas por categoría de producto.
Select  Count (UnitsOnOrder) as cantidad From  Products Group BY CategoryID
select * From Products

