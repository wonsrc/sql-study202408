
-- ROW_NUMBER(): �� �׷� ������ �� �࿡ ������ ������ �ο�
-- �ߺ��� ���� �־ ������ �ߺ����� �ʽ��ϴ�.

-- partition by department_id: �μ����� �����͸� �׷�ȭ
-- order by salary desc: �� �׷� ������ �޿��� �������� ����
-- �� �Ŀ� ���������� ������ ���� �ο�.
select 
    employee_id,
    first_name,
    department_id,
    salary,
    row_number() over(partition by department_id order by salary desc) as row_num
from employees;



-- RANK() ; �� �׷캰 ������ �ο�
-- ���� �����ϸ� ���� ������ �ο�, ������ �Ǵ��پ����ϴ�. ex) 1�� �θ� -> �״��� 3��
select 
    employee_id,
    first_name,
    department_id,
    salary,
    rank() over(partition by department_id order by salary desc) as row_num
from employees;

-- DENS_RANK: RANK() �� ����������, ������ �ǳʶپ����� ����
-- ex) 1�� �θ�? -> ������ 2��.
select 
    employee_id,
    first_name,
    department_id,
    salary,
    dense_rank() over(partition by department_id order by salary desc) as row_num
from employees;



-- LEAD() :  ���� �� ������ ���� ������.
select 
    employee_id,
    first_name,
    department_id,
    salary,
    lead(salary, 1) over(order by salary) as next_salary,
    lead(salary, 1) over(order by salary) - salary as salary_diff
from employees;

-- LAG() : ���� �࿡ �ִ� ���� �ҷ���.
select 
    employee_id,
    first_name,
    department_id,
    salary,
    LAG(salary, 1) over(order by salary) as next_salary
from employees;

-- first_value(�÷�)  : �÷��� ù��° ���� ���� ��ȯ�մϴ�.
select 
    employee_id,
    first_name,
    department_id,
    salary,
    first_value(salary) over(partition by department_id order by salary desc) as �μ����ְ�޿�
from employees;

-- LAST_VALUE(salary) : �� �μ��� ���� �����޿��� ��������.
-- LAST_VALUE �� �⺻������ ���� �࿡�� ������ ���� �� ������ ���� �������Ƿ�
-- ��ü ������ Ȯ���� �ֱ� ���ؼ� rows between �� ����մϴ�.
-- ���� ���� ������ ���� �ƴ� ���� ������ �׷����� ������ ������ Ȯ���ϱ� ���� �߰�.

select 
    employee_id,
    first_name,
    department_id,
    salary,
    last_value(salary) over
    (partition by department_id 
    order by salary desc
    rows between UNBOUNDED PRECEDING and UNBOUNDED following)as �μ��������޿�
from employees;

-- NTILE(N) : �����͸� N���� �׷����� �����µ� ����ϴ� �Լ�
-- ex) ��ü ���� 10�̰�, NTILE(4) -> 4���� �׷����� �����ش�.
-- 11 22 33 44 -> �������� ���� ���������� �Ѱ��� -. 111 222 33 44

select 
    employee_id,
    first_name,
    department_id,
    salary,
    ntile(3) over(partition by department_id order by salary desc) as ntile_2
from employees;
