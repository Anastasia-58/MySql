USE vk;

INSERT INTO users (`firstname`,`lastname`,`email`,`password_hash`,`phone`) VALUES
('Anna', 'Mills', 'ann34@example.org', NULL, 8920932993),
('Steve', 'K', 'st6@example.org', NULL, 89390293920),
('Jane', 'Lee', 'j7@example.org', NULL, 89320399320),
('Harry', 'Potter', 'avada8@example.org', NULL, 8393902939),
('Stasy', 'U', 'u8@example.org', NULL, 838393893),
('Anna', 'Mills', 'ann373834@example.org', NULL, 8920932937283),
('Steve', 'W', 'w6@example.org', NULL, 89390237283793920),
('Jane', 'Ortiz', 'or@example.org', NULL, 8932372837),
('Harry', 'Pot', 'lumos@example.org', NULL, 8393782732),
('Maria', 'P', 'm@example.org', NULL, 838393829383),
('Ron', 'W', 'ron@example.org', NULL, 89209732837),
('Tony', 'Stank', 'st9@example.org', NULL, 893972837),
('Kora', 'Lee', 'k7@example.org', NULL, 8329382393),
('Lily', 'Potter', 'lil8@example.org', NULL, 839209309),
('Tina', 'Gold', 'gold@example.org', NULL, 82930293932);

select * from users;

INSERT INTO friend_requests (`initiator_user_id`, `target_user_id`, `status`) VALUES
('1', '2', 'requested'),
('4', '6', 'requested'),
('2', '10', 'requested'),
('5', '1', 'approved'),
('8', '3', 'approved'),
('7', '2', 'approved'),
('12', '6', 'declined'),
('15', '3', 'declined'),
('11', '9', 'unfriended'),
('3', '4', 'requested');

INSERT INTO `media_types`(`name`)
VALUES
('photo'),
('video'),
('music');

INSERT INTO `media`(`media_type_id`,`user_id`,`body`,`filename`,`size`)
VALUES
('1','1',NULL,'photo.png','36'),
('1','2',NULL,'photo2.png','36'),
('1','3',NULL,'photo134.png','36'),
('1','4',NULL,'photo232.png','36'),
('1','5',NULL,'photo5.png','75'),
('1','6',NULL,'photo3.png','36'),
('1','7',NULL,'photo27.png','36'),
('1','8',NULL,'photo8.png','36'),
('1','9',NULL,'photo9.png','36'),
('1','10',NULL,'photo5454.png','36'),
('1','11',NULL,'photo1212.png','36'),
('1','12',NULL,'photo34.png','54'),
('1','13',NULL,'photo65.png','29');

INSERT INTO profiles (`user_id`,`gender`,`birthday`,`photo_id`,`hometown`) VALUES
('1','1','1996-03-10',1,'Boston'),
('2','0','2004-04-16',2,'Moscow'),
('3','1','1990-03-10',3,'London'),
('4','0','1995-03-10',4,'Boston'),
('5','1','2001-06-10',5,'London'),
('6','1','2000-03-15',6,'Moscow'),
('7','0','1956-03-10',7,'Boston'),
('8','1','1990-05-10',8,'Boston'),
('9','0','1996-03-12',9,'Moscow'),
('10','1','1994-09-10',10,'London'),
('11','0','1993-03-10',11,'Moscow'),
('12','0','1999-02-10',12,'Boston'),
('13','1','1995-03-19',13,'Boston');

INSERT INTO `messages` (`from_user_id`,`to_user_id`,`body`) VALUES
('1','4', 'Hello1'),
('6','3', 'Hello2'),
('5','3', 'Hello3'),
('5','9', 'Hello4'),
('2','3', 'Hello5'),
('11','2', 'Hello6'),
('12','8', 'Hello7'),
('13','9', 'Hello8'),
('8','1', 'Hello9'),
('9','10', 'Hello10'),
('4','7', 'Hello11'),
('7','2', 'Hello12');

INSERT INTO likes(`user_id`,`media_id`) VALUES
('1','3'),
('2','3'),
('3','4'),
('2','7'),
('3','1'),
('6','7'),
('4','3'),
('9','5'),
('2','2'),
('10','3'),
('11','10'),
('12','2');

INSERT INTO `communities` (`name`, `admin_user_id`) VALUES
('com1', '1'),
('com2', '2'),
('com3', '3'),
('com4', '2'),
('com5', '4'),
('com6', '9'),
('com7', '10'),
('com8', '2'),
('com9', '1'),
('com10', '5');

INSERT INTO `users_communities`(`user_id`,`community_id`) VALUES
('1','3'),
('2','1'),
('3','1'),
('4','4'),
('5','2'),
('6','3'),
('7','7'),
('8','5'),
('9','8'),
('10','2'),
('11','10'),
('12','9'),
('13','6');

INSERT INTO `photo_albums` (`name`,`user_id`) VALUES
('album1','1'),
('album2','1'),
('album3','3'),
('album4','5'),
('album5','7'),
('album6','2'),
('album7','3'),
('album8','4'),
('album9','5');

INSERT INTO `photos` (`album_id`, `media_id`) VALUES
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','5'),
('7','7'),
('8','8'),
('9','9'),
('3','10');

#Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
SELECT DISTINCT firstname FROM users ORDER BY firstname ASC;

#Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false)
ALTER TABLE profiles DROP COLUMN is_active;
ALTER TABLE profiles ADD COLUMN is_active bool DEFAULT(true);

UPDATE profiles
SET 
is_active = false
where 
(YEAR(birthday) + 18) < YEAR(current_date());

#Написать скрипт, удаляющий сообщения «из будущего»
delete from messages
where created_at > current_date();