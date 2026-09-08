use music_streaming_app ;

create table musicplaylist (
	id int primary key,
    song_name varchar(100),
    artist varchar(100),
    genre varchar(50),
    duration int
);

insert into musicplaylist values
(1, 'perfect', 'ed sheeran', 'pop', 263),
(2, 'shape of you', 'ed sheeran', 'pop', 234),
(3, 'kesariya', 'arijit singh', 'bollywood', 268),
(4, 'believer', 'imagine dragons', 'rock', 204),
(5, 'love me like you do', 'ellie goulding', 'pop', 252);

select * from musicplaylist;

select song_name, artist
from musicplaylist 
limit 3;

use music_streaming_app ;

create table FoodOrders (
	id int primary key,
    restaurant varchar(100),
    food_item varchar(50),
    order_date date
);

insert into FoodOrders values
(1, 'dominos', 'pizza', '2026-09-01'),
(2, 'mcdonalds', 'burger', '2026-09-02'),
(3, 'dominos', 'garlic bread', '2026-09-03'),
(4, 'jay bhavani', 'vadapav', '2026-09-04'),
(5, 'mcdonalds', 'fries', '2026-09-05'),
(6, 'jay bhavani', 'sandwich', '2026-09-06'),
(7, 'dominos', 'choco lava', '2026-09-07'),
(8, 'the grand thakar', 'punjabi thali', '2026-09-08');

select * from FoodOrders;

select distinct restaurant
from FoodOrders;

select food_item as dish, order_date as date_ordered
from FoodOrders;

select distinct food_item, restaurant
limit 2
from FoodOrders;

select distinct food_item, restaurant
from FoodOrders limit 2;
