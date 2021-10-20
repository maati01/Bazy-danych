select title_no, title from title
select title from title where title_no = 10
select distinct member_no, fine_assessed from loanhist where fine_assessed between 8 and 9
select isbn,author from item,title where author = 'Charles Dickens' or author = 'Jane Austen'
select title_no, title from  title where title like ('%adventures%')
select distinct member_no, fine_assessed, coalesce(fine_paid, 0)
from loanhist
where fine_assessed - coalesce(fine_paid, 0) - coalesce(fine_waived, 0) != 0
select distinct city, state from adult