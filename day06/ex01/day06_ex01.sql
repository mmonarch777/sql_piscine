with amount_rders as (
    select
        po.person_id, m.pizzeria_id, count(*) as count
    from person_order po
    join menu m
    on po.menu_id = m.id
    group by po.person_id, m.pizzeria_id
)

insert into person_discounts
select
    row_number() over (),
    person_id,
    pizzeria_id,
    case
        when count = 1 then 10.5
        when count = 2 then 22
        else 30 end
from
    amount_rders;

