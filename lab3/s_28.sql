use library

--1
select firstname + ' ' + lastname as name,
       (street + ' ' + city + ' ' + state + ' ' + zip) as address
from member
    inner join adult a on
        member.member_no = a.member_no

--2
select l.isbn, l.copy_no, on_loan, title, translation, cover
from loan l
    inner join copy c
        on c.isbn = l.isbn and c.copy_no = l.copy_no
    inner join item i
        on i.title_no = l.title_no
    inner join title t
        on t.title_no = l.title_no
where l.isbn in (1,500,1000)
order by isbn

--3
select m.member_no, firstname, lastname, isbn, log_date
from member m
    inner join reservation r
        on m.member_no = r.member_no
where m.member_no in (250,342,1675)
