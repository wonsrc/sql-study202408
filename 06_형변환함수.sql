
-- 형변환 함수 TO_CHAR, TO_NUMBER, TO_DATE

-- 날짜를 문자로 TO_CHAR(값, 형식)
-- 날짜를 문자로 형 변환할 때 원하는 형식으로 날짜를 표현할 수 있습니다.
-- 날짜 포맷형식: Y - 연도, MM - 두자리 월, D - 일수
-- 시간 포맷형식: HH12 - 시(1~12), HH24 (0-23), MI - 분, SS - 초

select to_char(sysdate) from dual;
select to_char(sysdate, 'YYYY-MM-DD DY PM HH:MI:SS') from dual;
select to_char(sysdate, 'YY-MM-DD HH24:MI:SS') from dual;

-- 서식 문자와 함께 사용하고 싶은 문자는 ""로 감싸서 전달합니다.
select to_char(sysdate, 'YY"년" MM"월" DD"일"') from dual;

-- 숫자를 문자로 TO_CHAR(값, 형식)
-- 형식에서 사용하는 '9는 실제 숫자 9가 아니라 자리수를 표현하기 위한 기호입니다.
select to_char(20000,'99,999') from dual;
select to_char(20000,'L99,999') from dual;
select to_char(20000.29,'L99,999.9') from dual; -- 반올림이 지원.

select
    first_name,
    to_char(salary, '$99,999') as salary
from employees;

-- 문자를 숫자로 TO_NUMBER(값, 형식)
select '2000' + 2000 from dual; -- 자동 형 변환 ( 문자 -> 숫자)
select '$3,000' + 2000 from dual; -- 에러
-- 변환하려는 문자가 깔끔한 숫자 형태가 아니라면, 서식 문자를 이용해서 알려줘야 합니다.
select to_number('$3,300', '$9,999') + 2000 from dual;

-- 문자를 날짜로 TO_DATE( 값, 형식)
select to_date('2023-04-13') + 1 from dual;
-- 주어진 문자열을 모두 변환해야 합니다. 일부만 변환할 수 없습니다.
select to_date('2023-04-13 12:23:50', 'YYYY-MM-DD HH:MI:SS') from dual;

select to_date('2023년 04월 13일', 'YYYY"년" MM"월" DD"일"') from dual;

-- xxxx년 xx월 xx일 -> 문자열 형식으로 변환해 보세요.
-- 조회 컬럼명은 dateInfo라고 하겠습니다. dual에서 조회하세요.
select '20050102' from dual;

select 
    to_char(
    to_date('20050102','YYYYMMDD'),
    'YYYY"년"MM"월"DD"일'
    ) as dadeInfo

from dual;

--------------------------------------------------------------------------------

-- NULL 형태를 변환하는 함수 NVL(컬럼 혹은 값, 변환할 타겟값)
select
    first_name,
    NVL(commission_pct, 0) as comm_pct
from employees;

-- NULL 형태를 변환하는 함수 NVL2(타겟, null이 아닐 경우, null일 경우)
select
    first_name,
    salary,
    nvl2(
        commission_pct,
        salary + (salary * commission_pct),
        salary
     ) as 급여
from employees;

-- null 은 연산이 되지 않습니다.
select
    first_name,
    salary,
    salary + (salary * commission_pct)
from employees;

-- NULLIF(expr1, expr2)
-- 두 값이 같으면 NULL  리턴, 다르면 expr1 리턴
select
    nullif('김춘식', '김춘식')
from dual;

select
    nullif('김춘식', '라이옹')
from dual;

-- COALESCE(expr1, ...) 
-- 많은 표현식 중 NULL이 아닌 값이 최초로 발견되면 그값을 리턴
select 
    coalesce(null, null, 3000, 4000)
from dual;

-- comm_pct가 null 인 애들은 뒤에 있는 0이 적용, null이 아닌 애들은 자기의  comm_pct가 적용.
select
    first_name,
    salary + coalesce(commission_pct, 0)
from employees;

SELECT
    first_name,
    salary,
    salary + (salary * COALESCE(commission_pct, 0)) AS total
FROM employees;

-- DECODE(컬럼 혹은 표현식, 항목1, 결과1, 항목2, 결과2, ........ default) 
-- 오라클 전용 함수, 동등 비교만 가능
select
    first_name,
    job_id,
    salary,
    decode(
        job_id, 
        'IT_PROG', salary*1.1,
        'FI_MGR', salary*1.2,
        'AD_VP', salary*1.3,
        salary
    ) as result
from employees;

-- case when then end
-- ANSI 표준 구문

select
    first_name,
    job_id,
    salary,
    (case job_id
        when'IT_PROG' then salary * 1.1
        when 'FI_MGR' then salary * 1.2
        when 'AD_VP' then salary * 1.3
        when 'FI_ACCOUNT' then salary * 1.4
        else 0
    end) as result
from employees;