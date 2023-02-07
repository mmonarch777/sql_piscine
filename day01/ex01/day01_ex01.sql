select name as object_name from person
union all
select pizza_name from menu
order by object_name;