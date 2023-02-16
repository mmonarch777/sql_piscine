with action_visit as (select name, count(person_id)  as count_of_visits
                     from person_visits pv
                         join person p on p.id = pv.person_id
                     group by name having count(person_id) > 3)

select * from action_visit

