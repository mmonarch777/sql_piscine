with table1 as (select name, pizza_name from person
    join person_order po on person.id = po.person_id
    join menu m on m.id = po.menu_id where gender = 'female')
select name from table1 where pizza_name = 'pepperoni pizza'
intersect
select name from table1 where pizza_name = 'cheese pizza';