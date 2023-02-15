select
    name, pizza_name, price,
    round(price * (1 - discount/100)) as discount_price
from person p
join person_order po on p.id = po.person_id
join menu m on m.id = po.menu_id
join person_discounts pd on p.id = pd.person_id
order by name, pizza_name;
