-- select pizza_name, name as pizzeria_name, price
-- from menu join pizzeria on pizzeria_id = pizzeria.id
-- where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'
-- order by pizza_name, pizzeria_name;

with t1 as (select * from menu where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'),
     t2 as (select name as pizzeria_name, id from pizzeria)

select pizza_name, pizzeria_name, price
from t1 join t2 on t1.pizzeria_id = t2.id
order by pizza_name, pizzeria_name;
