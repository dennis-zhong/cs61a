.read lab13.sql

CREATE TABLE su19favpets AS
  SELECT pet, count(*) from students group by pet order by count(*) desc limit 10;


CREATE TABLE su19dog AS
  SELECT * from su19favpets where pet = 'dog';


CREATE TABLE obedienceimages AS
  SELECT seven, instructor, count(*) from obedience where seven = '7' group by instructor;
