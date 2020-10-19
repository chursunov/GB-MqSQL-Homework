/*
Задание 1
Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf,
задав в нем логин и пароль, который указывался при установке.

Установил, создал файл, задал логин и пароль, все работает)
*/
/*
Задание 2
Создайте базу данных example, разместите в ней таблицу users,
состоящую из двух столбцов, числового id и строкового name.
*/
CREATE DATABASE example;
USE example;
CREATE TABLE users (id INT, name VARCHAR(255));
SHOW TABLE;
/*
Задание 3
Создайте дамп базы данных example из предыдущего задания,
разверните содержимое дампа в новую базу данных sample.
*/
/* 
создаем дамп базы
mysqldump example > /home/baryon/GB-MySQL-homework/example.sql
*/

-- создаем базу sample
CREATE DATABASE sample;

-- разворачиваем дамп
/*
mysql sample < example.sql
*/