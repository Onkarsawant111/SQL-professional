create database bank;
use bank;
create table users1(
u_id int primary key auto_increment,
u_first_name varchar(20),
u_last_name varchar(20)
);
insert into users1 (u_id, u_first_name, u_last_name)
values
(1001, 'onkar', 'sawant'),
(1002, 'raj', 'sharma'),
(1003, 'harry', 'johnson');
select * from users1;
create table users_updation1(
update_id int primary key auto_increment,
u_id int not null,
u_first_name varchar(20),
u_last_name varchar(20),
update_datetime datetime null,
action varchar(20) null 
);
delimiter //
create trigger users_updation1 before update on users1
for each row
begin	
 insert into users_updation1 (u_id, u_first_name, u_last_name, update_datetime, action)
    values (old.u_id, old.u_first_name, old.u_last_name, now(), 'update');
end // 
delimiter ;
select * from users_updation1;
set sql_safe_updates = 0;
update users1 set u_last_name = 'verma' where u_id = 1002;
select * from users_updation1;