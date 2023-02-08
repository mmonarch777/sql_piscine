with p as (select id, name from person where gender = 'male' and (address = 'Moscow' or address = 'Samara')),
     m as (select id, pizza_name from menu where pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza')

select p.name
from p join person_order po on p.id = po.person_id
join m on m.id = po.menu_id
order by p.name desc ;


