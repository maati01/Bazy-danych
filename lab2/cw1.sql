--1
select OrderID, sum(UnitPrice*(1 - Discount)*Quantity) as TotalPrice
from [Order Details]
group by OrderID
order by TotalPrice desc

--2
select TOP 10 OrderID, sum(UnitPrice*(1 - Discount)*Quantity) as TotalPrice
from [Order Details]
group by OrderID
order by TotalPrice desc