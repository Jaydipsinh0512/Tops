-- 1 --
use foodie_app;
create table orders (
    order_id int primary key,
    user_id int,
    order_date date,
    total_amount decimal(10,2)
);
insert into orders values
(1, 101, '2026-09-01', 250.00),
(2, 101, '2026-09-03', 400.00),
(3, 101, '2026-09-05', 300.00),
(4, 102, '2026-09-02', 500.00),
(5, 102, '2026-09-04', 350.00),
(6, 103, '2026-09-01', 200.00),
(7, 103, '2026-09-06', 450.00);
select * from orders;

-- 2 --
select
    user_id,
    order_id,
    order_date,
    total_amount,
    lag(total_amount) over (
        partition by user_id
        order by order_date
    ) as previous_amount
from orders
order by user_id, order_date;

-- 3 --
select
    user_id,
    order_id,
    order_date,
    total_amount,
    lead(total_amount) over (
        partition by user_id
        order by order_date
    ) as next_amount
from orders
order by user_id, order_date;

-- 4 --
select
    user_id,
    order_id,
    order_date,
    total_amount,
    sum(total_amount) over (
        partition by user_id
        order by order_date
        rows between unbounded preceding and current row
    ) as running_total
from orders
order by user_id, order_date;

-- 5 --
select
    user_id,
    order_id,
    order_date,
    total_amount,
    round(
        sum(total_amount) over (
            partition by user_id
            order by order_date
            rows between 2 preceding and current row
        )
        /
        count(total_amount) over (
            partition by user_id
            order by order_date
            rows between 2 preceding and current row
        ),
        2
    ) as moving_avg
from orders;