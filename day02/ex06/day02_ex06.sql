with t1 as (select id from person where name = 'Denis' or name = 'Anna'),
     t2 as (select id, name as pizzeria_name from pizzeria)

select pizza_name, pizzeria_name
from t1 join person_order on t1.id = person_order.person_id
join menu m on person_order.menu_id = m.id
join t2 on t2.id = m.pizzeria_id
order by pizza_name, pizzeria_name;
