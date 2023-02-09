with visit as (select piz.name from person p
                        join person_visits pv on p.id = pv.person_id
                        join pizzeria piz on pv.pizzeria_id = piz.id
                        where p.name = 'Andrey'),
    ord as (select p2.name from person
                       join person_order po on person.id = po.person_id
                       join menu m on m.id = po.menu_id
                       join pizzeria p2 on p2.id = m.pizzeria_id
                       where person.name = 'Andrey')

select visit.name as pizzeria_name
from visit left join ord on visit.name = ord.name
where ord.name is null
order by 1;
