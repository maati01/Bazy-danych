use Northwind

--1
select CompanyName, Phone
from Customers
where CustomerID in (select O.CustomerID from Shippers
 inner join Orders O
     on Shippers.ShipperID = O.ShipVia
where Shippers.CompanyName = 'United Package' and year(ShippedDate) = 1997)


--2
select CompanyName, Phone
from Customers
where CustomerID in (select O.CustomerID
    from Orders O
        inner join [Order Details] [O D]
            on O.OrderID = [O D].OrderID
        inner join Products P
            on [O D].ProductID = P.ProductID
        inner join Categories C
            on P.CategoryID = C.CategoryID
    where CategoryName = 'Confections')


--3
select CompanyName, Phone
from Customers
where CustomerID not in (select O.CustomerID
    from Orders O
        inner join [Order Details] [O D]
            on O.OrderID = [O D].OrderID
        inner join Products P
            on [O D].ProductID = P.ProductID
        inner join Categories C
            on P.CategoryID = C.CategoryID
    where CategoryName = 'Confections')