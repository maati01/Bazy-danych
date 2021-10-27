--1
select EmployeeID, count(OrderID) as TotalOrders
from Orders
group by EmployeeID

--2
select ShipVia, sum(Freight) as TotalFreight
from Orders
group by ShipVia

--3
select ShipVia, sum(Freight) as TotalFreight
from Orders
where year(ShippedDate) BETWEEN 1996 and 1997
group by ShipVia
