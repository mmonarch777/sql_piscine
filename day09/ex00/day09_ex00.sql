drop table if exists person_audit;

create table if not exists person_audit (
    created     timestamp with time zone not null default now(),
    type_event  char(1) not null default 'I',
    row_id      bigint not null,
    name        varchar,
    age         integer,
    gender      varchar,
    address     varchar

    constraint ch_type_event check (type_event in ('I', 'U', 'D'))
);

create or replace function fnc_trg_person_insert_audit()
returns trigger
as
$$
    begin
        insert into person_audit(row_id, name, age, gender, address)
        values (new.id, new.name, new.age, new.gender, new.address);
        return new;
    end;
$$
language plpgsql;

create trigger trg_person_insert_audit
    after insert
    on person
    for each row
    execute procedure fnc_trg_person_insert_audit();

insert into person(id, name, age, gender, address)
values (10, 'Damir', 22, 'male', 'Irkutsk');
select * from person_audit;