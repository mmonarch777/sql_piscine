select coalesce(p.name, '-') as person_name, visit_date, coalesce(p2.name, '-') as pizzeria_name from
(select * from person_visits where (visit_date >= '2022-01-01' and visit_date <= '2022-01-03')) as p_v
full join person p on p_v.person_id = p.id
full join pizzeria p2 on p_v.pizzeria_id = p2.id
order by person_name, visit_date, pizzeria_name;