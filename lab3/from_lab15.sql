use library

--1
select firstname, lastname, birth_date
from member inner join juvenile j
    on member.member_no = j.member_no

--2
select distinct title
from title inner join loan l
    on title.title_no = l.title_no

--3
select title, in_date, datediff(day, in_date, due_date) as datediff, fine_paid
from loanhist join title t
    on loanhist.title_no = t.title_no
where title = 'Tao Teh King' and fine_paid is not NULL

--4
select firstname + ' ' + middleinitial + '. ' + lastname as name, isbn
from reservation inner join member m
    on reservation.member_no = m.member_no
where firstname + ' ' + middleinitial + '. ' + lastname = 'Stephen A. Graff'
