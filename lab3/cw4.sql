use Northwind

--1 a
select distinct E.FirstName, E.LastName, sum((1 - Discount)*UnitPrice*Quantity) as OrderValue
from Employees E
    inner join Orders O
        on O.EmployeeID = E.EmployeeID
    inner join [Order Details] OD
        on OD.OrderID = O.OrderID
    left join Employees E2
        on E.EmployeeID = E2.ReportsTo
where E2.ReportsTo is not null
group by  E.EmployeeID, E.FirstName, E.LastName, E2.EmployeeID

--1b
select E.FirstName, E.LastName, sum((1 - Discount)*UnitPrice*Quantity) as OrderValue
from Employees E
    inner join Orders O
        on O.EmployeeID = E.EmployeeID
    inner join [Order Details] OD
        on OD.OrderID = O.OrderID
    left join Employees E2
        on E.EmployeeID = E2.ReportsTo
where E2.ReportsTo is null
group by  E.FirstName, E.LastName