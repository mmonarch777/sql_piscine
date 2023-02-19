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

--
-- WITH RECURSIVE travel  AS (
--     SELECT d.point_1, d.point_2, 1 AS n, cost AS sum_cost, CONCAT('{',point_1::varchar) AS path FROM nodes d WHERE point_1 = 'a'
--     UNION
--     SELECT d2.point_1, d2.point_2, travel.n + 1, travel.sum_cost + d2.cost, CONCAT(travel.path, ',', d2.point_1) FROM nodes d2
--                                                                                                                        JOIN travel ON travel.point_2 = d2.point_1
--     WHERE travel.n < (SELECT COUNT(DISTINCT nodes.point_1) FROM nodes)
-- ), travel_needed AS (
--     SELECT sum_cost, path FROM travel WHERE n = (SELECT COUNT(DISTINCT nodes.point_1) FROM nodes) AND travel.point_2 = 'a'
--                                         AND path LIKE '%a%' AND path LIKE '%b%' AND path LIKE '%c%' AND path LIKE '%d%'
-- )
-- SELECT sum_cost AS total_cost, CONCAT(path, ',a}') AS tour FROM travel_needed WHERE sum_cost = (SELECT MIN(sum_cost) FROM travel_needed);
--

