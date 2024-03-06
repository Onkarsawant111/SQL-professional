create database bank;
use bank;
create table users(
u_id int primary key,
u_first_name varchar(20),
u_last_name varchar(20)
);
insert into users(u_id, u_first_name, u_last_name) values
(1001, 'onkar', 'sawant'),
(1002, 'raj', 'sharma'),
(1003, 'harry', 'johnson');
create table insert_data(
id int primary key auto_increment,
u_id int,
u_first_name varchar(20),
u_last_name varchar(20),
action varchar(20)
);
select * from insert_data;
delimiter //
create trigger insert_data after insert on users
for each row 
begin
insert into insert_data (id, u_id, u_first_name, u_last_name, action) 
values (id, new.u_id, new.u_first_name, new.u_last_name, 'insert');
end //
delimiter ; 
select * from insert_data;
insert into users(u_id, u_first_name, u_last_name)
values ( 1004, 'max', 'muller');
select * from insert_data;
select * from users;
