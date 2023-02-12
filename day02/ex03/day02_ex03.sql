

with t1 as (select gs::date as missing_date from generate_series('2022-01-01', '2022-01-10', interval '1 day') as gs),
     t2 as (select visit_date from person_visits where (person_id = 1 or person_id = 2))
select missing_date from t1 left join t2 on t1.missing_date = t2.visit_date
where t2.visit_date is null
order by missing_date;