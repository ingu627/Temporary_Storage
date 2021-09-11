insert into Person (name, birthday) values ('지선', '1989-10-17');
SELECT * from person;

INSERT INTO Person (name, birthday) values ('지인', '1992-3-13');

alter table Person add COLUMN New integer;

update Person set New = 164 where name='민아';
update Person set New = 167 where name='소진';
UPDATE Person set name='유라' where name='김아영';
update Person set New = 170.3 where name='유라';

alter table person RENAME column New To Height;

drop table Person;

create table 'Person1' (
	'ID'	INTEGER NOT NULL,
	'Name'	TEXT NOT NULL,
	'Birthday' TEXT,
	'Height' INTEGER,
	'Weight' INTEGER,
	PRIMARY KEY('ID' AUTOINCREMENT)
);

INSERT INTO Person1 VALUES
	(1, '혜리', '1994-06-09', NULL, 50),
	(2, '소진', '1986-05-21', 167, NULL),
	(3, '유라', '1992-11-06', 170.3, 54),
	(4, '민아', NULL, 164, 46);

SELECT * FROM Person1;

SELECT
	Name as '이름',
	Birthday as '생일'
FROM Person1;

SELECT
	Name '이름',
	Birthday '생일'
FROM Person1;

SELECT
	Name,
	Height,
	Weight,
	round(weight / (height * height * 0.0001), 1) BMI
FROM Person1;
-- 
-- select round(123.4567, 2);

create view Birthday
as
select 
	Name,
	Birthday bdate,
	substr(Birthday, 1, 4) YYYY,
	substr(Birthday, 6, 2) MM,
	substr(Birthday, 9, 2) DD
from Person1;

select * from Birthday;

DROP VIEW Birthday;
