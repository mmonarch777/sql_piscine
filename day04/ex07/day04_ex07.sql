insert into person_visits
values ((select max(id) + 1 from person_visits),
        (select id from person where name = 'Dmitriy'),
        (select p.id from menu m join pizzeria p on m.pizzeria_id = p.id
         where m.price < 800 and p.name != 'Papa Johns'
         limit 1), '2022-01-08');

refresh materialized view mv_dmitry_visits_and_eats;

-- delete from person_visits where id = 20;
