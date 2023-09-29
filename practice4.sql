create database `company`;
use `company`;
create table `employee`(
	`emp_id` int primary key,
    `name` varchar(20),
    `birth_date` date,
    `sex` varchar(5),
    `salary` int,
    `branch_id` int ,
    `sup_id` int 
);

create table `branch`(
	`branch_id` int primary key,
    `branch_name` varchar(20),
	`manager_id` int,
    foreign key (`manager_id`) references employee(`emp_id`) on delete set null
); 



alter table `employee` add foreign key (`branch_id`) references `branch`(`branch_id`)
on delete set null;
alter table `employee` add foreign key (`sup_id`) references `employee`(`emp_id`)
on delete set null;

create table `client`(
	`client_id` int primary key,
    client_name varchar(20),
    phone varchar(20)
);

create table `work_with`(
	`emp_id` int,
    `client_id` int,
    `total_sales` int,
    primary key(`emp_id`,`client_id`),
    foreign key(`emp_id`) references`employee`(`emp_id`) on delete cascade,
    foreign key(`client_id`) references`client`(`client_id`) on delete cascade
    
);
-- 新增公司資料 -- 
insert into `branch` values(1,'研發', null);
insert into `branch` values(2,'行政', null);
insert into `branch` values(3,'資訊', null);

INSERT INTO `employee` VALUES(206, '小黃', '1998-10-08', 'F', 50000, 1, NULL);
INSERT INTO `employee` VALUES(207, '小綠', '1985-09-16', 'M', 29000, 2, 206);
INSERT INTO `employee` VALUES(208, '小黑', '2000-12-19', 'M', 35000, 3, 206);
INSERT INTO `employee` VALUES(209, '小白', '1997-01-22', 'F', 39000, 3, 207);
INSERT INTO `employee` VALUES(210, '小蘭', '1925-11-10', 'F', 84000, 1, 207);

-- --更新branch外鍵的資料-- 
update `branch` set manager_id = 208 where `branch_id`=3;

INSERT INTO `client` VALUES(400, '阿狗', '254354335');
INSERT INTO `client` VALUES(401, '阿貓', '25633899');
INSERT INTO `client` VALUES(402, '旺來', '45354345');
INSERT INTO `client` VALUES(403, '露西', '54354365');
INSERT INTO `client` VALUES(404, '艾瑞克', '18783783');

INSERT INTO `work_with` VALUES(206, 400, 70000);
INSERT INTO `work_with` VALUES(207, 401, 24000);
INSERT INTO `work_with` VALUES(208, 402, 9800);
INSERT INTO `work_with` VALUES(208, 403, 24000);
INSERT INTO `work_with` VALUES(210, 404, 87940);

-- 取得所有員工資料-- 
select * from `employee`;
select * from `client`;
-- 員工薪水低到高排序-- 
select `salary`,`name` from `employee` order by `salary` desc;
-- 薪水前三高的員工-- 
select * from `employee` order by `salary` desc limit 3;
select `name` from `employee`;
select count(*) from `employee`;
select count(*) from `employee` where `sex` = 'F';
-- % 代表多個字元, _ 一個底線代表一個字元-- 
select * from `client` where `phone` like '%335';
select * from `client` where `phone` like '254%';
select * from `client` where `phone` like '%354%';
-- 姓艾的客戶-- 
select * from `client` where `client_name` like '艾%';
select * from `employee` where `birth_date` like '_____12%';
-- 合併 (資料形態要一樣)--
select `name` as `totoal_name` from `employee` union
select `client_name` from `client`;

-- 子查詢--
-- 找出研發部門經理的名字--  
select `name` from `employee` where `emp_id` =(
	select `manager_id` from `branch` where `branch_name` = '研發' 
    );
-- 不只一筆資料用where in 而不是where = -- 

set SQL_SAFE_UPDATEs=0;
drop table `branch`;
show tables;
select * from `work_with`;
DESCRIBE  `name`;
