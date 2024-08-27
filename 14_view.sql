/*
view�� �������� �ڷḸ ���� ���� ����ϴ� ���� ���̺��� �����Դϴ�.
��� �⺻ ���̺�� ������ ���� ���̺��̱� ������
�ʿ��� �÷��� ������ �θ� ������ ������ ���ϴ�.
��� �������̺�� ���� �����Ͱ� ���������� ����� ���´� �ƴմϴ�.
�並 ���ؼ� �����Ϳ� �����ϸ� ���� �����ʹ� �����ϰ� ��ȣ�� �� �ֽ��ϴ�.
*/

select * from user_sys_privs; -- ���� Ȯ��

-- �ܼ� ��: �ϳ��� ���̺��� �̿��Ͽ� ������ ��
-- ���� �÷����� �Լ� ȣ�⹮, ����� �� ���� ���� ǥ�����̸� �ȵ˴ϴ�.

select
    employee_id,
    first_name || ' ' || last_name,
    job_id,
    salary
from employees
where department_id = 60;

create view view_emp as (
    select
        employee_id,
        first_name || ' ' || last_name as full_name,
        job_id,
        salary
    from employees
    where department_id = 60
);

select * from view_emp;

-- ���� ��
-- ���� ���̺��� �����Ͽ� �ʿ��� �����͸� �����ϰ� ���� Ȯ���� ���� ���. (���뼺 ����)
create view view_emp_dept_job as (
    select
        e.employee_id,
        e.first_name ||' '|| e.last_name as full_name,
        d.department_name,
        j.job_title
    from employees e
    left join departments d
    on e.department_id = d.department_id
    left join jobs j
    on e.job_id = j. job_id
)
order by e.employee_id;

-- ���� ���� ( create or replace)
-- ���� �̸����� �ش� ������ ����ϸ� �����Ͱ� ����Ǹ鼭 ���Ӱ� �����˴ϴ�.
-- ������ �������� �ʾҴٸ� ���Ӱ� create �˴ϴ�.
create or replace view view_emp_dept_job as (
    select
        e.employee_id,
        e.first_name ||' '|| e.last_name as full_name,
        d.department_name,
        j.job_title,
        e.salary
    from employees e
    left join departments d
    on e.department_id = d.department_id
    left join jobs j
    on e.job_id = j. job_id
)
order by e.employee_id;

select 
    job_title,
    avg(salary) as avg
from view_emp_dept_job
group by job_title
order by avg desc; -- SQL ������ ����������.


-- �� ����
drop  view view_emp;

/*
VIEW �� INSERT �� �Ͼ�� ��� ���� ���̺��� �ݿ��� �˴ϴ�.
�׷��� VIEW�� INSERT, UPDATE, DELETE ���� ���� ���� ������ �����ϴ�.
���� ���̺��� NOT NULL�� ��� VIEW�� INSERT �� �Ұ����մϴ�.
VIEW���� ����ϴ� �÷��� ������ ��쿡�� �ȵ˴ϴ�.
*/

select * from view_emp_dept_job;

insert into view_emp_dept_job
values(300, 'test', 'test', 'test', 10000); -- �ȵ�.



-- JOIN �� ��(���� ��)�� ��쿡�� �� ���� ������ �� �����ϴ�.
insert into view_emp_dept_job
    (employee_id, department_name, job_title, salary)
values(300,'test', 'test', 10000);


-- ���� ���̺� �÷� �� NOT NULL �÷��� �����ϰ�, �� �÷��� view���� ������ �� ���ٸ�
-- insert�� �Ұ����մϴ�.

insert into view_emp
    (employee_id, job_id, salary)
values(300, 'test', 10000);

delete from view_emp_dept_job
where employee_id = 107;

select * from view_emp;
select * from employees;

rollback;

-- WITH CHECK OPTION -> ���� ���� �÷�
-- �並 ������ �� ����� ���� �÷��� �並 ���ؼ� ������ �� ���� ���ִ� Ű����

CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT
        employee_id,
        first_name,
        last_name,
        email,
        hire_date,
        job_id,
        department_id
    FROM employees
    WHERE department_id = 60
)
WITH CHECK OPTION CONSTRAINT view_emp_test_ck;

update view_emp_test
set department_id = 100
where employee_id = 107;

drop view view_emp_test;

-- �б� ���� �� -> select�� ���, DML ������ ����.
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT
        employee_id,
        first_name,
        last_name,
        email,
        hire_date,
        job_id,
        department_id
    FROM employees
    WHERE department_id = 60
)
with read only;