-- Сессия_1
-- ------------Начало транзакции(begin)---------------------
begin transaction isolation level repeatable read ;/*1 -Устанавливаем уровень изоляции транзакции-*/
select sum(rating) from pizzeria;/*3 -Получаем данные с таблицы-*/
select sum(rating) from pizzeria;/*6 -Получаем данные с таблицы-*/
commit;/*7*/
-- ------------Конец транзакции(commit)---------------------
select sum(rating) from pizzeria;/*8 -Получаем данные с таблицы-*/




-- Сессия_2
-- ------------Начало транзакции(begin)---------------------
begin transaction isolation level repeatable read ;/*2 -Устанавливаем уровень изоляции транзакции-*/
update pizzeria set rating=5 where name='Pizza Hut';/*4 -Меняем данные в таблице-*/
commit;/*5*/
-- ------------Конец транзакции(commit)---------------------
select sum(rating) from pizzeria;/*9 -Получаем данные с таблицы-*/