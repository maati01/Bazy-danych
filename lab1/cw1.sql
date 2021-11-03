use library

/*1 */
select title_no, title from title

/*2 */
select title from title where title_no = 10

/*3 */
select distinct member_no, fine_assessed from loanhist where fine_assessed between 8 and 9

/*4 */
select isbn,author from item,title where author = 'Charles Dickens' or author = 'Jane Austen'

/*5 */
select title_no, title from  title where title like ('%adventures%')

/*6 */
select distinct member_no, fine_assessed, coalesce(fine_paid, 0)
from loanhist
where fine_assessed - coalesce(fine_paid, 0) - coalesce(fine_waived, 0) != 0

/*7 */
select distinct city, state from adult