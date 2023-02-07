select table1.order_date, concat(table2.name, ' (age:', table2.age, ')') as person_information from (
    (select person_id, order_date from person_order) as table1
    join
    (select id, name, age from person) as table2 on table1.person_id = table2.id)
order by order_date, person_information;

-- select order_date, name || ' (age:' || age || ')' as person_information
-- from person_order o join person p on o.person_id = p.id
-- order by order_date, person_information;
