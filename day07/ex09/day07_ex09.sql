with info as (select
                  address,
                  round(max(age) - cast(min(age) as dec(6,2)) / max(age), 2) as formula,
                  round(avg(age), 2 ) as average
              from person
              group by 1
              order by 1)
select
    *,
    (formula > average) as comparison
from info

