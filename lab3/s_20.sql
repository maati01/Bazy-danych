use Northwind

--1
select ProductName, UnitPrice, Address
from Products
    inner join Suppliers S
        on Products.SupplierID = S.SupplierID
    inner join Categories C
        on Products.CategoryID = C.CategoryID
where CategoryName = 'Meat/Poultry'

--2
select ProductName, UnitPrice, CompanyName
from Products
    inner join Categories C
        on Products.CategoryID = C.CategoryID
    inner join Suppliers S
        on Products.SupplierID = S.SupplierID
where CategoryName = 'Confections'

--3
select C.CompanyName, C.Phone
from Orders
    inner join Customers C
        on Orders.CustomerID = C.CustomerID
    inner join Shippers S
        on Orders.ShipVia = S.ShipperID
where S.CompanyName = 'United Package' and year(ShippedDate) = 1997

--4
select CompanyName, Phone
from Customers
    inner join Orders O
        on Customers.CustomerID = O.CustomerID
    inner join [Order Details] [O D]
        on O.OrderID = [O D].OrderID
    inner join Products P
        on [O D].ProductID = P.ProductID
    inner join Categories C on P.CategoryID = C.CategoryID
where CategoryName = 'Confections'