
-- �׷� �Լ� AVG, MAX, MIN, SUM, COUNT
-- �׷�ȭ�� ���� �������� ������ �׷��� ���̺� ��ü�� �˴ϴ�.
select
    avg(salary),
    max(salary),
    min(salary),
    sum(salary),
    count(salary)
from employees;

select count(*) from employees; -- �� �� �������� ��
select count(first_name) from employees; 
select count(commission_pct) from employees; -- null�� �ƴ� ���� ��
select count(manager_id) from employees; -- null �� ī���õ��� �ʽ��ϴ�.

-- �μ����� �׷�ȭ �׷��Լ��� ���
select
    department_id,
    avg(salary)
from employees
group by department_id;

-- �׷� �Լ��� �ܵ������� ����� ���� ��ü ���̺��� �׷��� ����� ������
-- �Ϲ� �÷��� ���ÿ� ����� ���� �����ϴ�. �Ϲ� �÷��� �׷�ȭ �ؾ� �մϴ�.
select
    department_id,
    avg(salary)
from employees
group by department_id; -- ����

-- GROUP BY���� ����� �� GROUP���� ������ �ʴ� �÷��� ��ȸ�� �� �����ϴ�.
select
    job_id, 
    department_id,
    avg(salary)
from employees
group by department_id; -- ����


-- GROUP BY�� 2�� �̻� ���.
select
    job_id,
    department_id,
    avg(salary)
from employees
group by department_id,job_id;


-- GROUP BY�� ���� �׷�ȭ �Ҷ� ������ ������ ��� HAVING
-- WHERE �� �Ϲ� ������, GROUP BY �� ���� ���� ����ȴ�.

select
    department_id,
    avg(salary)
from employees
group by department_id
having sum(salary) > 100000;

select
    job_id,
    count(*)
from employees
group by job_id
having count(*) >= 5;


-- �μ� ���̴ٰ� 50 �̻��� �͵��� �׷�ȭ ��Ű��, �׷� �޿� ����� 5000 �̻� ��ȸ
SELECT
    department_id,
    avg(salary) as ��ձ޿�
from employees
where department_id >= 50
group by department_id
having avg(salary) >= 5000
order by ��ձ޿� desc;

/*
���� 1.
1-1. ��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
1-2. ��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���.
*/


/*
���� 2.
��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
(TO_CHAR() �Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.)
*/


/*
���� 3.
�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. 
�� �μ� ��� �޿��� 7000�̻��� �μ��� ����ϼ���.
*/


/*
���� 4.
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
*/