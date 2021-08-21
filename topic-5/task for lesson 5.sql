-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”
-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

USE shop;

UPDATE users 
SET
created_at = NOW(),
updated_at = NOW()
WHERE created_at is NULL or updated_at is NULL;

-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
-- и в них долгое время помещались значения в формате "20.10.2017 8:10". 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
  ('Геннадий', '1990-10-05', '20.10.2017 8:10', '23.10.2017 18:10');

UPDATE 
users 
SET
created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');

select * from users;

ALTER TABLE users
CHANGE 
created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE users
CHANGE
updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP;

DESCRIBE users;

-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
-- 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
-- чтобы они выводились в порядке увеличения значения value. 
-- Однако, нулевые запасы должны выводиться в конце, после всех записей.
INSERT INTO storehouses_products (storehouse_id,product_id,`value`) values 
(1,1,6),
(2,2,0),
(3,3,10),
(1,3,0);

SELECT *
FROM storehouses_products
ORDER BY IF (value > 0, 0, 1), value;

-- Практическое задание теме “Агрегация данных”
-- Подсчитайте средний возраст пользователей в таблице users

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS 'avg' FROM users;

-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT 
DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
COUNT(*) as col
FROM users
GROUP BY
day;

