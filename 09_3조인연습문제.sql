/*
���� 1.
-EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
-EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� �ּ����� �ۼ�)
*/

select
    *
from employees e
join departments d
on e.department_id = d.department_id;

select
    *
from employees e
left join departments d
on e.department_id = d.department_id; -- 107

select
    *
from employees e
right join departments d
on e.department_id = d.department_id; -- 122

select
    *
from employees e
full join departments d
on e.department_id = d.department_id; -- 123

/*
���� 2.
-EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
����)employee_id�� 200�� ����� �̸�, department_name�� ����ϼ���
����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�
*/
select
    e.first_name || ' '|| e.last_name as full_name,
    d.department_name
from employees e
join departments d
on e.department_id = d.department_id
where e.employee_id = 200;


/*
���� 3.
-EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
HINT) � �÷����� ���� ����Ǿ� �ִ��� Ȯ��
*/

select
    e.first_name, e.job_id,
    j.job_title
from employees e
join jobs j
on e.job_id = j.job_id
order by e.first_name;
/*
���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
*/
select
    *
from jobs j
left join job_history jh
on j.job_id = jh.job_id;


/*
���� 5.
--Steven King�� �μ����� ����ϼ���.
*/
select
    
    e.first_name || ' ' || e.last_name as full_name,
    d.department_name
    
from employees e
join departments d
on e.department_id =  d.department_id
where e.first_name = 'Steven'
and e.last_name = 'King';


/*
���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���
*/

select  * from employees
cross join departments;

select * from employees, departments;

/*
���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, 
�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
*/
select
    e.employee_id as �����ȣ,
    e.first_name as  �̸�,
    e.salary as  �޿�,
    d.department_name as �μ���,
    loc.city as �ٹ���
from employees e
join departments d
on e.department_id = d.department_id
join locations loc
on d.location_id = loc.location_id
where e.job_id = 'SA_MAN'
order by �����ȣ;


/*
���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� 
���� ������ ����ϼ���.
*/
select
    *
from employees e
join jobs j
on e.job_id = j.job_id
where j.job_title in ('Stock Manager', 'Stock Clerk');


/*
���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
*/
select 
    d.department_name
from departments d
left join employees e
on d.department_id = e.department_id
where e.employee_id is null;


/*
���� 10. 
-join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
*/
select
    e1.first_name,
    e2.first_name as manager_name
from employees e1
join employees e2
on e1.manager_id = e2.employee_id;


/*
���� 11. 
-- EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)id��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���.
-- �Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� �����ϼ���.
*/

select
    e1.first_name, e1.manager_id,
    e2.first_name as manager_name, e2.salary
from employees e1
left join employees e2
on e1.manager_id = e2.employee_id
where e1.manager_id is not null
order by e2.salary desc;
