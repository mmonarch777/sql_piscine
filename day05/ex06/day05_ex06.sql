drop index if exists idx_1;
set enable_seqscan = off;

create unique index if not exists idx_1 on pizzeria(rating);

explain analyze
select *,
    pizza_name,
    max(rating) over (partition by rating order by rating
        rows between unbounded preceding and unbounded following) as k
from menu join pizzeria p on p.id = menu.pizzeria_id
order by 1,2;