-- 1 --

create database amazon;
use amazon;

create table orders1 (
    order_id int primary key,
    user_name varchar(100),
    total_amount decimal(10, 2),
    order_date date
);

insert into orders1 values
(1, 'rahul', 2500.00, '2026-09-01'),
(2, 'sujal', 1800.50, '2026-09-02'),
(3, 'amit', null, '2026-09-03'),
(4, 'jd', 3200.75, '2026-09-04'),
(5, 'neha', 1500.00, '2026-09-05');
select * from orders1;

-- 2 --

select user_name, count(*) as order_count
from orders1
group by user_name;

-- 3 --

select avg(total_amount) as average_order_amount
from orders1;

-- 4 --

select max(total_amount) as highest_order_amount,
       min(total_amount) as lowest_order_amount
from orders1;

-- 5 --

select sum(total_amount) as total_sales
from orders1
where total_amount is not null;