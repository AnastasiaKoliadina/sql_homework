DROP DATABASE IF EXISTS homework_4;
CREATE DATABASE homework_4;
USE homework_4;

CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);
SELECT * FROM AUTO;

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

SELECT * FROM AUTO;

-- Задание № 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
    
SELECT 
	count(REGNUM),
    COLOR
FROM 
    AUTO
WHERE 
	MARK IN ("BMW", "LADA")
GROUP BY COLOR;
    
-- Задание № 2. Вывести на экран марку авто и количество AUTO не этой марки
    
SELECT
	mark AS automark,
	(
		SELECT
			COUNT(*)
		FROM
			auto
	) - COUNT(*) AS other_cnt
FROM
	auto
GROUP BY
	mark;
    
    
/*
Задание № 3. Даны 2 таблицы, созданные следующим образом:

create table test_a (id number, data varchar2(1));

create table test_b (id number);

Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
*/

CREATE TABLE IF NOT EXISTS test_a(id INT, DATA VARCHAR(45));
CREATE TABLE IF NOT EXISTS test_b  (id INT);
INSERT INTO test_a(id, DATA) VALUES
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');

SELECT * FROM  test_a;

INSERT INTO test_b(id) VALUES
(10),
(30),
(50);

SELECT *
FROM test_a
NATURAL LEFT JOIN
     test_b
WHERE 
     test_b.id IS NULL;
