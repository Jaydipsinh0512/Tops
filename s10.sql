-- 1 --

create table influencers (
    id int primary key,
    name varchar(100)
);
insert into influencers values
(1, 'rahul'),
(2, 'neha'),
(3, 'amit'),
(4, 'priya'),
(5, 'karan');
select * from influencers;

create table collaborations (
    id int primary key,
    influencer1_id int,
    influencer2_id int,
    collab_date date
);
insert into collaborations values
(1, 1, 2, "2026-01-10"),
(2, 2, 3, "2026-02-15"),
(3, 1, 4, "2026-03-20");
select * from collaborations;

select
    i1.name as influencer_name,
    i2.name as collaboration_partner,
    c.collab_date
from influencers i1
left join collaborations c
    on i1.id = c.influencer1_id
left join influencers i2
    on c.influencer2_id = i2.id
union
select
    i1.name as influencer_name,
    i2.name as collaboration_partner,
    c.collab_date
from influencers i1
right join collaborations c
    on i1.id = c.influencer1_id
left join influencers i2
    on c.influencer2_id = i2.id;
    
-- 2 --

create table playlist (
    id int primary key,
    user_id int,
    playlist_name varchar(100),
    parent_playlist_id int
);
insert into playlist (id, user_id, playlist_name, parent_playlist_id) values
(1, 101, 'music', null),
(2, 101, 'bollywood', 1),
(3, 101, 'romantic', 1),
(4, 102, 'workout', null),
(5, 102, 'gym songs', 4);
select * from playlist;

select
    p.playlist_name as playlist_name,
    parent.playlist_name as parent_playlist_name
from playlist p
left join playlists parent
    on p.parent_playlist_id = parent.id;
    
-- 3 --
create table users (
    id int primary key,
    username varchar(100)
);
insert into users (id, username) values
(1, 'rahul'),
(2, 'neha'),
(3, 'amit'),
(4, 'priya');
select * from users;

create table orders (
    id int primary key,
    user_id int,
    order_date date
);
insert into orders (id, user_id, order_date) values
(101, 1, '2026-09-01'),
(102, 1, '2026-09-03'),
(103, 2, '2026-09-04');
select * from orders;

create table payments (
    id int primary key,
    order_id int,
    amount decimal(10,2)
);
insert into payments (id, order_id, amount) values
(1, 101, 500.00),
(2, 102, 750.00),
(3, 103, 300.00);
select * from payments;

select
    u.username,
    o.order_date,
    p.amount
from users u
left join orders o
    on u.id = o.user_id
left join payments p
    on o.id = p.order_id;
    
-- 4 --
create table reviews (
    id int primary key,
    restaurant_id int,
    rating int,
    review_text varchar(255)
);
insert into reviews values
(1, 1, 5, 'excellent food'),
(2, 1, 4, 'good service'),
(3, 4, 5, 'great taste'),
(4, 2, 4, 'nice restaurant');
select * from reviews;

select distinct
    r.id,
    r.name,
    r.city
from restaurants r
inner join reviews v
    on r.id = v.restaurant_id;
    
-- 5 --

create table categories (
    id int primary key,
    category_name varchar(100)
);
insert into categories (id, category_name) values
(1, 'electronics'),
(2, 'fashion'),
(3, 'grocery');
select * from categories;

create table products (
    product_id int primary key,
    product_name varchar(100),
    id int,
    category_name varchar(100),
    foreign key (id) references categories (id)
);
insert into products values
(101, 'laptop', 1, 'electronics'),
(102, 'mobile', 1, 'electronics'),
(103, 't-shirt', 2, 'fashion'),
(104, 'rice', 3, 'grocery');
select * from products;

select
    p.product_name,
    c.category_name
from products p
inner join categories c
    on p.id = c.id;
    
select
    p.product_name,
    c.category_name
from products p
inner join categories c
    on p.category_name = c.category_name;