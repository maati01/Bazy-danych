use Northwind

--1
select distinct Quantity, ProductID,
                (select ProductName
                from Products P
                where OD1.ProductID = P.ProductID) as ProductName
from [Order Details] OD1
where Quantity =
      (select max(Quantity)
      from [Order Details] OD2
      where OD1.ProductID = OD2.ProductID)
order by Quantity, ProductID

--2
select distinct ProductID, UnitPrice
from Products
where UnitPrice < (select avg(UnitPrice) from Products)

--3
select distinct ProductID, UnitPrice
from Products P1
where UnitPrice < (select avg(UnitPrice)
                    from Products P2
                    where P2.CategoryID
                              in (select C.CategoryID
                              from Categories C
                              where P1.CategoryID = C.CategoryID))
