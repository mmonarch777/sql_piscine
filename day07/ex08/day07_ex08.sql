select
    p.address, p2.name, count(*) count_of_orders
from
    person p join person_order po on p.id = po.person_id
    join menu m on m.id = po.menu_id
    join pizzeria p2 on p2.id = m.pizzeria_id
group by 1,2
order by 1,2