-- ���� ������
-- ���� �ٸ� ���� ����� ����� �ϳ��� ����, ��, ���̸� ���� �� �ְ� �� �ִ� ������
-- UNION(������ �ߺ�x), UNION ALL(������ �ߺ� o), INTERSECT(������), MINUS(������)
-- �� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �մϴ�.

-- UNION -> �ߺ� �����͸� ������� ����. �ڵ����� ������ �Ͼ(ù��° �÷� ��������  default).

select 
    employee_id, first_name
from employees
where hire_date like '04%'
union
select 
    employee_id, first_name
from employees
where department_id = 20;

-- UNION ALL -> �ߺ� ������ ���
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
