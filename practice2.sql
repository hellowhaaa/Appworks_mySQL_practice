show databases;
use mydb;
show tables;
create table product2(
	id INT PRIMARY KEY auto_increment,
    name varchar(255) not null
);

create table variant(
	id int primary key auto_increment,
    product2_id int,
    size varchar(2) not null,
    price int not null
);

describe product2;

INSERT INTO product2(name) values('美式');
insert into product2(name) values('拿鐵');
insert into product2(name) values('奶茶');
update product2 set name='紅茶' where name='奶茶' and id =4; 
select * from product2;
select * from variant; 

insert into variant(product2_id, size, price)values(1, '中杯', 40);
insert into variant(product2_id, size, price)values(1, '大杯', 50);
insert into variant(product2_id, size, price)values(2, '中杯', 60);
insert into variant(product2_id, size, price)values(2, '大杯', 80);
insert into variant(product2_id, size, price)values(3, '中杯', 100);
insert into variant(product2_id, size, price)values(3, '大杯', 120);

-- 測試inner(有對應到的才會出現), left, right-- 
select * from product2 inner join variant on product2.id = variant.product2_id;
select product2.name, variant.size, variant.price from  product2 inner join variant on product2.id = variant.product2_id;
insert into variant(product2_id, size, price)values(6, '中杯', 100);
insert into product2(name) values('日本抹茶');
select * from product2 left join variant on product2.id = variant.product2_id;
select * from product2 right join variant on product2.id = variant.product2_id;

-- 增加外鍵才不會不小心被刪掉--
delete from product2 where id=3;
insert into product2(id,name) values (3, '拿鐵');
ALTER TABLE product2 ADD foreign key (id) REFERENCES variant(product2_id);
-- 增加外鍵才不會不小心被刪掉--

-- 練習函數式--
select avg(price) from variant group by product2_id; 
select product2_id, avg(price) from variant group by product2_id; 
-- select product2_id, avg(price) from variant left join on product2.id = variant.product2_id  group by product2_id;
select product2.name, avg(variant.price) from variant inner join product2 on variant.product2_id = product2.id  group by variant.product2_id;
 
 select avg(id) from variant;
 select max(price) from variant;
 select avg(price), min(price), max(price) from variant;
select size, avg(price) from variant group by size
