
select * from employees;

-- WHERE�� �� (������ ���� ��/�ҹ��ڸ� �����մϴ�.)
select 
    first_name, last_name, job_id
from employees
WHERE job_id = 'IT_PROG';

select
    *
from employees
where last_name = 'King';

select
    *
from employees
where department_id = 50;

select 
    *
from employees
where salary > 15000 
and salary < 20000;

select 
*
from employees
where hire_date = '04/01/30';

-- �������� �� ���� ( BETWEEN , IN, LIKE)
select
    *
from employees
where salary between 15000 and 20000;

select
    *
from employees
where hire_date between '03/01/01' and '03/12/31';

-- IN �������� ��� (Ư�� ����� ���� �� ���)
select 
    *
from employees
where manager_id in(100, 101, 102);

select 
*
from employees
where job_id in ('IT_PROG', 'AD_VP');

-- LIKE  ������ (���� ���ڿ� ���� ����)
-- %�� ��� ���ڵ�, _�� �������� �ڸ�(��ġ)�� ǥ���� ��
select
    first_name,last_name, hire_date
from employees
where hire_date like '03%';

select
    first_name,last_name, hire_date
from employees
where hire_date like '%15';

select
    first_name,last_name, hire_date
from employees
where hire_date like '%05%';

select
    first_name,last_name, hire_date
from employees
where hire_date like '___05%';

-- IS NULL : (null ���� ã��)
select 
    *
from employees
where commission_pct is null;

select 
    *
from employees
where commission_pct is not null;

-- AND, OR
-- ANR�� OR ���� ���� ������ ����.
select
    *
from employees
where job_id = 'IT_PROG'
or job_id = 'FI_MGR'
and salary >= 6000;

select
    *
from employees
where (job_id = 'IT_PROG'
or job_id = 'FI_MGR')
and salary >= 6000;

-- �������� ���� (SELECT ������ ���� �������� ��ġ�˴ϴ�.)
-- ASC : ������(ascending)
-- DESC : ������(descending)

select
    *
from employees
order by hire_date DESC;

select 
    *
from employees
where job_id = 'IT_PROG'
order by first_name asc;

select 
    first_name,
    salary * 12 as pay
from employees
order by pay desc;