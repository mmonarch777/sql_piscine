set enable_seqscan = off;
create index if not exists idx_person_name on person(upper(name));

-- drop index if exists idx_person_name;

explain analyze
select * from person
where (upper(name)) is not null;