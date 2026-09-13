-- 1 --
create table restaurant (
    id int primary key,
    name varchar(100),
    cuisine varchar(50),
    location varchar(100),
    average_rating decimal(3,2)
);
insert into restaurant values
(1, 'swati snacks', 'indian', 'ahmedabad', 4.5),
(2, 'dominos pizza', 'italian', 'ahmedabad', 4.2),
(3, 'punjabi tadka', 'punjabi', 'surat', 4.6),
(4, 'south indian cafe', 'south indian', 'ahmedabad', 4.3),
(5, 'urban kitchen', 'indian', 'surat', 4.1);
select * from restaurant;

-- 2 --
select
    cuisine,
    count(*) as restaurant_count
from restaurant
group by cuisine
order by restaurant_count desc;

-- 3 --
create table review (
    r_id int primary key,
    restaurant_id int,
    user_name varchar(100),
    rating decimal(2,1),
    review_date date,
    foreign key (restaurant_id) references restaurant(id)
);
insert into review values
(1, 1, 'jay', 4.5, '2026-09-01'),
(2, 1, 'amit', 5.0, '2026-09-02'),
(3, 2, 'riya', 4.0, '2026-09-03'),
(4, 2, 'neha', 4.5, '2026-09-04'),
(5, 3, 'rahul', 5.0, '2026-09-05'),
(6, 3, 'jay', 4.5, '2026-09-06'),
(7, 4, 'amit', 4.0, '2026-09-07'),
(8, 4, 'riya', 4.5, '2026-09-08'),
(9, 5, 'neha', 4.0, '2026-09-09'),
(10, 5, 'rahul', 4.5, '2026-09-10');
select * from review;

-- 4 --
select
    r.name,
    r.cuisine,
    round(avg(rv.rating), 2) as average_review_rating
from restaurant r
join review rv
    on r.id = rv.restaurant_id
group by r.id, r.name, r.cuisine
order by average_review_rating desc;

-- 5 --
select
    name,
    cuisine,
    average_review_rating,
    rank() over (
        partition by cuisine
        order by average_review_rating desc
    ) as restaurant_rank
from (
    select
        r.id,
        r.name,
        r.cuisine,
        round(avg(rv.rating), 2) as average_review_rating
    from restaurant r
    join review rv
        on r.id = rv.restaurant_id
    group by r.id, r.name, r.cuisine
) as restaurant_ratings
order by cuisine, restaurant_rank;