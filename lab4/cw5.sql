use Northwind

--1
select E.FirstName, E.LastName, round(sum(OrderValue),2) as Value
from (
    select EmployeeID,
           (select sum((1 - Discount)*Quantity*UnitPrice)
    from [Order Details] O2 where O2.OrderID = O.OrderID) + O.Freight as OrderValue
    from Orders O) as AllOrders
inner join Employees E on E.EmployeeID = AllOrders.EmployeeID
group by AllOrders.EmployeeID,E.FirstName, E.LastName
order by 3 desc

--2
select top 1 E.FirstName, E.LastName, round(sum(OrderValue),2) as Value
from (
    select EmployeeID,
           (select sum((1 - Discount)*Quantity*UnitPrice)
    from [Order Details] O2 where O2.OrderID = O.OrderID) + O.Freight as OrderValue
    from Orders O
    where year(OrderDate) = 1997) as AllOrders
inner join Employees E on E.EmployeeID = AllOrders.EmployeeID
group by AllOrders.EmployeeID,E.FirstName, E.LastName
order by 3 desc

--3
--a
select distinct E.FirstName, E.LastName, round(sum(OrderValue),2) as Value
from (
    select EmployeeID,
           (select sum((1 - Discount)*Quantity*UnitPrice)
    from [Order Details] O2 where O2.OrderID = O.OrderID) + O.Freight as OrderValue
    from Orders O) as AllOrders
inner join Employees E on E.EmployeeID = AllOrders.EmployeeID
inner join Employees E2 on E.EmployeeID = E2.ReportsTo
where E2.ReportsTo is not null
group by  E2.EmployeeID,AllOrders.EmployeeID,E.FirstName, E.LastName
order by 3 desc

--b
select E.FirstName, E.LastName, round(sum(OrderValue),2) as Value
from (
    select EmployeeID,
           (select sum((1 - Discount)*Quantity*UnitPrice)
    from [Order Details] O2 where O2.OrderID = O.OrderID) + O.Freight as OrderValue
    from Orders O) as AllOrders
inner join Employees E on E.EmployeeID = AllOrders.EmployeeID
where E.EmployeeID not in (
    select ReportsTo
    from Employees
    where ReportsTo is not null
)
group by AllOrders.EmployeeID,E.FirstName, E.LastName
order by 3 desc

--4
--a
select distinct E.FirstName, E.LastName, round(sum(OrderValue),2) as Value,
                (select top 1 OrderDate from Orders O3 where O3.EmployeeID = E.EmployeeID order by 1 desc) as Date
from (
    select EmployeeID,
           (select sum((1 - Discount)*Quantity*UnitPrice)
    from [Order Details] O2 where O2.OrderID = O.OrderID) + O.Freight as OrderValue
    from Orders O) as AllOrders
inner join Employees E on E.EmployeeID = AllOrders.EmployeeID
inner join Employees E2 on E.EmployeeID = E2.ReportsTo
where E2.ReportsTo is not null
group by AllOrders.EmployeeID,E.EmployeeID, E.FirstName, E.LastName, E2.EmployeeID
order by 3 desc

--b
select E.FirstName, E.LastName, round(sum(OrderValue),2) as Value,
        (select top 1 OrderDate from Orders O3 where O3.EmployeeID = E.EmployeeID order by 1 desc) as Date
from (
    select EmployeeID,
           (select sum((1 - Discount)*Quantity*UnitPrice)
    from [Order Details] O2 where O2.OrderID = O.OrderID) + O.Freight as OrderValue
    from Orders O) as AllOrders
inner join Employees E on E.EmployeeID = AllOrders.EmployeeID
where E.EmployeeID not in (
    select ReportsTo
    from Employees
    where ReportsTo is not null
)
group by AllOrders.EmployeeID,E.EmployeeID, E.FirstName, E.LastName
order by 3 desc
