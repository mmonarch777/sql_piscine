select name, rating from
(pizzeria piz left join person_visits p_v on piz.id = p_v.pizzeria_id)
where p_v.pizzeria_id is null;