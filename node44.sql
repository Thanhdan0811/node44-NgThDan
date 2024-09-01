# Tạo database
create database node44;
use node44;
# Tạo table
# Chuẩn đặt tên : không trùng tên keyword, không có ký tự đặc biệt. 
# (kết nối từ sql tới be không nên đặt tên in hoa)

# Có 3 kiểu dữ liệu chính
# Numberic (boolean 0 | 1) : INT, FLOAT, ...
# STRING : VARCHAR, TEXT, ...
# DATE : DATETIME, TIMESTAMP, ...

create table users (
	user_id int,
	full_name VARCHAR(50),
	email varchar(50),
	pass_word varchar(255),
	age int
);

# tạo data
INSERT INTO users (user_id, full_name, email, pass_word, age) VALUES
(1, 'Nguyễn Văn A', 'nguyenvana@example.com', 'password123', 25),
(2, 'Trần Thị B', 'tranthib@example.com', 'securepass456', 30),
(3, 'Lê Văn C', 'levanc@example.com', 'mypassword789', 22),
(4, 'Phạm Thị D', 'phamthid@example.com', 'pass1234', 28),
(5, 'Đỗ Văn E', 'dovanE@example.com', 'password!@#', 35),
(6, 'Vũ Thị F', 'vuthif@example.com', 'password2024', 27),
(7, 'Hoàng Văn G', 'hoangvang@example.com', 'letmein123', 31),
(8, 'Nguyễn Thị H', 'nguyenh@example.com', 'qwerty123', 24),
(9, 'Trần Văn I', 'tranvani@example.com', 'iloveyou1', 29),
(10, 'Lê Thị J', 'lethij@example.com', 'welcome123', 26),
(11, 'Phạm Văn K', 'phamvank@example.com', 'admin123', 32),
(12, 'Đỗ Thị L', 'dothil@example.com', 'password321', 33),
(13, 'Vũ Văn M', 'vuvanM@example.com', '12345678', 23),
(14, 'Hoàng Thị N', 'hoangthinh@example.com', 'password999', 34),
(15, 'Nguyễn Văn O', 'nguyenO@example.com', 'mypassword2024', 28),
(16, 'Trần Thị P', 'tranthip@example.com', 'abc1234', 26),
(17, 'Lê Văn Q', 'levanq@example.com', 'qwertyuiop', 29),
(18, 'Phạm Thị R', 'phamthir@example.com', 'pass123456', 27),
(19, 'Đỗ Văn S', 'dovans@example.com', '1234abcd', 30),
(20, 'Vũ Thị T', 'vuthit@example.com', 'password2024!@#', 25);


# tương tác với data
# Query (lấy dữ liệu)
# Thêm, xóa, sửa

# Query
select * from users;

select full_name as 'Họ tên' from users;

# Thêm column tuổi
alter table users
add column age int;

# đổi kiểu dữ liệu cho column full name
alter table users
modify COLUMN full_name varchar(255);

# Tìm ng cso tuổi 25 đến 30
# C1: 
select * from users 
where age <= 30 and age >= 25;

# C2: 
select * from users 
where age between 25 and 30;

# Filter những người ten John
select * from users
where full_name like '%thi%'and age between 25 and 30;


# sort : sắp xếp tuổi theo thứ tự giảm dần.
select * from users
order by email desc
limit 5;

# limit liên quan về phân trang.


# constraints dữ liệu trước khi insert thì phải tuân thủ quy định.
# thêm khóa chính, unique, not null.

# Thêm constraint (ràng buộc) cho column
alter table users
modify COLUMN full_name Varchar(255) not null,
modify COLUMN email Varchar(50) not null,
modify COLUMN pass_word Varchar(255) not null;


# Thêm khóa chính, xác định data là unique. primary key cho user_id
alter table users
modify column user_id int primary key auto_increment;

# Update data
update users 
set full_name = 'Thanh Dan'
where user_id = 1;

select * from users;

# delete data
# Xóa hẳn data ra khởi hệ thốngl
delete from users
where user_id = 2;

# soft delete  -> thêm flag is_deleter
alter table users
add column is_deleted int not null default 1;


# Query nâng cao 
# TÌm những ng có tuổi lớn nhất.
select * from users
where age = (
	select age from users
	order by age desc
	limit 1
);