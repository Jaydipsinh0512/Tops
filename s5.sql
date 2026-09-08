use foodie_app;

create table restaurants1 (
    id int primary key,
    name varchar(100),
    cuisine varchar(50),
    rating decimal(2,1),
    city varchar(50)
);

insert into restaurants1 values
(1, 'swagat', 'south indian', 4.3, 'surat'),
(2, 'swadisht', 'north indian', 4.1, 'ahmedabad'),
(3, 'dragon house', 'chinese', 4.5, 'surat'),
(4, 'pizza palace', 'italian', 3.8, 'ahmedabad'),
(5, 'taste corner', 'south indian', 3.4, 'vadodara');

select * from restaurants1;

select * from restaurants1
where rating > 4.0
and city in ('ahmedabad', 'surat');

select * from restaurants1
where name like "swa%";

select * from restaurants1
where rating between 3.5 and 4.5;

select * from restaurants1
where cuisine in ('chinese', 'italian', 'south indian');
