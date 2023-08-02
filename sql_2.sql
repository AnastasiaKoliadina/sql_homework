CREATE DATABASE IF NOT EXISTS homework_2;
USE homework_2;

/*
Задание № 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
*/

# Создаем таблицу "sales"

CREATE TABLE IF NOT EXISTS sales (
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT UNSIGNED);

SELECT * FROM sales;

# Заполняем таблицу значениями

INSERT INTO sales (order_date, count_product)
VALUES
      ('2022-01-01', 156),
      ('2022-01-02', 180),
      ('2022-01-03', 21),
      ('2022-01-04', 124),
      ('2022-01-05', 341);

SELECT * FROM sales;


/*
Задание № 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
*/

SELECT id, order_date, count_product,
CASE
  WHEN count_product < 100 THEN 'Маленький заказ'
  WHEN count_product >= 100 AND count_product <= 300 THEN 'Средний заказ'
  ELSE 'Большой заказ'
END AS order_type
FROM sales;


/*
Задание № 3. Создайте таблицу “orders”, заполните ее значениями.
Покажите “полный” статус заказа, используя оператор CASE
*/

# Создаем таблицу “orders

CREATE TABLE IF NOT EXISTS orders (
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
employee_id VARCHAR(20) NOT NULL,
amount FLOAT(5,2) NOT NULL,
order_status VARCHAR(20) NOT NULL);

SELECT * FROM orders;

# Заполняем таблицу данными

INSERT INTO orders (employee_id, amount,order_status)
VALUES ('e03', 15.00, 'OPEN'),
	   ('e01', 25.50, 'OPEN'),
       ('e05', 100.70, 'CLOSED'),
       ('e02', 22.18, 'OPEN'),
       ('e04', 9.50, 'CANCELLED');
       
SELECT * FROM orders;

# Покажите “полный” статус заказа, используя оператор CASE

SELECT id, employee_id, amount, order_status,
CASE
   WHEN order_status = 'OPEN' THEN 'Order is in open state'
   WHEN order_status = 'CLOSED' THEN 'Order is closed'
   ELSE 'CANCELLED'
   END AS full_order_status
 FROM orders;  
 
 
 # Чем NULL отличается от 0?
 /*
 Ноль - это числовое значение. Это определенное значение с точными математическими свойствами.
NULL означает отсутствие какого-либо значения. Вы ничего не можете с ним сделать.
 */