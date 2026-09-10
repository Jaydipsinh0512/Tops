use amazon;

-- 1 --

create table orders(
	order_id int primary key,
    user_id int,
    payment_method varchar(50),
    amount decimal(10,2)
);

insert into orders values
(1, 101, 'upi', 250.00),
(2, 102, 'card', 500.00),
(3, 101, 'wallet', 350.00),
(4, 103, 'cod', 450.00),
(5, 102, 'upi', 200.00),
(6, 104, 'card', 700.00),
(7, 103, 'wallet', 300.00),
(8, 104, 'upi', 550.00);

select * from orders;

-- 2 --

select payment_method, count(*) as order_count
from orders
group by payment_method;

-- 3 --

select user_id, sum(amount) as total_spend
from orders
group by user_id;

-- 4 --

select payment_method, avg(amount) as average_amount
from orders
group by payment_method
having avg(amount) > 300;

-- 5 --

select *
from orders
where amount > 300;

select payment_method, sum(amount) as price
from orders
group by payment_method
having sum(amount) > 300;
