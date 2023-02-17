-- Сессия_1
-- ------------Начало транзакции(begin)---------------------
begin transaction isolation level read committed ;/*1 -Устанавливаем уровень изоляции транзакции-*/
select * from pizzeria where name='Pizza Hut';/*3 -Получаем данные с таблицы-*/
select * from pizzeria where name='Pizza Hut';/*6 -Получаем данные с таблицы-*/
commit;/*7*/
-- ------------Конец транзакции(commit)---------------------
select * from pizzeria where name='Pizza Hut';/*8 -Получаем данные с таблицы-*/




-- Сессия_2
-- ------------Начало транзакции(begin)---------------------
begin transaction isolation level read committed ;/*2 -Устанавливаем уровень изоляции транзакции-*/
update pizzeria set rating=3.6 where name='Pizza Hut';/*4 -Меняем данные в таблице-*/
commit;/*5*/
-- ------------Конец транзакции(commit)---------------------
select * from pizzeria where name='Pizza Hut';/*9 -Получаем данные с таблицы-*/