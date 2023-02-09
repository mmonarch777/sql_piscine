select table1.order_date, concat(table2.name, ' (age:', table2.age, ')') as person_information from (
   (select person_id, order_date from person_order) as table1
   natural join
   (select id as person_id, name, age from person) as table2)
order by order_date, person_information;

select * from
(select person_id, order_date from person_order) as table1
   natural join
   (select id as person_id, name, age from person) as table2