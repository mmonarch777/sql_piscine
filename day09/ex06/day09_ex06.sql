create or replace function fnc_person_visits_and_eats_on_date(
in pperson varchar default 'Dmitriy',
in prubles numeric default 500,
in pdate date default '2022-01-08'
)
    returns table (
        pizzeria_name varchar
                  ) as
$$
begin
return query
select piz.name
from pizzeria piz
         inner join person_visits pv on piz.id = pv.pizzeria_id
         inner join person p on p.id = pv.person_id
         inner join person_order po on p.id = po.person_id
         inner join menu m on m.id = po.menu_id
where m.price < prubles and p.name in (pperson) and pv.visit_date in (pdate) and po.order_date in (pdate);
end ;
$$
language plpgsql;
-- returns table (
--         pizzeria_name varchar
--                   ) as
-- $$
--     select piz.name
--     from pizzeria piz
--              inner join person_visits pv on piz.id = pv.pizzeria_id
--              inner join person p on p.id = pv.person_id
--              inner join person_order po on p.id = po.person_id
--              inner join menu m on m.id = po.menu_id
--         where m.price < prubles and p.name in (pperson) and pv.visit_date in (pdate) and po.order_date in (pdate);
-- $$
-- language sql;

select * from fnc_person_visits_and_eats_on_date(prubles := 800);
select * from fnc_person_visits_and_eats_on_date(pperson := 'Anna', prubles := 1300, pdate := '2022-01-01')


