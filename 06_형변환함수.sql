
-- ����ȯ �Լ� TO_CHAR, TO_NUMBER, TO_DATE

-- ��¥�� ���ڷ� TO_CHAR(��, ����)
-- ��¥�� ���ڷ� �� ��ȯ�� �� ���ϴ� �������� ��¥�� ǥ���� �� �ֽ��ϴ�.
-- ��¥ ��������: Y - ����, MM - ���ڸ� ��, D - �ϼ�
-- �ð� ��������: HH12 - ��(1~12), HH24 (0-23), MI - ��, SS - ��

select to_char(sysdate) from dual;
select to_char(sysdate, 'YYYY-MM-DD DY PM HH:MI:SS') from dual;
select to_char(sysdate, 'YY-MM-DD HH24:MI:SS') from dual;

-- ���� ���ڿ� �Բ� ����ϰ� ���� ���ڴ� ""�� ���μ� �����մϴ�.
select to_char(sysdate, 'YY"��" MM"��" DD"��"') from dual;

-- ���ڸ� ���ڷ� TO_CHAR(��, ����)
-- ���Ŀ��� ����ϴ� '9�� ���� ���� 9�� �ƴ϶� �ڸ����� ǥ���ϱ� ���� ��ȣ�Դϴ�.
select to_char(20000,'99,999') from dual;
select to_char(20000,'L99,999') from dual;
select to_char(20000.29,'L99,999.9') from dual; -- �ݿø��� ����.

select
    first_name,
    to_char(salary, '$99,999') as salary
from employees;

-- ���ڸ� ���ڷ� TO_NUMBER(��, ����)
select '2000' + 2000 from dual; -- �ڵ� �� ��ȯ ( ���� -> ����)
select '$3,000' + 2000 from dual; -- ����
-- ��ȯ�Ϸ��� ���ڰ� ����� ���� ���°� �ƴ϶��, ���� ���ڸ� �̿��ؼ� �˷���� �մϴ�.
select to_number('$3,300', '$9,999') + 2000 from dual;

-- ���ڸ� ��¥�� TO_DATE( ��, ����)
select to_date('2023-04-13') + 1 from dual;
-- �־��� ���ڿ��� ��� ��ȯ�ؾ� �մϴ�. �Ϻθ� ��ȯ�� �� �����ϴ�.
select to_date('2023-04-13 12:23:50', 'YYYY-MM-DD HH:MI:SS') from dual;

select to_date('2023�� 04�� 13��', 'YYYY"��" MM"��" DD"��"') from dual;

-- xxxx�� xx�� xx�� -> ���ڿ� �������� ��ȯ�� ������.
-- ��ȸ �÷����� dateInfo��� �ϰڽ��ϴ�. dual���� ��ȸ�ϼ���.
select '20050102' from dual;

select 
    to_char(
    to_date('20050102','YYYYMMDD'),
    'YYYY"��"MM"��"DD"��'
    ) as dadeInfo

from dual;

--------------------------------------------------------------------------------

-- NULL ���¸� ��ȯ�ϴ� �Լ� NVL(�÷� Ȥ�� ��, ��ȯ�� Ÿ�ٰ�)
select
    first_name,
    NVL(commission_pct, 0) as comm_pct
from employees;

-- NULL ���¸� ��ȯ�ϴ� �Լ� NVL2(Ÿ��, null�� �ƴ� ���, null�� ���)
select
    first_name,
    salary,
    nvl2(
        commission_pct,
        salary + (salary * commission_pct),
        salary
     ) as �޿�
from employees;

-- null �� ������ ���� �ʽ��ϴ�.
select
    first_name,
    salary,
    salary + (salary * commission_pct)
from employees;

-- NULLIF(expr1, expr2)
-- �� ���� ������ NULL  ����, �ٸ��� expr1 ����
select
    nullif('�����', '�����')
from dual;

select
    nullif('�����', '���̿�')
from dual;

-- COALESCE(expr1, ...) 
-- ���� ǥ���� �� NULL�� �ƴ� ���� ���ʷ� �߰ߵǸ� �װ��� ����
select 
    coalesce(null, null, 3000, 4000)
from dual;

-- comm_pct�� null �� �ֵ��� �ڿ� �ִ� 0�� ����, null�� �ƴ� �ֵ��� �ڱ���  comm_pct�� ����.
select
    first_name,
    salary + coalesce(commission_pct, 0)
from employees;

SELECT
    first_name,
    salary,
    salary + (salary * COALESCE(commission_pct, 0)) AS total
FROM employees;

-- DECODE(�÷� Ȥ�� ǥ����, �׸�1, ���1, �׸�2, ���2, ........ default) 
-- ����Ŭ ���� �Լ�, ���� �񱳸� ����
select
    first_name,
    job_id,
    salary,
    decode(
        job_id, 
        'IT_PROG', salary*1.1,
        'FI_MGR', salary*1.2,
        'AD_VP', salary*1.3,
        salary
    ) as result
from employees;

-- case when then end
-- ANSI ǥ�� ����

select
    first_name,
    job_id,
    salary,
    (case job_id
        when'IT_PROG' then salary * 1.1
        when 'FI_MGR' then salary * 1.2
        when 'AD_VP' then salary * 1.3
        when 'FI_ACCOUNT' then salary * 1.4
        else 0
    end) as result
from employees;