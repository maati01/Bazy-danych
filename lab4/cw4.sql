use Northwind

--1
select O.OrderID, (select sum((1 - Discount)*Quantity*UnitPrice)
                from [Order Details] OD where O.OrderID = OD.OrderID) + O.Freight as Cost
from Orders O
where O.OrderID = 10250

--2
select O.OrderID, round((select sum((1 - Discount)*Quantity*UnitPrice)
                from [Order Details] OD where O.OrderID = OD.OrderID) + O.Freight,2) as Cost
from Orders O

--3
select Address
from Customers C
where not exists ((select OrderDate
                from Orders O
                where year(OrderDate) = 1997 and C.CustomerID = O.CustomerID))

--4
select ProductID, count(*) as Clients
from (select ProductID, CustomerID
    from Orders O
        inner join [Order Details]
            on [Order Details].OrderID = O.OrderID
    group by ProductID, CustomerID) as C
group by ProductID
having count(*) > 1
order by Clients
