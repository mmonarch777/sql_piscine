select p.name as person_name, menu.pizza_name, piz.name as pizzeria_name
from
(person p join person_order p_o on p.id = p_o.person_id
    join menu on menu.id = p_o.menu_id
    join pizzeria piz on piz.id = menu.pizzeria_id)
order by person_name, pizza_name, pizzeria_name;
