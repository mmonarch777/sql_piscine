select
    (select name from person where id = t1.person_id) as person_name,
    (select name from pizzeria where id = t1.pizzeria_id) as pizzeria_name
from (select * from person_visits where visit_date between '2022-01-07' and '2022-01-09') as t1
order by person_name asc, pizzeria_name desc ;
