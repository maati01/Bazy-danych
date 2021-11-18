use Northwind

--1
select sum(Quantity) as sum, CompanyName
from Orders
    inner join Customers C
        on Orders.CustomerID = C.CustomerID
    inner join [Order Details] O
        on Orders.OrderID = O.OrderID
group by Orders.OrderID, C.CustomerID, CompanyName

--2
select sum(Quantity) as sum, CompanyName
from Orders
    inner join Customers C
        on Orders.CustomerID = C.CustomerID
    inner join [Order Details] O
        on Orders.OrderID = O.OrderID
group by Orders.OrderID,C.CustomerID, CompanyName
having sum(Quantity) > 250

--3
select O.OrderID,sum((1 - Discount)*Quantity*UnitPrice) as price, CompanyName
from [Order Details] OD
    inner join Orders O
        on OD.OrderID = O.OrderID
    inner join Customers C
        on O.CustomerID = C.CustomerID
group by O.OrderID,O.CustomerID, CompanyName

--4
select O.OrderID,sum((1 - Discount)*Quantity*UnitPrice) as price, CompanyName
from [Order Details] OD
    inner join Orders O
        on OD.OrderID = O.OrderID
    inner join Customers C
        on O.CustomerID = C.CustomerID
group by O.OrderID,O.CustomerID, CompanyName
having sum(Quantity) > 250

--5
select O.OrderID,sum((1 - Discount)*Quantity*UnitPrice) as price, CompanyName,
       Firstname, Lastname
from [Order Details] OD
    inner join Orders O
        on OD.OrderID = O.OrderID
    inner join Customers C
        on O.CustomerID = C.CustomerID
    inner join Employees E
        on O.EmployeeID = E.EmployeeID
group by O.OrderID,O.CustomerID, CompanyName, Firstname, Lastname
having sum(Quantity) > 250