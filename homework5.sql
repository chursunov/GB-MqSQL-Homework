/* Задача 1
Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
*/

UPDATE users
	SET 
		created_at = now(),
		updated_at = now()
;

/* Задача 2
Таблица users была неудачно спроектирована.
Записи created_at и updated_at были заданы типом VARCHAR и в
них долгое время помещались значения в формате "20.10.2017 8:10".
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
*/
-- создаем такую же таблицу, только с правильным форматом полей
DROP TABLE IF EXISTS users1;
CREATE TABLE users1 (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

-- выполняем запрос
INSERT INTO users1 (id, name, birthday_at, created_at, updated_at)
SELECT id, name, birthday_at, STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'), STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i')
FROM users
-- удаляем старую таблицу 
DROP TABLE users
-- переименовываем новую таблицу
ALTER TABLE users1 RENAME users

/* Задача 3
В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
0, если товар закончился и выше нуля, если на складе имеются запасы.
Необходимо отсортировать записи таким образом,
чтобы они выводились в порядке увеличения значения value.
Однако, нулевые запасы должны выводиться в конце, после всех записей.
*/

SELECT value FROM storehouses_products ORDER BY value > 0 DESC, value

/* Задача 4 
(по желанию) Из таблицы users необходимо извлечь пользователей,
родившихся в августе и мае.
Месяцы заданы в виде списка английских названий ('may', 'august')
 */
SELECT * FROM users WHERE MONTHNAME(birthday_at) IN ('may', 'august')

/* Задача 5 
(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса.
SELECT * FROM catalogs WHERE id IN (5, 1, 2);
Отсортируйте записи в порядке, заданном в списке IN.
 */

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY id > 2 DESC

/* Задача 6
Подсчитайте средний возраст пользователей в таблице users
 */

SELECT SUM(TIMESTAMPDIFF(YEAR, birthday_at, NOW()))/COUNT(*) AS average_age FROM users

/* Задача 7
Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/

SELECT 
	DAYNAME(DATE_ADD(birthday_at, INTERVAL TIMESTAMPDIFF(YEAR, birthday_at, NOW()) YEAR)) AS day_of_week,
	COUNT(*) 
FROM users
GROUP BY day_of_week

/* Задача 8
(по желанию) Подсчитайте произведение чисел в столбце таблицы
*/

SELECT exp(sum(log(value))) FROM tabl



