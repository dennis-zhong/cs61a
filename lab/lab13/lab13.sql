.read su19data.sql

CREATE TABLE obedience AS
  SELECT seven, instructor from students;

CREATE TABLE smallest_int AS
  SELECT time, smallest from students where smallest>2 order by smallest asc limit 20;

CREATE TABLE matchmaker AS
  SELECT table1.pet, table1.song, table1.color, table2.color 
  from students as table1, students as table2 
  where table1.song = table2.song and table1.pet = table2.pet
  and table1.time != table2.time and table1.time<table2.time;

CREATE TABLE smallest_int_having AS
  SELECT time, smallest from students group by smallest having count(*)=1;

select pizza1.brand, pizza2.brand 
from pizzas as pizza1, pizzas as pizza2
where pizza1.brand < pizza2.brand 
and pizza1.vegetarian = True and pizza2.vegetarian = True