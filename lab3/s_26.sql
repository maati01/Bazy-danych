use Northwind

--1
select a.FirstName, a.LastName,a.EmployeeID, b.FirstName, b.LastName, b.EmployeeID
from Employees a
inner join Employees b on a.EmployeeID = b.ReportsTo
where b.ReportsTo is not NULL

--2
select a.FirstName, a.LastName
from Employees a
left join Employees b on a.EmployeeID = b.ReportsTo
where b.ReportsTo is NULL

use library
--3
select distinct (street + ' ' + city + ' ' + state + ' ' + zip) as address
from adult
inner join juvenile j on adult.member_no = j.adult_member_no
where birth_date < '1996-1-1'

--4
select distinct (street + ' ' + city + ' ' + state + ' ' + zip) as address
from adult
    inner join juvenile j
        on adult.member_no = j.adult_member_no
    left join loan l
        on adult.member_no = l.member_no
where birth_date < '1996-1-1' and  l.member_no is null