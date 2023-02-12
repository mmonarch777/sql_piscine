with t1_id as (select count(distinct person_id) from person_order),
     t2_id_max as (select max(id) + (select * from t1_id) from person_order)

insert into person_order
(select generate_series((select max(id) + 1 from person_order),
       (select * from t2_id_max)),
       generate_series(1, (select * from t1_id)),
       menu.id, '2022-02-25' as order_date
from menu
where pizza_name = 'greek pizza');
