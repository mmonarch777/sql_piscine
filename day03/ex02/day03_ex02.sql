with t1 as (select id as menu_id from menu
    except
    select menu_id from person_order)
select pizza_name, price, p.name as pizzeria_nama
from menu join pizzeria p on p.id = menu.pizzeria_id
where menu.id in (select * from t1)
order by pizza_name, price;
