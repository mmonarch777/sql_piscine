with action_order as (select name, count(menu_id) as count, 'order' as action_type
               from person_order po
                        join menu m on m.id = po.menu_id
                        join pizzeria p on p.id = m.pizzeria_id
               group by
                   name
               limit 3),
    action_visit as (select name, count(person_id) as count, 'visit' as action_type
                     from person_visits pv join pizzeria p2 on p2.id = pv.pizzeria_id
                     group by name
                     limit 3)

select * from action_order
union all
select * from action_visit
order by action_type, count desc ;