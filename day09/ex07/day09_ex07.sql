create or replace function fnc_minimum(variadic mass numeric[])
returns numeric as
$$
    begin
        return (select min(mass[i]) from generate_subscripts(mass, 1) g(i));
    end;
$$
language plpgsql;

select fnc_minimum(variadic mass => array[10.0, -1.0, 5.0, 4,4]);
