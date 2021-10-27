--1
select ProductID, sum(Quantity) as TotalQuantity
from [Order Details]
where ProductID < 3
group by  ProductID

--2
select ProductID, sum(Quantity) as TotalQuantity
from [Order Details]
group by  ProductID

--3
select OrderID, sum(UnitPrice*(1 - Discount)*Quantity) as TotalPrice
from [Order Details]
group by OrderID
having sum(Quantity) > 250