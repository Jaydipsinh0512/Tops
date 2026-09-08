-- 1 --

use flipkart;

select * from products
order by price asc;

-- 2 --

select * from products
order by price desc
limit 5;

-- 3 --
create database movie;
use movie;

create table movies (
    movie_id int primary key,
    title varchar(100),
    release_year int,
    rating decimal(3,1)
);

insert into movies (movie_id, title, release_year, rating) values 
(1, 'toxic', 2026, 8.3),
(2, '3 idiots', 2009, 8.4),
(3, 'pushpa 2', 2024, 6.0),
(4, 'bahubali 2', 2017, 8.2),
(5, '12th fail', 2023, 8.7);

select * from movies;

select * from movies
order by release_year desc, rating desc;

-- 4 --

use foodie_app;

select * from restaurants1
order by name asc
limit 10;

-- 5 --

use music_streaming_app ;

create table songs (
    song_id int primary key,
    song_name varchar(100),
    artist varchar(100),
    play_count int,
    added_date date
);

insert into songs (song_id, song_name, artist, play_count, added_date) values 
(1, 'kesariya', 'arijit singh', 1500000, '2026-01-15'),
(2, 'tum hi ho', 'arijit singh', 2500000, '2025-12-10'),
(3, 'shape of you', 'ed sheeran', 3000000, '2026-02-20'),
(4, 'perfect', 'ed sheeran', 1800000, '2026-03-05'),
(5, 'apna bana le', 'arijit singh', 2200000, '2026-04-12');

select * from songs;

select * from songs
order by play_count desc, added_date desc
limit 3;