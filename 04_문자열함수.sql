-- lower(소문자), initcap(앞글자만 대문자), upper(대문자)

select * from dual;

/*
dual이라는 테이블은 sys가 소유하는 오라클의 표준 테이블로서,
오직 한 행에 한 컬럼만 담고 있는 dummy 테이블 입니다.
일시적인 산술 연산이나 날짜 연산 등에 주로 사용합니다.
모든 사용자가 접근할 수 있습니다.
*/

select
    'abcDEF',
    lower('abcDEF'),
    initcap('abcDEF'),
    upper('abcDEF')
from dual;

select
    last_name,
    lower(last_name),
    initcap(last_name),
    upper(last_name)
from employees;

select
    *
from employees
where lower(last_name) = 'austin';

-- length(길이), instr(문자 찾기, 없으면 0을 반환, 있으면 인덱스 값)
SELECT
    'abcdef', LENGTH('abcdef'), INSTR('abcdef', 'b')
FROM dual;

select
    first_name,
    length(first_name),
    instr(first_name, 'a')
from employees;

-- substr(자를 문자열, 시작인덱스, 길이)
-- substr(자를 문자열, 시작인덱스) -> 문자열 끝까지.
-- 인덱스 1부터 시작
-- concat(문자 연결)
SELECT
    'abcdef' AS ex,
    SUBSTR('abcdef', 2),
    CONCAT('abc', '123')
FROM dual;

select
    first_name,
    substr(first_name, 1, 3),
    concat(first_name, last_name)
from employees;

-- LTRIM(), RTRIM()
-- TRIM() -> 양쪽 공백 제거
-- LTRIM(param1, param2) -> param2의 값을 param1에서 찾아서 제거 (왼쪽부터)
-- RTRIM(param1, param2) -> param2의 값을 param1에서 찾아서 제거 (오른쪽부터)
SELECT
    LTRIM('javascript_java', 'java')
FROM dual; 

SELECT
    RTRIM('javascript_java', 'java')
FROM dual;

SELECT TRIM('       java       ') FROM dual;


-- LPAD(), RPAD() :  좌ㅡ 우측을 지정한 문자열로 채우기
select
    lpad('abc',10,'*'),
    rpad('abc',10,'#')
from dual;


-- REPLACE(str, old, new)
SELECT
    REPLACE('My dream is a president', 'president', 'programmer')
FROM dual;

SELECT
    REPLACE(REPLACE('My dream is a president', 'president', 'programmer'), ' ', '')
FROM dual;

SELECT
    REPLACE(CONCAT('hello', 'world!'), '!', '?')
FROM dual;

