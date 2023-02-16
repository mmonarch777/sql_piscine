select
    distinct name
from
    person
where
        id in (select person_id from person_order)
order by name