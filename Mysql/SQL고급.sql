-- CREATE TABLE AS SELECT
create table city2 as select * from city;

select * from city2;

-- create database : 새로운 데이터베이스를 생성
-- use문으로 새 데이터베이스를 사용
create database poeun;

use poeun;

select * from test;

create table test2 (
	id INT NOT NULL PRIMARY KEY,
    col1 INT NULL,
    col2 FLOAT NULL,
    col3 VARCHAR(45) NULL
);
-- VARCHAR : 가변적 길이를 가진(variable character)

select * from test2;

-- ALTER TABLE문과 함께 ADD문을 사용하면, 테이블에 컬럼을 추가할 수 있음
ALTER TABLE test2
ADD col4 INT NULL;

select * from test2;

-- ALTER TABLE문과 함께 MODIFY문을 사용하면, 테이블의 컬럼 타입을 변경할 수 있음

DESC test2;

ALTER TABLE test2
MODIFY col4 VARCHAR(20) NULL;

-- ALTER TABLE문과 함께 DROP문을 사용하면, 테이블에 컬럼을 제거할 수 있음
ALTER TABLE test2
DROP col4;

/* INDEX(인덱스)
테이블에서 원하는 데이터를 빠르게 찾기 위해 사용
일반적으로 데이터를 검색할 때 순서대로 테이블 전체를 검색하므로 데이터가 많으면
많을수록 탐색하는 시간이 늘어남
검색과 질의를 할 때 테이블 전체를 읽지 않기 때문에 빠름
설정된 컬럼 값을 포함한 데이터의 삽입, 삭제, 수정 작업이 원본 테이블에서 이루어질 경우,
인덱스도 함께 수정되어야 함
인덱스가 있는 테이블은 처리 속도가 느려질 수 있으므로 수정보다는 검색이 자주 사용되는 테이블에서 사용하는 것이 좋음
*/

-- CREATE INDEX 문을 사용하여 인덱스를 생성
create index Col1Idx
On test (col1);

SHOW INDEX FROM test; -- 인덱스 정보 보기

-- CREATE UNIQUE INDEX : 중복 값을 허용하지 않는 인덱스
CREATE UNIQUE INDEX Col2Idx
on test (col2);

show index from test;

-- FULLTEXT INDEX : 일반적인 인덱스와는 달리 매우 빠르게 테이블의 모든 텍스트 칼럼을 검색
ALTER TABLE test
ADD FULLTEXT Col3Idx(col3);

show index from test;

-- INDEX 삭제(ALTER) : ALTER문을 사용하여 테이블에 추가된 인덱스 삭제
ALTER TABLE test
DROP INDEX Col3Idx;

show index from test;

-- INDEX 삭제(DROP INDEX) : DROP문을 사용하여 해당 테이블에서 명시된 인덱스를 삭제
-- DROP문은 내부적으로 ALTER문으로 자동 변환되어 명시된 이름의 인덱스를 삭제
DROP INDEX Col2Idx ON test;

show index from test;


/* VIEW
- 뷰는 데이터베이스에 존재하는 일종의 가상 테이블
- 실제 테이블처럼 행과 열을 가지고 있지만, 실제로 데이터를 저장하진 않음
- MySQL에서 뷰는 다른 테이블이나 다른 뷰에 저장되어 있는 데이터를 보여주는 역할만 수행
- 뷰를 사용하면 여러 테이블이나 뷰를 하나의 테이블처럼 볼 수 있음

뷰의 장점 
- 특정 사용자에게 테이블 전체가 아닌 필요한 컬럼만 보여줄 수 있음
- 복잡한 쿼리를 단순화해서 사용
- 쿼리 재사용 가능 

뷰의 단점 
- 한 번 정의된 뷰는 변경할 수 없음
- 삽입, 삭제, 갱신 작업에 많은 제한 사항을 가짐
- 자신만의 인덱스를 가질 수 없음
*/

create view testView as
select Col1, Col2
from test;

select * from testView;

-- ALTER VIEW : ALTER 문을 사용하여 뷰를 수정
alter view testView as
select Col1, Col2, Col3
from test;

select * from testView;

-- DROP VIEW : 생성된 뷰를 삭제 
DROP VIEW testView;

use world;

create view allView as
select city.Name, country.SurfaceArea, city.Population, countrylanguage.Language 
from city 
join country on city.CountryCode = country.Code
join countrylanguage on city.CountryCode = countrylanguage.CountryCode
where city.CountryCode = 'KOR';

select * from allView;

-- INSERT : 테이블 이름 다음에 나오는 열 생략 가능
-- 생략할 경우에 value 다음에 나오는 값들의 순서 및 개수가 테이블이 정의된 열 순서 및 개수와 동일해야 함
use poeun;
insert into test
value(1, 123, 1.1, 'Test');

select * from test;

-- INSERT INTO SELECT : test테이블에 있는 내용을 test2 테이블에 삽입
select * from test2;

insert into test2 select * from test;

select * from test2;

-- UPDATE : 기존에 입력되어 있는 값 변경하는 구문 
-- where절 생략 가능하나 테이블의 전체행의 내용 변경
update test
set col1 =1, col2=1.0, col3='test'
where id = 1;

select * from test;

/* DELETE
- 행 단위로 데이터 삭제하는 구문 
- DELETE FROM 테이블 이름 WHERE 조건;
- 데이터는 지워지지만 테이블 용량은 줄어들지 않음
- 원하는 데이터만 지울 수 있음 
- 삭제 후 잘못 삭제한 것을 되돌릴 수 있음
*/
delete from test
where id = 1;

select * from test;

/* TRUNCAE
- 용량은 줄어 들고, 인덱스 등도 모두 삭제 
- 테이블은 삭제하지 않고, 데이터만 삭제
- 한꺼번에 다 지워야 함 
- 삭제 후 절대 되돌릴 수 없음 */ 
truncate table test;

select * from test;

-- DROP TABLE : 테이블 전체를 삭제,공간, 객체를 삭제 
-- 삭제 후 절대 되돌릴 수 없음 
DROP TABLE test;

select * from test;

-- DROP DATABASE : 해당 데이터베이스를 삭제
DROP DATABASE r1;




