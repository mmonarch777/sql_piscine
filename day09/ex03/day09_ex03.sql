drop trigger if exists trg_person_delete_audit on person;
drop trigger if exists trg_person_update_audit on person;
drop trigger if exists trg_person_insert_audit on person;
drop function if exists fnc_trg_person_delete_audit();
drop function if exists fnc_trg_person_update_audit();
drop function if exists fnc_trg_person_insert_audit();

truncate table person_audit;

create or replace function fnc_trg_person_audit()
returns trigger as
$$
    begin
        if (tg_op = 'INSERT') then
            insert into person_audit(row_id, name, age, gender, address)
            values (new.id, new.name, new.age, new.gender, new.address);
        elsif (tg_op = 'UPDATE') then
            insert into person_audit(type_event, row_id, name, age, gender, address)
            values ('U', old.id, old.name, old.age, old.gender, old.address);
        elsif (tg_op = 'DELETE') then
            insert into person_audit(type_event, row_id, name, age, gender, address)
            values ('D', old.id, old.name, old.age, old.gender, old.address);
        end if;
        return null;
    end;
$$
language plpgsql;

create trigger trg_person_audit
    after insert or update or delete
    on person
    for each row
    execute procedure fnc_trg_person_audit();

insert into person values (10, 'Damir', 22, 'male', 'Irkutsk');
update person set name='Bulat' where id = 10;
update person set name='Damir' where id = 10;
delete from person where id = 10;

-- drop trigger if exists trg_person_audit on person;
-- drop function if exists fnc_trg_person_audit();


