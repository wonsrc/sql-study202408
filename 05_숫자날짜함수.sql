-- �����Լ�
-- ROUND(�ݿø�)
-- ���ϴ� �ݿø� ��ġ�� �Ű������� ����. ������ �ִ� �͵� ����.
SELECT
    ROUND(3.1415, 3), ROUND(45.923, 0), ROUND(45.923, -1)
FROM dual;

-- TRUNC(����)
-- ������ �Ҽ��� �ڸ������� �߶���ϴ�.
SELECT
    TRUNC(3.1415, 3), TRUNC(45.923, 0), TRUNC(45.923, -1)
FROM dual;

-- ABS (���밪)
SELECT ABS(-34) FROM dual;

-- CEIL(�ø�), FLOOR(����)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

-- MOD(������ ������ ����)
SELECT
    10 / 4, MOD(10, 4)
FROM dual;

--------------------------------------------------------------------

-- ��¥ �Լ�
-- sysdate: ��ǻ���� ���� ��¥, �ð� ������ �����ͼ� �����ϴ� Ű���� -> �ð� ����!
select sysdate from dual;
select systimestamp from dual; -- -> �� ������ �ð��� ǥ�ؽ� �������� ����.

-- ��¥ ����
select sysdate + 1 from dual;-- ���� ���� ������ ����.

-- ��¥ Ÿ�԰� ��¥ Ÿ���� ���� ������ �����մϴ�.
-- ������ ������� �ʽ��ϴ�.

select 
    first_name,
    sysdate - hire_date
from employees; 

select 
    first_name,
    (sysdate - hire_date) /7
from employees;

select 
    first_name,
    (sysdate - hire_date) / 365
from employees;

-- ��¥ �ݿø�, ����
select round(sysdate) from dual;
select round(sysdate, 'year') from dual; -- �� �������� �ݿø�
select round(sysdate, 'month') from dual; -- �� �������� �ݿø�
select round(sysdate, 'day') from dual; -- �� �������� �ݿø�(�ش� ���� �Ͽ��� ��¥)

select trunc(sysdate) from dual;
select trunc(sysdate, 'year') from dual; -- �� �������� ����
select trunc(sysdate, 'month') from dual; -- �� �������� ����
select trunc(sysdate, 'day') from dual; -- �� �������� ����(�ش� ���� �Ͽ��� ��¥)






