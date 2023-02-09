with tab as (select m.pizza_name, piz.name, m.price
             from menu m
             join pizzeria piz on m.pizzeria_id = piz.id)

select t1.pizza_name, t1.name as pizzeria_name_1, t2.name as pizzeria_name_2, t2.price
from tab as t1
join tab as t2
on t1.pizza_name = t2.pizza_name and t1.price = t2.price and t1.name < t2.name
order by pizza_name
