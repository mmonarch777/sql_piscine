create or replace view v_price_with_discount as

with t1 as (select p.name, m.pizza_name, m.price, (m.price - m.price * 0.1) as discount_price
            from person_order po join person p on po.person_id = p.id
                                 join menu m on po.menu_id = m.id)
select * from t1
order by name, pizza_name;

