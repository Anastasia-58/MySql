USE vk;

-- Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).

select 
    from_user_id , 
    to_user_id,
	count(from_user_id) as col
from 
	messages
group by 
	from_user_id
having
	to_user_id = 3
order by 
	col desc
limit 1;

-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет

select 
	count(*)
from 
	likes
where 
	timestampdiff(year, (select birthday from profiles where user_id = likes.user_id), now()) < 10;
    
-- Определить кто больше поставил лайков (всего): мужчины или женщины

select
	count(*) as col,
	case (select gender from profiles where user_id = likes.user_id) 
		when '0' then 'мужской'
        when '1' then 'женский'
        end as gender
from 
	likes
group by 
	gender
order by 
	col desc
limit 1;