show databases;
use mydb;
show tables;
create table product3(
	id INT primary key auto_increment,
    name varchar(100) not null unique
);

insert into product3 (name) values ('美式');
insert into product3 (name) values ('拿鐵');
insert into product3 (name) values ('奶茶');
insert into product3 (name) values ('青茶');
insert into product3 (name) values ('綠茶');
select * from product3;
select * from product3 where name = "青茶";
explain select * from product3 where name ='青茶';
alter table product3 add index name_index (name);
alter table product3 drop index name_index;
explain select * from product3 where id=4;

alter table product3 add student varchar(3);
alter table product3 add gpa decimal(3,2); 
alter table product3 drop column gpa;