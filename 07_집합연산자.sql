-- 집합 연산자
-- 서로 다른 쿼리 결과의 행들을 하나로 결합, 비교, 차이를 구할 수 있게 해 주는 연산자
-- UNION(합집합 중복x), UNION ALL(합집합 중복 o), INTERSECT(교집합), MINUS(차집합)
-- 위 아래 column 개수와 데이터 타입이 정확히 일치해야 합니다.

-- UNION -> 중복 데이터를 허용하지 않음. 자동으로 정렬이 일어남(첫번째 컬럼 오름차가  default).

select 
    employee_id, first_name
from employees
where hire_date like '04%'
union
select 
    employee_id, first_name
from employees
where department_id = 20;

-- UNION ALL -> 중복 데이터 허용
select 
    employee_id, first_name
from employees
where hire_date like '04%'
union all
select 
    employee_id, first_name
from employees
where department_id = 20;

select 
    employee_id, first_name
from employees
where hire_date like '04%'
intersect
select 
    employee_id, first_name
from employees
where department_id = 20;

select 
    employee_id, first_name
from employees
where hire_date like '04%'
minus
select 
    employee_id, first_name
from employees
where department_id = 20;


select 
    employee_id, first_name
from employees
where department_id = 20
minus
select 
    employee_id, first_name
from employees
where hire_date like '04%'
