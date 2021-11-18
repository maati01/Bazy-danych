use Northwind

--1
select CompanyName, count(*) as SumOrders
from Orders O
    inner join Shippers S
        on O.ShipVia = S.ShipperID
where year(ShippedDate) = 1997
group by CompanyName

--2
select top 1 CompanyName
from Orders O
    inner join Shippers S
        on O.ShipVia = S.ShipperID
where year(ShippedDate) = 1997
group by CompanyName
order by count(*) desc

--3
select FirstName, LastName, sum((1 - Discount)*Quantity*UnitPrice) as Value
from Orders O
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
    inner join Employees E
        on O.EmployeeID = E.EmployeeID
group by E.EmployeeID,FirstName, LastName

--4
select top 1 FirstName, LastName
from Orders O
    inner join Employees E
        on O.EmployeeID = E.EmployeeID
where year(OrderDate) = 1997
group by E.EmployeeID,FirstName, LastName
order by count(OrderID) DESC

--5
select top 1 FirstName, LastName
from Orders O
    inner join Employees E
        on O.EmployeeID = E.EmployeeID
    inner join [Order Details] OD
        on O.OrderID = OD.OrderID
where year(OrderDate) = 1997
group by E.EmployeeID,FirstName, LastName
order by sum((1 - Discount)*Quantity*UnitPrice) DESC
