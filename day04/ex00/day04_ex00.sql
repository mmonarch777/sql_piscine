create or replace view v_persons_female as
select * from person
where gender = 'female';

create or replace view v_persons_male as
select * from person
where gender = 'male';

