use Northwind

--1
select CategoryName, sum(Quantity) as Quantity
from Categories
    inner join Products P
        on Categories.CategoryID = P.CategoryID
    inner join  [Order Details] OD
        on P.ProductID = OD.ProductID
group by CategoryName

--2
select CategoryName, sum((1 - Discount)*OD.UnitPrice*OD.Quantity) as OrderValue
from Categories
    inner join Products P
        on Categories.CategoryID = P.CategoryID
    inner join  [Order Details] OD
        on P.ProductID = OD.ProductID
group by CategoryName

--3 a
select CategoryName, sum((1 - Discount)*OD.UnitPrice*OD.Quantity) as OrderValue
from Categories
    inner join Products P
        on Categories.CategoryID = P.CategoryID
    inner join  [Order Details] OD
        on P.ProductID = OD.ProductID
group by CategoryName
order by OrderValue

--3 b
select CategoryName, sum((1 - Discount)*OD.UnitPrice*OD.Quantity) as OrderValue
from Categories
    inner join Products P
        on Categories.CategoryID = P.CategoryID
    inner join  [Order Details] OD
        on P.ProductID = OD.ProductID
group by CategoryName
order by sum(Quantity)

--4
select O.OrderID, sum((1 - Discount)*OD.UnitPrice*OD.Quantity + Freight) as OrderValue
from Orders O
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
group by O.OrderID
