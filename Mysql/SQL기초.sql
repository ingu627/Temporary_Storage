/* DDL(Data Definition Language)
데이터 정의 언어
데이터베이스, 테이블, 뷰, 인덱스 등의 데이터베이스 개체를 생성/삭제/변경하는 역할
CREATE, DROP, ATLER구문
DDL은 트랜잭션 발생시키지 않음
ROLLBACK이나 commit 사용 불가
DDL문은 실행 즉시 MySQL에 적용
*/ 

/*
DML(Data Manipulation Language)
데이터 조작 언어 
데이터를 조작(선택, 삽입, 수정, 삭제)하는 데 사용되는 언어
DML구문이 사용되는 대상은 테이블의 행
DML 사용하기 위해서는 꼭 그 이전에 테이블이 정의되어 있어야함
SQL문 중 SELECT, INSERT, UPDATE, DELETE가 이 구문에 해당
트랜잭션이 발생하는 sql도 이 DML에 속함
*/

/*
DCL(Data Control Language)
데이터 제어 언어
사용자에게 어떤 권한을 부여하거나 빼앗을 때 주로 사용하는 구문
GRANT/REVOKE
*/


SHOW DATABASES; -- 현재 서버에 어떤 DB가 있는지 보기


-- 단일 주석
-- /* */ 멀티 주석

-- USB : 사용할 데이터베이스 지정 
-- 지정해 놓은 후 특별히 다시 USE문 사용하거나 다른 DB를 사용하겠다고 명시하지 않는 이상 모든 SQL문은 지정 DB에서 수행
use world;

SHOW TABLES; -- 데이터베이스 world의 테이블 이름 보기

SHOW TABLE STATUS; 
-- : 데이터베이스 WORLD의 테이블 정보 조회

DESCRIBE city; 
-- city 테이블에 무슨 열이 있는지 확인 
-- 또는 DESC

DESC country; 
-- ; :쿼리가 끝났다

DESC countrylanguage;

-- SELECT...FROM : 요구하는 데이터를 가져오는 구문
-- 일반적으로 가장 많이 사용되는 구문
-- 데이터베이스 내 테이블에서 원하는 정보를 추출
select * from city; -- city의 모든 열을 다 보여줌
--  * : all

-- select 열 이름 : 테이블에서 필요로 하는 열만 가져오기 가능
-- 여러 개의 열을 가져오고 싶을 때는 콤마로 구분
-- 열 이름의 순서는 출력하고 싶은 순서대로 배열 가능
select Name From city;
select Name, Population from city;

-- where : 조회하는 결과에 특정한 조건으로 원하는 데이터만 보고 싶을때 
-- SELECT 필드이름 from 테이블 이름 WHERE 조건식;
select *
from city
where Population >= 8000000;

select *
from city
where Population < 8000000
and Population > 7000000;

DESC city;

select *
from city
where CountryCode = 'KOR'
and Population >= 1000000;

-- BETWEEN : 데이터가 숫자로 구성됨
select *
from city
where Population between 7000000 and 8000000;

-- IN : 이산적인 값의 조건에서는 IN() 사용 가능
select *
from city
where Name In('Seoul', 'New York', 'Tokyo');

select *
from city
where CountryCode IN('KOR', 'usa', 'JPN');

-- LIKE : 문자열의 내용 검색하기 위해 LIKE 연산자 사용
-- 문자 뒤에 %-무엇이든 허용
-- 한 글자와 매치하기 위해서는 _사용
select *
from city
where CountryCode like 'KO_';

select *
from city
where Name like 'Tel %';

-- Sub Query : 쿼리문 안에 또 쿼리문이 들어 있는 것
select *
from city
where CountryCode = (
     select CountryCode
     from city
     where Name = 'Seoul');

-- ANY : 서브쿼리의 여러 개의 결과 중 한 가지만 만족해도 가능
-- SOME은 ANY와 동일한 의미로 사용
select *
from city
where Population > ANY (
     select Population
     from city
     where District = 'New York');

-- ALL : 서브쿼리의 여러 개의 결과를 모두 만족시켜야 함 
select *
from city
where Population > all (
     select Population
     from city
     where District = 'New York'); -- 뉴욕의 인구수보다 많은 도시들을 보여줘라

-- ORDER GROUP : 결과가 출력되는 순서를 조절하는 구문
-- 기본적으로 오름차순 정렬(ASC)
-- 내림차순으로 정렬(DESC)
select *
from city
order by Population DESC;

select *
from city
order by CountryCode ASC, Population DESC;

select *
from city
where CountryCode = 'KOR'
order by Population DESC;

desc country;

select *
from country
order by SurfaceArea desc;

-- DISTINCT : 중복된 것은 1개씩만 보여주면서 출력
select distinct CountryCode
from city;

-- limit : 출력 개수를 제한 / 상위의 N개만 출력하는 LIMIT N 구문
select *
from city
order by Population desc
limit 10; -- 상위 10개만 보여줘

/* GROUP BY : 그룹으로 묶어주는 역할
집계함수를 함께 사용
AVG():평균
MIN():최소값
MAX():최대값
COUNT():행의 개수
COUNT(DISTINCT):중복 제외된 행의 개수
STDEV():표준 편차
VARIANCE():분산

읽기 좋게 하기 위해 별칭(alias)사용
*/
select CountryCode, max(Population) as 'MAX' 
from city
group by CountryCode;

select count(*)
from city;

select avg(Population)
from city;

-- HAVING : where과 비슷한 개념으로 조건 제한
-- 집계 함수에 대해서 조건 제한하는 편리한 개념
-- HAVING절은 반드시 GROUP BY절 다음에 나와야함
select CountryCode, max(population)
from city
group by CountryCode
having max(Population) > 8000000;

-- ROLLUP : 총합 또는 중간합계가 필요한 경우 사용
-- GROUP BY절과 함께 with rollup문 사용
-- 각각의 모든 집계를 보여줌
select CountryCode, Name, sum(population)
from city
group by CountryCode, Name with rollup;

-- JOIN : 데이터베이스 내의 여러 테이블에서 가져온 레코드를 조합하여
-- 하나의 테이블이나 결과 집합으로 표현
select *
from city
join country on city.CountryCode = country.Code -- =국가코드
join countrylanguage ON city.CountryCode = countrylanguage.CountryCode;
-- 3개의 테이블이 join된 형태로 나옴

-- MySQL 내장함수 : 사용자의 편의를 위해 다양한 기능의 내장 함수를 미리 정의하여 제공

-- LENGTH() : 전달받은 문자열의 길이를 반환
select length('12345141');

-- CONCAT() : 전달받은 문자열을 모두 결합하여 하나의 문자열로 반환
-- 전달받은 문자열 중 하나라도 NULL이 존재하면 NULL을 반환
select concat('My', 'sql Op', 'en Source');

-- LOCATE() : 문자열 내에서 찾는 문자열이 처음으로 나타나는 위치를 찾아서 해당 위치를 반환
-- 찾는 문자열이 문자열 내에 존재하지 않으면 0을 반환
-- MySQL에서는 문자열의 시작 인덱스를 1부터 계산
select locate('abc', 'abababababacabc');

-- LEFT() : 문자열의 왼쪽부터 지정한 개수만큼의 문자를 반환
-- RIGHT() : 문자열의 오른쪽부터 지정한 개수만큼의 문자를 반환
select left('MySQL is an open source relational database management', 5);
select right('MySQL is an open source relational database management', 5);

-- LOWER() : 문자열의 문자를 모두 소문자로 변경
-- UPPER() : 문자열의 문자를 모두 대문자로 변경
select lower('MySQL is an open source relational database management');
select upper('MySQL is an open source relational database management');

-- REPLACE() : 문자열에서 특정 문자열을 대체 문자열로 교체
select
replace('MSSQL', 'MS', 'My');

/*
TRIM() : 문자열의 앞이나 뒤, 또는 양쪽 모두에 있는 특정 문자를 제거
TRIM()함수에서 사용할 수 있는 지정자
- BOTH : 전달받은 문자열의 양 끝에 존재하는 특정 문자를 제거 (기본설정)
- LEADING : 전달받은 문자열 앞에 존재하는 특정 문자를 제거
- TRAILING : 전달받은 문자열 뒤에 존재하는 특정 문자를 제거

만약 지정자를 명시하지 않으면, 자동으로 BOTH로 설정
제거할 문자를 명시하지 않으면, 자동으로 공백을 제거
*/
select trim('       MySQL        ');
select trim('       MySQL        '),
trim(leading '#' from '###MySQL##'),
trim(trailing '#' from '###MySQL##');

-- format() : 숫자 타입의 데이터를 세 자리마다 쉼표를 사용하는 #,###,##.## 형식으로 변환
-- 반환되는 데이터의 형식은 문자열 타입
-- 두 번째 인수는 반올림할 소수 부분의 자릿수
select format(123121312.12312313, 3); -- 3개씩 끊어서

-- FLOOR() : 내림
-- CEIL() : 올림
-- ROUND() : 반올림
select floor(10.95), ceil(10.95), round(10.95);

-- SQRT() : 양의 제곱근
-- POW() : 첫 번째 인수로는 밑수를 전달하고, 두 번째 인수로는 지수를 전달하여 거듭제곱 계산
-- EXP() : 인수로 지수를 전달받아, e의 거듭제곱을 계산
-- LOG() : 자연로그 값을 계산
select sqrt(4), pow(2,3), exp(3), log(3);

-- sin() :사인값 반환
-- cos() : 코사인값 반환
-- tan() : 탄젠트값 반환
select sin(pi()/2), cos(pi()), tan(pi()/4);

-- ABS(X) : 절대값을 반환
-- RAND(): 0.0보다 크거나 같고 1.0보다 작은 하나의 실수를 무작위로 생성
select abs(-3), rand(), round(rand()*100);

/*
NOW() : 현재 날짜와 시간을 반환, 반환되는 값은 'YYYY-MM-DD HH:MM:SS'
또는 YYYYMMDDHHMMSS 형태로 반환
CURDATE() : 현재 날짜를 반환, 이때 반환되는 값은 'YYYY-MM-DD'또는 YYYYMMDD 형태로 반환
CURTIME() : 현재 시각을 반환, 이때 반환되는 값은 'HH:MM:SS'또는 HHMMSS 형태로 반환
*/
select now(), curdate(), curtime();

/*
DATE() : 전달받은 값에 해당하는 날짜 정보를 반환
MONTH() : 월에 해당하는 값을 반환하며, 0부터 12사이의 값을 가짐
DAY() : 일에 해당하는 값을 반환하며, 0부터 31사이의 값을 가짐
HOUR() : 시간에 해당하는 값을 반환하며, 0부터 23사이의 값을 가짐
MINUTE() : 분에 해당하는 값을 반환하며, 0부터 59사이의 값을 가짐
SECOND() : 초에 해당하는 값을 반환하며, 0부터 59사이의 값을 가짐
*/
select
now(), 
date(now()),
month(now()),
day(now()),
hour(now()),
minute(now()),
second(now());

-- MONTHNAME() : 월에 해당하는 이름을 반환
-- DAYNAME() : 요일에 해당하는 이름을 반환
select
now(),
monthname(now()),
dayname(now());

/*
DAYOFWEEK() : 일자가 해당 주에서 몇번째 날인지를 반환, 1부터 7사이의 값을 반환
DAYOFMONTH() : 일자가 해당 월에서 몇 번째 날인지를 반환, 0부터 31사이의 값을 반환
DAYOFYEAR() : 일자가 해당 연도에서 몇 번재 날인지를 반환, 1부터 366사이의 값을 반환
*/
select
now(),
dayofweek(now()),
dayofmonth(now()),
dayofyear(now());

-- DATE_FORMAT() : 전달받은 형식에 맞춰 날짜와 시간 정보를 문자열로 반환
select
date_format(now(), '%D %y %a %d %m %n %j');