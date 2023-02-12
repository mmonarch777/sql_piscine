create or replace view v_symmetric_union as

with R as (select * from person_visits where visit_date = '2022-01-02'),
     S as (select * from person_visits where visit_date = '2022-01-06')

select person_id from(select * from R except  select * from S) as t1
union
select person_id from (select * from S except select * from R) as t2
order by person_id;
