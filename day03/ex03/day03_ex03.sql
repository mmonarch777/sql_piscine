with al as (select p.gender, piz.name as pizzeria_name
            from person_visits pv join person p on pv.person_id = p.id
            join pizzeria piz on piz.id = pv.pizzeria_id),
      mans as (select pizzeria_name from al where gender = 'male'),
      womans as (select pizzeria_name from al where gender = 'female')
select pizzeria_name
from ((select * from mans except all select * from womans)
        union all
     (select * from womans except all select * from mans)) as t1
order by 1
