use regular;
-- 1 --
create table foodorders (
    order_id int primary key,
    restaurant_name varchar(100),
    customer_name varchar(100),
    order_amount decimal(10,2),
    order_date date
);
insert into foodorders values
(1, 'swiggy kitchen', 'jay', 450.00, '2026-09-01'),
(2, 'dominos', 'amit', 650.00, '2026-09-01'),
(3, 'zomato cafe', 'riya', 300.00, '2026-09-02'),
(4, 'swiggy kitchen', 'jay', 550.00, '2026-09-02'),
(5, 'pizza hut', 'neha', 750.00, '2026-09-03'),
(6, 'dominos', 'amit', 500.00, '2026-09-03'),
(7, 'zomato cafe', 'riya', 400.00, '2026-09-04'),
(8, 'pizza hut', 'rahul', 900.00, '2026-09-04'),
(9, 'swiggy kitchen', 'neha', 350.00, '2026-09-05'),
(10, 'dominos', 'jay', 800.00, '2026-09-05');
select * from foodorders;

-- 2 --
create table topsongs (
    song_id int primary key,
    song_title varchar(150),
    artist varchar(100),
    streams bigint,
    release_date date
);
insert into topsongs values
(1, 'blinding lights', 'the weeknd', 4000000000, '2019-11-29'),
(2, 'shape of you', 'ed sheeran', 3800000000, '2017-01-06'),
(3, 'as it was', 'harry styles', 2500000000, '2022-04-01'),
(4, 'starboy', 'the weeknd', 2200000000, '2016-09-22'),
(5, 'perfect', 'ed sheeran', 2100000000, '2017-03-03');
select * from topsongs;

-- 3 --
select
    customer_name,
    sum(order_amount) as total_spent
from foodorders
group by customer_name
order by total_spent desc
limit 3;

-- 4 --
select
    restaurant_name,
    count(order_id) as number_of_orders,
    sum(order_amount) as total_order_amount
from foodorders
group by restaurant_name
order by total_order_amount desc;

-- 5 --
select
    "average order amount" as kpi_name,
    round(avg(order_amount), 2) as kpi_value
from foodorders

union all

select
    "total unique customers" as kpi_name,
    count(distinct customer_name) as kpi_value
from foodorders;