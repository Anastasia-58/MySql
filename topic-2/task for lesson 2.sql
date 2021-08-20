Create database IF NOT EXISTS example;

use example;

Create table IF NOT EXISTS users (
 id serial primary key,
 name varchar(255) comment 'Имя'
);

show tables;

/* Дамп выполнялся в командной строке
mysqldump example > test.sql;
mysql sample < test.sql;
*/
