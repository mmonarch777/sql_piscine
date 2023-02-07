select table1.action_date, table2.name from (
    (select order_date as action_date, person_id from person_order
    intersect
    select visit_date, person_id from person_visits) as table1
    join
    (select name, id from person) as table2 on table1.person_id = table2.id)
order by action_date asc, name desc ;