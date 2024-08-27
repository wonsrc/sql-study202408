
-- ROLLUP(arg1, arg2) -> art1과 arg2로 그룹화 -> 각 그룹별 합계 sum(salary)
-- -> arg1 그룹의 sum(salary) -> 마지막에는 전체 sum(salary),  첫번째 매개값 주로
--> 특정 컬럼들의 단계적 합계를 계산.
-- 부서별 급여 합계
-- 부서와 직무 조합별 급여 합계
-- 전체 급여 합계

select 
    department_id, job_id, sum(salary) as total_salary
from employees
group by rollup(department_id, job_id);

-- CUBE(arg1, arg2) : 모든 가능한 조합을 고려하여 집계. 둘다
-- 직무별 급여 합계
-- 부서별 급여 합계
-- 부서와 직무 조합별 급여 합계
-- 전체 급여 합계
select 
    department_id, job_id, sum(salary) as total_salary
from employees
group by cube(department_id, job_id);

-- grouping sets(arg1, arg) : 주어진 그룹 집합에 대해서만 집계, 전달한것만
-- 직무별 급여 합계
-- 부서별 급여 합계

select 
    department_id, job_id, sum(salary) as total_salary
from employees
group by grouping sets(department_id, job_id);


-- GROUPING(): 이 함수가 직접 그룹 집계를 하지는 않음.
-- 결과에서 특정 열이 집계가 되었는지의 여부를 확인하여 값을 입의로 집어 넣을때 사용.
-- rollup, cube, grouping sets에서 모두 사용 가능.
SELECT
    CASE GROUPING(department_id) WHEN 1 THEN 9999 ELSE department_id END AS dept_id, 
    CASE GROUPING(job_id) WHEN 1 THEN '해당job의합계' ELSE job_id END AS job_id, 
    SUM(salary) AS total_salary
FROM employees
where department_id is not null
GROUP BY cube (department_id, job_id);