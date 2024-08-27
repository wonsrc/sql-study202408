/*
# �������� 
: SQL ���� �ȿ� �Ǵٸ� SQL�� �����ϴ� ���.
 ���� ���� ���Ǹ� ���ÿ� ó���� �� �ֽ��ϴ�.
 WHERE, SELECT, FROM ���� �ۼ��� �����մϴ�.

- ���������� ������� () �ȿ� �����.
 ������������ �������� 1�� ���Ͽ��� �մϴ�.
- �������� ������ ���� ����� �ϳ� �ݵ�� ���� �մϴ�.
- �ؼ��� ���� ���������� ���� ���� �ؼ��ϸ� �˴ϴ�.
*/

-- �̸��� 'Nancy' �� ������� �޿��� ���� ����� ��ȸ�ϱ�.

select 
    salary
from employees
where first_name = 'Nancy';

select first_name from employees
where salary > 12008;

-- ���������� Ȱ���� ����
select first_name from employees
where salary > (select salary from employees
                where first_name = 'Nancy');

-- employee_id�� 103���� �����  job_id�� ������ job_id�� ���� ����� ��ȸ
select
    *
from employees
where job_id = (select 
    job_id
from employees 
where employee_id = 103);


--  ���� ������ ���������� �����ϴ� ���� ���� ���� ���� �� �����ڸ� ����� �� �����ϴ�.
-- ���� �� ������ �� �ַ� �� ������( = , > , <, >=, <= <>)�� ����ϴ� ��� �ϳ��� �ุ ��ȯ�ؾ� �մϴ�.
-- �̷� ��쿡�� ���� �� �����ڸ� ����ؾ� �մϴ�.

select * from employees
where job_id = (select job_id from employees
                where last_name = 'King');
                
-- ���� �� ������ (IN, ANY, ALL, EXIST)

-- IN: ��ȸ�� ����� � ���� �������� ��.
-- ex) salary In (200, 300, 400)
--                250 -> false
select * from employees
where job_id  IN (select job_id from employees
                where last_name = 'King');
                

                
-- first_name�� David�� ������� �޿��� ���� �޿��� �޴� ������� ��ȸ.
select * from  employees
where salary in (select salary from employees 
                where first_name = 'David');
                
-- ANY, SOME : ���� ���������� ���� ���ϵ� ������ ���� ���ؼ� 
-- �ϳ��� �����ϸ� ��ȸ��� ���Ե˴ϴ�.
-- ex) salary ANY (200, 300, 400)
--                250 -> true

select * from employees
where salary > any(select salary from employees 
                where first_name = 'David');
                
-- ALL ���� ���������� ���� ���ϵ� ������ ���� ���ؼ�
-- ���� �� ��ġ�ؾ� ��ȸ��� ���Ե˴ϴ�.
-- ex) salary ALL (200, 300, 400)
--                250 -> false, 200 ���ٴ� ũ���� 300, 400 ���ٴ� ũ�� �����Ƿ�,

select * from employees
where salary > ALL(select salary from employees 
                where first_name = 'David');
                
-- EXISTS: ���������� �ϳ� �̻��� ���� ��ȯ�ϸ� ������ ����.
-- job_history�� �����ϴ� ������ employees���� �����Ѵٸ� ��ȸ ��� ����.
-- �������� ������ jh�� �ִ� id�� e�� �ִ� id�� ��ġ�� ������ 1�̶�� ���� ��ȸ
-- exists �����ڰ� 1�� ��ȸ��  �ɶ� �����Ͱ� �����Ѵٴ� ���� �Ǵ��Ͽ� 
-- employees ���� �ش� ����� ��� Į���� ��ȸ
select * from employees e
where exists (select 1 from job_history jh
             where e.employee_id = jh.employee_id);

--------------------------------------------------------------------------------
-- select ���� �������� ���̱�,
-- ��Į�� �������� ���ڵ� �մϴ�.
-- ��Į�� �������� : ���� ����� ���� ���� ��ȯ�ϴ� ��������, �ַ� select, where ������ ����

select 

from employuees e
left djoin departments d
on e.departmen_i id= d.department_id
order by .e.first_name;

select 
e.first_name;
    (
        select      
            d.department_name
            from departmensts d
            where d.department_id = e.department_id)
    )as department_name;
from employees e
order by e.first_name;


/*
# ��Į�� �������� vs left join
a. ������ ��Ȳ���� ����ϸ� ������ �������̰� �����մϴ�.
b. ���� ���� ��ȯ�ϴ� ������������ ����
c. �뷮 �����Ͱ� �ƴ� ��쳪, ���������� ���⵵�� ���� ��� ����.

1. �뷮 �����͸� ó���ϰų�, ���� Į���� �ٿ��� �ҋ� �����մϴ�.
2. ���� ���̺��� �� ���� �����ؾ� �� ���.
3. ���߰� ó�� �� �ߺ� �����Ͱ� �ִ� ��� ���ɻ� �� �� ����.
*/

-- �� �μ��� ����� �̱�(�μ���,�����)
select
    d.department_name,
    count(*) as  �����
from departments d
left join employees e
on d.department_id = e.department_id
group By  d.department_name
order by  ����� desc;

select 
    d.department_name,
    (select count(*)
    from employees e
    where e.department _id = d.department_id
    group by department_id) as �����
    from departments d

select * from departments;

select count(*)
from employees e
where e.department _id = 400
group by department_id;

--------------------------------------------------------------------------------

-- from�� ��������(�ζ��� ��)
-- Ư�� ���̺���ü�� �ƴ�  select�� ���� �Ϻ� �����͸� 
-- ��ȸ�� ���� ���� ���̺�� ����ϰ� ������,
-- ������ ���س��� ��ȸ �ڷḦ ������ �����ؼ� ������ ���� ���

/*
���� ���� SELECT ������ �ʿ��� ���̺� ����(�ζ��� ��)�� ����.
�ٱ��� SELECT ������ ROWNUM�� �ٿ��� �ٽ� ��ȸ
���� �ٱ��� SELECT �������� �̹� �پ��ִ� ROWNUM�� ������ �����ؼ� ��ȸ.

** SQL�� ���� ����
FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
*/
-- 
select *
from
    (
    select 
        rownum as rn, tbl.*
    from
        (
        select 
            employee_id, first_name, salary
        from employees
        order by salary desc
        )tbl
    )
where rn > 10 and rn <= 20;

select
    e.employee_id, e.salary,
    tbl.average_salary
from employees e join 
(select 
    department_id,
    trunc(avg(salary), 0) as average_salary
from employees
group by department_id) tbl
on e.department_id = tbl.department_id;
    
