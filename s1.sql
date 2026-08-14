create database music_streaming_app ; 
use music_streaming_app ;

create table playlists (
	playlist_id int primary key,
    playlist_name varchar(50),
    created_by varchar(50)
);

insert into playlists (playlist_id, playlist_name, created_by) values
(1, "Bollywood Hits", "Amit"),
(2, "Chill Vibes", "Jaydip"),
(3, "Workout Mix", "Tarang");

select * from playlists;

select * from playlists
where created_by = "Amit";

 /*  ### Table, Row, and Column in SQL — Food Delivery Example

Imagine a food delivery app like **Zomato** has a table called `customers`.

```text
customers
+----+----------+---------+-------------+
| id | name     | city    | phone       |
+----+----------+---------+-------------+
| 1  | Amit     | Surat   | 9876543210  |
| 2  | Rahul    | Mumbai  | 9876543211  |
| 3  | Priya    | Delhi   | 9876543212  |
+----+----------+---------+-------------+
```

* **Table:** A table stores related data in a structured format. Here, `customers` is the table that stores customer information.
* **Column:** A column represents one type of information or attribute. For example, `name`, `city`, and `phone` are columns.
* **Row:** A row represents one complete record. For example, the row containing `1, Amit, Surat, 9876543210` represents one customer.

### Simple way to remember

**Table = Collection of data**
**Column = Type of data**
**Row = One record**

For example, in a food delivery app:

```text
Table  → Customers
Column → Name
Row    → Amit, Surat, 9876543210
``` */
