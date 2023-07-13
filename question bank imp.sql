
-- comments_and_translation table. */
-- create table comments_and_translations
-- (
-- 	id				int,
-- 	comment			varchar(100),
-- 	translation		varchar(100)
-- );

-- insert into comments_and_translations values
-- (1, 'very good', null),
-- (2, 'good', null),
-- (3, 'bad', null),
-- (4, 'ordinary', null),
-- (5, 'cdcdcdcd', 'very bad'),
-- (6, 'excellent', null),
-- (7, 'ababab', 'not satisfied'),
-- (8, 'satisfied', null),
-- (9, 'aabbaabb', 'extraordinary'),
-- (10, 'ccddccbb', 'medium')
 -- Write an SQL query to display the correct message (meaningful message) from the input
 select * from comments_and_translations;
select 
	case
		when translation is null then comment
        else comment
	end as "meaningfull values"
from comments_and_translations;

 
-- CREATE TABLE source
    (
        id      int,
        name    varchar(1)
    );
    
    CREATE TABLE target
    (
        id      int,
        name    varchar(1)
    );

INSERT INTO source VALUES (1, 'A');
INSERT INTO source VALUES (2, 'B');
INSERT INTO source VALUES (3, 'C');
INSERT INTO source VALUES (4, 'D');

INSERT INTO target VALUES (1, 'A');
INSERT INTO target VALUES (2, 'B');
INSERT INTO target VALUES (4, 'X');
INSERT INTO target VALUES (5, 'F');

-- question 2 
select * from source;
select * from target ;

-- output
-- id 	  -- comment
-- 3        new in  source
-- 5 		new in target
-- 4		mismatch

SELECT s.id, 'new in source' AS comment
FROM source s
LEFT JOIN target t ON s.id = t.id
WHERE t.id IS NULL

UNION

SELECT t.id, 'new in target' AS comment
FROM source s
RIGHT JOIN target t ON s.id = t.id
WHERE s.id IS NULL

UNION

SELECT s.id, 'mismatch' AS comment
FROM source s
JOIN target t ON s.id = t.id AND s.name <> t.name;

create table teams
    (
        team_code       varchar(10),
        team_name       varchar(40)
    );

insert into teams values ('RCB', 'Royal Challengers Bangalore');
insert into teams values ('MI', 'Mumbai Indians');
insert into teams values ('CSK', 'Chennai Super Kings');
insert into teams values ('DC', 'Delhi Capitals');
insert into teams values ('RR', 'Rajasthan Royals');
insert into teams values ('SRH', 'Sunrisers Hyderbad');
insert into teams values ('PBKS', 'Punjab Kings');
insert into teams values ('KKR', 'Kolkata Knight Riders'); insert into teams values ('GT', 'Gujarat Titans');
insert into teams values ('LSG', 'Lucknow Super Giants');
 commit;


-- question 3
 -- write an sql query such that each team play with other team just once
 WITH matches AS (
    SELECT ROW_NUMBER() OVER (ORDER BY team_name) AS id, team_code, team_name
    FROM teams
)
SELECT t1.team_name , o1.team_name 
FROM matches t1
JOIN matches o1 ON t1.id < o1.id;
 -- also write a query such that each team play with other team twice
WITH matches AS (
    SELECT ROW_NUMBER() OVER (ORDER BY team_name) AS id, team_code, team_name
    FROM teams
)
SELECT t1.team_name , o1.team_name 
FROM matches t1
JOIN matches o1 ON t1.id <> o1.id;






