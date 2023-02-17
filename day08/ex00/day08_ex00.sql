-- Сессия_1
-- ------------Начало транзакции(begin)---------------------
begin ;
update pizzeria set rating=5 where name='Pizza Hut';
-- Проверяем изменения внутри транзакции
select * from pizzeria where name='Pizza Hut';
commit;
-- ------------Конец транзакции(commit)---------------------


-- Сессия_2
-- Получаем данные из таблици после update, но до commit в сесси_1
select * from pizzeria where name='Pizza Hut';
-- Получаем данные из таблици после commit в сесси_1
select * from pizzeria where name='Pizza Hut';