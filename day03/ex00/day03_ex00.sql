select m.pizza_name, m.price, p2.name as pizzeria_name, pv.visit_date
from person p join person_visits pv on p.id = pv.person_id
              join pizzeria p2 on pv.pizzeria_id = p2.id
              join menu m on p2.id = m.pizzeria_id
where p.name = 'Kate' and (m.price >= 800 and m.price <= 1000)
order by pizza_name, price, pizzeria_name;
