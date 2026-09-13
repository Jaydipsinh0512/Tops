-- 1 --
create table songs1 (
    song_id int primary key,
    artist_name varchar(100),
    title varchar(150)
);
insert into songs1 values
(1, 'arijit singh', 'tum hi ho'),
(2, 'arijit singh', 'agar tum saath ho'),
(3, 'arijit singh', 'channa mereya'),
(4, 'arijit singh', 'kesariya'),
(5, 'atif aslam', 'jeene laga hoon'),
(6, 'atif aslam', 'tera hone laga hoon'),
(7, 'atif aslam', 'tajdar-e-haram'),
(8, 'atif aslam', 'dil diya gallan'),
(9, 'shreya ghoshal', 'sun raha hai'),
(10, 'shreya ghoshal', 'manwa laage');

select
    artist_name,
    count(song_id) as total_songs
from songs1
group by artist_name
having count(song_id) > 3;

-- 2 --
create table users1 (
    user_id int primary key,
    username varchar(100)
);
insert into users1 values
(1, 'jaydip'),
(2, 'jenvi'),
(3, 'rishit'),
(4, 'sujal'),
(5, 'rahul');

create table orders1 (
    order_id int primary key,
    user_id int,
    amount decimal(10,2),
    foreign key (user_id) references users1(user_id)
);
insert into orders1 values
(101, 1, 500.00),
(102, 1, 750.00),
(103, 2, 300.00),
(104, 2, 450.00),
(105, 3, 800.00),
(106, 3, 250.00),
(107, 4, 600.00),
(108, 5, 900.00);

select
    u.username,
    sum(o.amount) as total_order_amount
from users1 u
join orders1 o
    on u.user_id = o.user_id
group by u.user_id, u.username;

-- 3 --
create table restaurants1 (
    id int primary key,
    name varchar(100),
    rating decimal(3,2)
);
insert into restaurants1 values
(1, 'swati snacks', 4.50),
(2, 'punjabi tadka', 4.70),
(3, 'urban kitchen', 4.10),
(4, 'south indian cafe', 4.30),
(5, 'food junction', 3.90),
(6, 'spice garden', 4.80);

select
    name,
    rating
from restaurants1
where rating > (
    select avg(rating)
    from restaurants1
);

-- 4 --
create table transactions (
    id int primary key,
    user_id int,
    amount decimal(10,2),
    transaction_date date
);
insert into transactions values
(1, 101, 500.00, '2026-09-01'),
(2, 101, 300.00, '2026-09-03'),
(3, 102, 400.00, '2026-09-01'),
(4, 102, 600.00, '2026-09-05'),
(5, 103, 800.00, '2026-09-02'),
(6, 103, 250.00, '2026-09-05'),
(7, 104, 1000.00, '2026-09-01'),
(8, 104, 500.00, '2026-09-07');

select
    user_id,
    transaction_date,
    amount,
    sum(amount) over (
        partition by user_id
        order by transaction_date
    ) as running_total
from transactions
order by user_id, transaction_date;

-- 5 --
-- optimization 1
use flipkart;
select * from products;

create index idx_category_price
on products(category, price);

show index from products;

-- optimization 2
select
    product_id,
    product_name,
    category,
    price
from products
where category = "Furniture"
and price between 5000 and 20000;