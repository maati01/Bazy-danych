--1
select EmployeeID, count(OrderID) as TotalOrders, year(OrderDate) as Year, month(OrderDate) as Month
from Orders
group by OrderDate, EmployeeID

--2
select CategoryID, max(UnitPrice) as MaxPrice, min(UnitPrice) as MinPrice
from Products
group by CategoryID