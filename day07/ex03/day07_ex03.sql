with action_order as (select name, count(menu_id) as count
                        from person_order po
                            join menu m on m.id = po.menu_id
                            join pizzeria p on p.id = m.pizzeria_id
                        group by
                            name),
    action_visit as (select name as name2, count(person_id) as count2
                        from person_visits pv join pizzeria p2 on p2.id = pv.pizzeria_id
                        group by name),
    action_all as (select
                       coalesce(count, 0) as c1, coalesce(count2, 0) as c2,
                       case when name IS NULL then name2 else name end as name
                   from
                       action_order ao full join action_visit av on ao.name = av.name2)

select name, (c1 + c2) as total_count from action_all
order by 2 desc, 1;