-- Сессия_1
-- ------------Начало транзакции(begin)---------------------
begin ;/*1*/
select * from pizzeria where name='Pizza Hut';/*3 -Получаем данные с таблицы-*/
update pizzeria set rating=4 where name='Pizza Hut';/*5 -Меняем данные в таблице-*/
commit;/*7*/
-- ------------Конец транзакции(commit)---------------------
select * from pizzeria where name='Pizza Hut';/*9 -Получаем данные с таблицы-*/




-- Сессия_2
-- ------------Начало транзакции(begin)---------------------
begin ;/*2*/
select * from pizzeria where name='Pizza Hut';/*4 -Получаем данные с таблицы-*/
update pizzeria set rating=3.6 where name='Pizza Hut';/*6 -Меняем данные в таблице-*/
commit;/*8*/
-- ------------Конец транзакции(commit)---------------------
select * from pizzeria where name='Pizza Hut';/*10 -Получаем данные с таблицы-*/