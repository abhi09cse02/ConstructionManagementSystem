create database demo;
use demo;
drop table user_details;
create table user_details(
user_id INT NOT NULL auto_increment
,user_name varchar(50) not null
,email varchar(50) not null
,password varchar(50) 
,create_date timestamp
,updated_date timestamp
,status_flag varchar(2)
,primary key (user_id)
);
