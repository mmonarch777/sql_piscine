set enable_indexscan = on;
set enable_seqscan = off;

explain analyze
select
    pizza_name, name
from
    menu m join pizzeria p on m.pizzeria_id = p.id;