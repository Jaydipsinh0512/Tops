-- 1 --
use ajio;

with top_rated_products as (
    select
        p.product_id,
        p.product_name,
        avg(r.rating) as rating
    from products p
    join reviews r
        on p.product_id = r.product_id
    group by p.product_id, p.product_name
    having avg(r.rating) > 4.5
)
select *
from top_rated_products;

-- 2 --
use foodie_app;
select *
from (
    select *
    from restaurants1
    where city = 'Ahmedabad'
) as ahmedabad_restaurants
where delivery_charge < 50;

with ahmedabad_restaurants as (
    select *
    from restaurants1
    where city = 'Ahmedabad'
)
select *
from ahmedabad_restaurants
where delivery_charge < 50;

-- 3 --
create table posts (
    post_id int primary key,
    user_id int,
    likes int,
    foreign key (user_id) references users(user_id)
);
insert into posts values
(101, 1, 5000),
(102, 2, 4200),
(103, 3, 3900),
(104, 4, 3500);
select * from posts;

with top_users as (
    select *
    from users
    order by followers desc
    limit 3
),
top_posts as (
    select *
    from posts
    order by likes desc
    limit 3
)
select * from top_users
union all
select * from top_posts;

-- 4 --
create table booking_dates (
    id int primary key,
    booking_date date
);
insert into booking_dates values 
(1, "2026-09-12");

with recursive dates as (
    select curdate() as booking_date

    union all

    select booking_date + interval 1 day
    from dates
    where booking_date < curdate() + interval 6 day
)
select booking_date
from dates;

-- 5 --
-- Messy query
select *
from (
    select user_id, username, followers
    from users
) as user_data
where followers > 1000;

-- refactor query
with user_data as (
    select user_id, username, followers
    from users
)
select *
from user_data
where followers > 1000;