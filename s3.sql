use music_streaming_app ;

create table playlist (
	playlist_id int primary key,
    song_name varchar(50),
    artist_name varchar(50),
    duration int
);

insert into playlist (playlist_id, song_name, artist_name, duration) values 
(1, "Dekha Hazaro dafa", "Arjit Singh", 207);

insert into playlist (playlist_id, song_name, artist_name, duration) values 
(2, "295", "Sindhu Moosewala", 115),
(3, "Excuses", "Ap Dhillon", 190),
(4, "Saibo Re", "Kirtidan Gadhvi", 195);

select * from playlist ;

update playlist set artist_name = "Arijit Singh"
where playlist_id = 1;

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

delete from playlist 
where duration < 120;

update playlist set song_name = concat(song_name, "(Remix)")
where artist_name = "Ap Dhillon" and duration > 180;



