use library

--1
select firstname, lastname,
       birth_date, city + ' ' + street as Address
from member
    inner join juvenile j
        on member.member_no = j.member_no
    inner join  adult a
        on j.adult_member_no = a.member_no

--2
select m_j.firstname, m_j.lastname,j.birth_date,
       'Adult' + m_a.firstname + ' ' + m_a.lastname as adult_,
        a.city + ' ' + a.street as Address
from juvenile j
    inner join adult a
        on j.adult_member_no = a.member_no
    inner join member m_j
        on j.member_no = m_j.member_no
    inner join member m_a
        on a.member_no = m_a.member_no