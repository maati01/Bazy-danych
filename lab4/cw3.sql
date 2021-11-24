use Northwind

--1
select ProductName, UnitPrice,
       (select avg(UnitPrice) from Products) as Average,
       ((select avg(UnitPrice) from Products) - UnitPrice) as Diff
from Products

--2
select (select CategoryName from Categories C where C.CategoryID = P1.CategoryID) as CategoryName,
       P1.ProductName, P1.UnitPrice,
       (select avg(UnitPrice) from Products P2 where P2.CategoryID
                              in (select C.CategoryID
                              from Categories C
                              where P1.CategoryID = C.CategoryID)) as CategoryAvg,
       (P1.UnitPrice - (select avg(UnitPrice) from Products P2 where P2.CategoryID
                              in (select C.CategoryID
                              from Categories C
                              where P1.CategoryID = C.CategoryID))) as DiffFromCategory
from Products P1
order by CategoryName
