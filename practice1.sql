show databases;
use mydb;
show tables;
create table `product`(
	id int primary key auto_increment,
    name varchar(255) not null,
    price int default 30
);
select * from product;
insert into product(id, name, price) values(1,'拿鐵',50);
insert into product(id, name, price) values(2,'餅乾',40);
insert into product(id, name, price) values(3,'奶茶',80);
delete from product where price = null;
insert into product(name, price) values('糖果',60);
insert into product(name) values('日本甜點');
select * from product where price = 40;
insert into product(name) values('日本');

-- 選取 and, or, <>不等於, desc, limit, order by-- 
select * from product where price=30;
select * from product where name in ('糖果','拿鐵');
select * from product where price<>60 and name ='日本';
select name, price from product where price=30;
select price from product order by price;
select name, price from product order by price desc;
select name, price from product order by price desc limit 3;

set SQL_SAFE_UPDATEs=0;
SET SQL_SAFE_UPDATES = 1;

-- 更新資料--  
update product set price=50 where name = '奶茶';
update product set name= '日本抹茶', price=100 where name ='日本';
update product set price=250 where name='日本抹茶';
delete from product where name='拿鐵'; 