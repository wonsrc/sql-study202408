-- ����Ŭ �ּ��Դϴ�.
/*
���� �� �ּ��Դϴ�.

ȣȣȣ~
*/

-- select [�÷���( ���� �� ����)] |  FROM [���̺� �̸�]

SELECT
    *
FROM
    employees;

SELECT 
    employee_id, first_name, last_name
FROM
    employees;

SELECT email, phone_number,hire_date
from employees;

-- �÷��� ��ȸ�ϴ� ��ġ���� ��� ������ �����մϴ�.
select
    employee_id,
    first_name,
    last_name,
    salary + salary * 0.1 as �������Ա޿�
    
from employees;

-- NULL ���� Ȯ�� (���� 0�̳� ������� �ٸ� �����Դϴ�.)
SELECT 
department_id, commission_pct
FROM employees;

-- alias(�÷���, ���̺���� �̸��� �����ؼ� ��ȸ�մϴ�.)
select
    first_name as �̸�,
    last_name as ��,
    salary as �޿�
from employees;

/*
����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ�, ���ڿ� �ȿ� Ȭ����ǥ Ư����ȣ��
ǥ���ϰ� �ʹٸ� ''�� �� �� �������� ���ø� �˴ϴ�.
���ڿ� �����ȣ�� || �Դϴ�. ���ڿ��� ���� ������ ������� �ʽ��ϴ�.
*/

select  
    first_name || ''|| last_name || '''s salary is $' || salary as �ϼ��ȹ���
    
from employees;


-- DISTINCT (�ߺ� ���� ����)
select distinct
    department_id
from employees;

-- ROWNUM, ROWID
-- (**�ο��: ������ ���� ��ȯ�Ǵ� �� ��ȣ�� ǥ��)
-- (�ο���̵�: �����ͺ��̽� ���� ���� �ּҸ� ��ȯ)
select 
    rownum, rowid, employee_id
from employees;


