/* Задача 1
Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)
*/

-- Использовал сервис Dummy Data for MYSQL Database + вручную корректировал данные с помощью UPDATE

/* Задача 2
Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
*/

SELECT DISTINCT firstname
FROM users
ORDER BY firstname 
;

/* Задача 3
Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false).
 Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
*/

ALTER TABLE profiles 
ADD COLUMN is_active ENUM ('true', 'false') DEFAULT 'true'

UPDATE profiles 
SET is_active = 'false'
WHERE (birthday + INTERVAL 18 YEAR) > NOW();

/* Задача 
Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
*/

DELETE FROM messages 
WHERE created_at > NOW()
;
