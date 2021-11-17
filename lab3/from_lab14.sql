use Northwind

--1
select ProductName, UnitPrice, Suppliers.Address
from Products inner join Suppliers
    on Products.SupplierID = Suppliers.SupplierID
where UnitPrice between 20 and 30

--2
select ProductName, UnitsInStock
from Products inner join Suppliers
    on Products.SupplierID = Suppliers.SupplierID
where CompanyName = 'Tokyo Traders'

--3 zadanie moze byc na kolokwium
select Address
from Customers left outer join Orders O
    on Customers.CustomerID = O.CustomerID and year(OrderDate) = 1997
where year(OrderDate) is null

--4
select CompanyName, Phone
from Suppliers S inner join Products P
    on S.SupplierID = P.SupplierID
where UnitsInStock = 0

