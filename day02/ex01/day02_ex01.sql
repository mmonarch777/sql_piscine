-- select table1.visit_date as missing_date from
-- (select visit_date from person_visits) as table1
-- left join
-- (select visit_date from person_visits where (person_id = 1 or person_id = 2)) as table2
-- on table1.visit_date = table2.visit_date
-- where table2.visit_date is null
-- group by missing_date
-- order by missing_date;

select gs::date as missing_date from
generate_series('2022-01-01', '2022-01-10', interval '1 day') as gs
left join
(select visit_date from person_visits where (person_id = 1 or person_id = 2)) as t1
on gs = t1.visit_date
where t1.visit_date is null
order by missing_date;
