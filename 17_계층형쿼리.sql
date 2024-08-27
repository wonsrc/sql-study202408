-- 계층형 쿼리 
-- START WITH : 계층의 첫 단계를 어디서 시작할 것인지의 대한 조건
-- CONNECT BY PRIOR 자식 = 부모  -> 순방향 탐색
-- CONNECT BY 자식 = PRIOR 부모  -> 역방향 탐색
-- ORDER SIBLINGS BY : 같은 레벨끼리의 정렬을 정함.

select 
     employee_id, first_name, manager_id, level, -- 계층의 깊이를 나타내는 키워드
     sys_connect_by_path(first_name, '/') as 계층구조
from employees start with manager_id is null --계층의 구조를 최상위 관리자부터 시작하겠다.
connect by prior employee_id  = manager_id; 
-- 한 직원의 manager_id가 상위 직원의 employee_id와 일치하는 경우 부모-자식 관계를 형성하겠다.

select 
     employee_id, first_name, manager_id, level, -- 계층의 깊이를 나타내는 키워드
     sys_connect_by_path(first_name, '/') as 계층구조
from employees 
start with manager_id is null --계층의 구조를 최상위 관리자부터 시작하겠다.
connect by prior employee_id  = manager_id; 
and level <= 2; -- 특정 깊이까지만 정보를 확인할때
-- order siblings by first name


select 
     employee_id, first_name, manager_id, level, -- 계층의 깊이를 나타내는 키워드
     sys_connect_by_path(first_name, '/') as 계층구조
from employees start with manager_id is null --계층의 구조를 최상위 관리자부터 시작하겠다.
connect by prior employee_id  = manager_id; 
-- 한 직원의 manager_id가 상위 직원의 employee_id와 일치하는 경우 부모-자식 관계를 형성하겠다.

select
    level,
    lpad(' ', 2*(level-1)) || first_name || ' '|| last_name as 조직인원,
    employee_id, manager_id
from employees
-- start with manager_id is null
start with employee_id = 107
connect by employee_id = prior manager_id;