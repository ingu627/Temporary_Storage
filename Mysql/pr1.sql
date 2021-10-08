SHOW DATABASES; -- mysql서버에 database 보여줘 


-- 단일 주석
-- /* */ 멀티 주석

--USB : 사용할 데이터베이스 지정 
--지정해 놓은 후 특별히 다시 USE문 사용하거나 다른 DB를 사용하겠다고 명시하지 않는 이상 모든 SQL문은 지정 DB에서 수행
use world;

SHOW TABLES; --데이터베이스 world의 테이블 이름 보기

SHOW TABLE STATUS; 
-- : 데이터베이스 WORLD의 테이블 정보 조회

DESCRIBE city; 
--city 테이블에 무슨 열이 있는지 확인 
--또는 DESC

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
