
-- ROLLUP(arg1, arg2) -> art1�� arg2�� �׷�ȭ -> �� �׷캰 �հ� sum(salary)
-- -> arg1 �׷��� sum(salary) -> ���������� ��ü sum(salary),  ù��° �Ű��� �ַ�
--> Ư�� �÷����� �ܰ��� �հ踦 ���.
-- �μ��� �޿� �հ�
-- �μ��� ���� ���պ� �޿� �հ�
-- ��ü �޿� �հ�

select 
    department_id, job_id, sum(salary) as total_salary
from employees
group by rollup(department_id, job_id);

-- CUBE(arg1, arg2) : ��� ������ ������ ����Ͽ� ����. �Ѵ�
-- ������ �޿� �հ�
-- �μ��� �޿� �հ�
-- �μ��� ���� ���պ� �޿� �հ�
-- ��ü �޿� �հ�
select 
    department_id, job_id, sum(salary) as total_salary
from employees
group by cube(department_id, job_id);

-- grouping sets(arg1, arg) : �־��� �׷� ���տ� ���ؼ��� ����, �����Ѱ͸�
-- ������ �޿� �հ�
-- �μ��� �޿� �հ�

select 
    department_id, job_id, sum(salary) as total_salary
from employees
group by grouping sets(department_id, job_id);


-- GROUPING(): �� �Լ��� ���� �׷� ���踦 ������ ����.
-- ������� Ư�� ���� ���谡 �Ǿ������� ���θ� Ȯ���Ͽ� ���� ���Ƿ� ���� ������ ���.
-- rollup, cube, grouping sets���� ��� ��� ����.
SELECT
    CASE GROUPING(department_id) WHEN 1 THEN 9999 ELSE department_id END AS dept_id, 
    CASE GROUPING(job_id) WHEN 1 THEN '�ش�job���հ�' ELSE job_id END AS job_id, 
    SUM(salary) AS total_salary
FROM employees
where department_id is not null
GROUP BY cube (department_id, job_id);