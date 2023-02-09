with al as (select p.gender, piz.name as pizzeria_name
            from person_order po join person p on po.person_id = p.id
            join menu m on po.menu_id = m.id
            join pizzeria piz on m.pizzeria_id = piz.id),
    mans as (select pizzeria_name from al where gender = 'male'),
    womans as (select pizzeria_name from al where gender = 'female')

select pizzeria_name
from ((select * from mans except select * from womans)
      union
      (select * from womans except select * from mans)) as t1
order by 1