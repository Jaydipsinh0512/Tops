-- 1 --
use music_streaming_app;
create table playlists1 (
    id int primary key,
    user_id int,
    playlist_name varchar(100),
    total_likes int
);
insert into playlists1 values
(1, 101, 'bollywood hits', 500),
(2, 101, 'romantic songs', 350),
(3, 101, 'party songs', 500),
(4, 102, 'workout music', 700),
(5, 102, 'chill vibes', 450),
(6, 103, 'top english songs', 600),
(7, 103, 'sad songs', 300),
(8, 104, 'lofi beats', 700);
select * from playlists1;

-- 2 --
select
    playlist_name,
    user_id,
    total_likes,
    row_number() over (order by total_likes desc) as row_num
from playlists1;

-- 3 --
select
    playlist_name,
    user_id,
    total_likes,
    rank() over (order by total_likes desc) as playlist_rank
from playlists1; 

-- 4 --
select
    playlist_name,
    user_id,
    total_likes,
    dense_rank() over (
        partition by user_id
        order by total_likes desc
    ) as playlist_dens_rank
from playlists1;

-- 5 --
with ranked_playlists as (
    select
        playlist_name,
        user_id,
        total_likes,
        row_number() over (
            partition by user_id
            order by total_likes desc
        ) as rn
    from playlists1
)
select
    playlist_name,
    user_id,
    total_likes,
    rn
from ranked_playlists
where rn <= 2;