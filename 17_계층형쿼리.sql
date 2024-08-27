-- ������ ���� 
-- START WITH : ������ ù �ܰ踦 ��� ������ �������� ���� ����
-- CONNECT BY PRIOR �ڽ� = �θ�  -> ������ Ž��
-- CONNECT BY �ڽ� = PRIOR �θ�  -> ������ Ž��
-- ORDER SIBLINGS BY : ���� ���������� ������ ����.

select 
     employee_id, first_name, manager_id, level, -- ������ ���̸� ��Ÿ���� Ű����
     sys_connect_by_path(first_name, '/') as ��������
from employees start with manager_id is null --������ ������ �ֻ��� �����ں��� �����ϰڴ�.
connect by prior employee_id  = manager_id; 
-- �� ������ manager_id�� ���� ������ employee_id�� ��ġ�ϴ� ��� �θ�-�ڽ� ���踦 �����ϰڴ�.

select 
     employee_id, first_name, manager_id, level, -- ������ ���̸� ��Ÿ���� Ű����
     sys_connect_by_path(first_name, '/') as ��������
from employees 
start with manager_id is null --������ ������ �ֻ��� �����ں��� �����ϰڴ�.
connect by prior employee_id  = manager_id; 
and level <= 2; -- Ư�� ���̱����� ������ Ȯ���Ҷ�
-- order siblings by first name


select 
     employee_id, first_name, manager_id, level, -- ������ ���̸� ��Ÿ���� Ű����
     sys_connect_by_path(first_name, '/') as ��������
from employees start with manager_id is null --������ ������ �ֻ��� �����ں��� �����ϰڴ�.
connect by prior employee_id  = manager_id; 
-- �� ������ manager_id�� ���� ������ employee_id�� ��ġ�ϴ� ��� �θ�-�ڽ� ���踦 �����ϰڴ�.

select
    level,
    lpad(' ', 2*(level-1)) || first_name || ' '|| last_name as �����ο�,
    employee_id, manager_id
from employees
-- start with manager_id is null
start with employee_id = 107
connect by employee_id = prior manager_id;