drop table if exists nodes cascade;

create table nodes (
    point_1 varchar not null ,
    point_2 varchar not null ,
    cost int check (cost >= 0)
);

insert into nodes
values ('a', 'b', 10),
       ('a', 'd', 20),
       ('a', 'c', 15),
       ('b', 'a', 10),
       ('b', 'c', 35),
       ('b', 'd', 25),
       ('c', 'a', 15),
       ('c', 'b', 35),
       ('c', 'd', 30),
       ('d', 'a', 20),
       ('d', 'b', 25),
       ('d', 'c', 30);

create or replace view count_city as
select count(distinct point_1) as count from nodes;

with recursive way as (
    select point_1, point_2, cost as total_cost, 1 as step, (point_1 || ',' || point_2) as tour
    from nodes where point_1 = 'a'
    union
    select n.point_1, n.point_2, n.cost + total_cost, step + 1,  (tour || ',' || n.point_2)
    from nodes n join way
        on (way.point_2 = n.point_1 and way.point_1 != n.point_2)
    where (step < (select * from count_city))),

    min_way as (select total_cost, '{' || tour || '}' as tour from way
        where (tour ~ '[a-z]*a$' and step = (select * from count_city))
        order by total_cost, tour)

select * from min_way
where total_cost <=(select min(total_cost) from min_way);


