select
    p.name,
    count(*) as count_of_orders,
    round(avg(price), 2) as average_price,
    max(price) as max_price,
    min(price) as min_price
from
    person_order po join menu m on m.id = po.menu_id
    join pizzeria p on p.id = m.pizzeria_id
group by p.name
order by p.name
