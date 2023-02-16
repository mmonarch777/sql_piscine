select
    person_id, count(pizzeria_id) as count_of_visits
from
    person_visits
group by
    person_id
order by
    count_of_visits desc, person_id;