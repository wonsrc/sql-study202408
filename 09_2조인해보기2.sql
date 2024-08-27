
select * from info;
select * from auth;

-- 이너(내부) 조인

select
    i.title, i.content, a.name, i.auth_id
from info
inner join auth a -- JOIN 이라고만 쓰면 기본 INNER JOIN
on i.auth_id = a.auth_id;

select
    i.title, i.content, a.name, i.auth_id
from info i
join auth a
on i.auth_id = a.auth_id;
-- where a.name = '이순신';

-- 아우터(외부) 조인
select 
    *
from info i left join auth a
on i.auth_id = a.auth_id;

-- 좌측 테이블과 우측 테이블 데이터를 모두 읽어 표현한느 외부 조인(풀 아우터 조인)
select 
    *
from info i full join auth a
on i.auth_id = a.auth_id;


-- CROSS JOIN  은 JOIN  조건을 설정하지 않기 때문에
-- 단순히 모든 컬럼에 대한 JOIN을 수행합니다. (실행 결과: 각 테이블의 행을 곱해주면 됨.)
-- 실제로는 거의 사용하지 않습니다. 

select * from info, auth; -- 오라클
select * from
info cross join auth;   -- 안시

-- 여러 개 테이블 조인 -> 키 값을 찾아 구문을 연결해서 쓰면 됩니다.
select 
    *
from employees e
left join departments d
on e.department_id = d.department_id
left join locations loc
on d.location_id = loc.location_id;

/*
- 테이블 별칭 a, i를 이용하여 LEFT OUTER JOIN 사용.
- info, auth 테이블 사용
- job 컬럼이 scientist인 사람의 id, title, content, job을 출력.
*/

select
    i.id, i.title, i.content,a.job
from auth a
left join info i 
on a.auth_id = i.auth_id
where a.job ='scientist';

-- SELF JOIN 동일 테이블 사이의 조인을 말합니다.
-- 동일 테이블 컬럼을 통해 기존의 존재하는 값을 매칭시켜 가져올 때 사용합니다.

-- 각 사원별 매니저의 이름을 조회
select
    e1.employee_id, e1.first_name, e1.manager_id,
    e2.first_name, e2.employee_id
from employees e1
join employees e2
on e1.manager_id = e2.employee_id
order by e1.employee_id;


-- 각 매니저가 담당하는 사원의 명수.
select
    m.employee_id as manager_id,
    m.first_name as manager_name,
    count(e.employee_id)
from employees e
join employees m
on e.manager_id = m.employee_id
group by m.employee_id, m.first_name;

-- Naturla Join
-- 동일한 이름을 갖는 컬럼들에 대해 자동으로 조인조건을 생성하는 기법입니다.
-- 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 inner join을 수행합니다.
-- 조인되는 동일 이름의 컬럼은 타입이 같아야 하며,
-- alias 나 테이블명을 자동 조인 컬럼 앞에 표기하면 안됩니다.
-- 조회하려는 컬럼에 * 을 붙이면, 공통 컬럼은 한 번만 표기됩니다.

select 
    e.employee_id, e.first_name, department_id,
    d.department_name
from employees e
natural join departments d;

-- using join
-- natural join 과는 다르게, using을 사용하면 원하는 컬럼에 대해서만 선택적 조인조건을
-- 부여할 수 있습니다.
-- USING 절에서도 조인 컬럼에 대해 ALIAS 나 테이블명을 표기하시면 안됩니다.

select 
    e.employee_id, e.first_name, department_id,
    d.department_name
from employees e
join departments d using(department_id);