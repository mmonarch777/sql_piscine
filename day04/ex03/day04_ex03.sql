select t1.generate_date as missing_date from
(select  * from v_generated_dates
    except
select visit_date from person_visits) as t1
order by missing_date;