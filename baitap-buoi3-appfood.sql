# 5 người đã like nhà hàng nhiều nhất.
SELECT u.user_id, u.full_name, u.email, COUNT(lr.user_id) AS count_user_like 
FROM users AS u
INNER JOIN like_res AS lr ON u.user_id = lr.user_id
GROUP BY u.user_id, u.full_name, u.email
ORDER BY count_user_like DESC
LIMIT 5;

# 2 nhà hàng có lượt like nhiều nhất.
SELECT r.res_name, r.res_id, COUNT(lr.res_id) AS count_res_like
FROM restaurant AS r
INNER JOIN like_res AS lr ON r.res_id = lr.res_id
GROUP BY r.res_name, r.res_id
ORDER BY count_res_like DESC
LIMIT 2;

# 3 Tìm người đã đặt hàng nhiều nhất
select user_id, full_name, email
from users
where user_id = (
	select user_id from orders
	group by user_id
	order by count(user_id) desc
	limit 1
);

# 4 Tìm người dùng không hoạt động trong hệ thống
SELECT u.user_id, u.full_name, u.email
FROM users AS u
LEFT JOIN orders AS o ON u.user_id = o.user_id
LEFT JOIN like_res AS lr ON u.user_id = lr.user_id
LEFT JOIN rate_res AS rr ON u.user_id = rr.user_id
WHERE o.user_id IS NULL AND lr.user_id IS NULL AND rr.user_id IS NULL;
