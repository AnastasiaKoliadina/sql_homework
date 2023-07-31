/*Домашняя работа №1*/
/*Задание 1 Создайте таблицу с мобильными телефонами, используя графический
интерфейс. Заполните БД данными. Добавьте скриншот на платформу в качестве
ответа на ДЗ */


USE homework_1;
SELECT * FROM homework_1.mobile_phones;

/*Задание №2. Выведите название, производителя и цену для товаров,
количество которых превышает 2 (SQL - файл, скриншот, либо сам код)*/

SELECT ProductName, Manufacturer, Price FROM mobile_phones WHERE ProductCount > 2;


/*3. Выведите весь ассортимент товаров марки “Samsung”*/

SELECT ProductName FROM mobile_phones WHERE Manufacturer = 'Samsung';


/* Задание №4.*** С помощью регулярных выражений найти:
4.1. Товары, в которых есть упоминание "Iphone" */

SELECT ProductName FROM mobile_phones WHERE ProductName RLIKE 'Iphone';


/*4.2 С помощью регулярных выражений найти товары "Samsung" */

SELECT ProductName FROM mobile_phones WHERE Manufacturer RLIKE 'Samsung';


/*4.3.С помощью регулярных выражений найти товары, в которых есть ЦИФРЫ*/

SELECT ProductName FROM mobile_phones WHERE ProductName RLIKE '[0-9]';


/*4.4.С помощью регулярных выражений найти товары, в которых есть ЦИФРА "8"*/

SELECT ProductName FROM mobile_phones WHERE ProductName RLIKE '[8]';