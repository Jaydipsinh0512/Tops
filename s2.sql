SELECT VERSION();

create database foodie_app;
use foodie_app;

create table restaurants (
id int primary key,
name varchar(100),
cuisine varchar(50),
rating decimal(2,1),
location varchar(100)
);

select * from restaurants;

DESCRIBE restaurants;

create table users (
user_id int primary key auto_increment,
username varchar(50) not null,
email varchar(100) not null unique,
phone_number varchar(15) unique,
created_at datetime default current_timestamp
);

select * from users;
DESCRIBE users;

create table reviews (
review_id int primary key
rating int
);
