
select * from info;
select * from auth;

-- �̳�(����) ����

select
    i.title, i.content, a.name, i.auth_id
from info
inner join auth a -- JOIN �̶�� ���� �⺻ INNER JOIN
on i.auth_id = a.auth_id;

select
    i.title, i.content, a.name, i.auth_id
from info i
join auth a
on i.auth_id = a.auth_id;
-- where a.name = '�̼���';

-- �ƿ���(�ܺ�) ����
select 
    *
from info i left join auth a
on i.auth_id = a.auth_id;

-- ���� ���̺�� ���� ���̺� �����͸� ��� �о� ǥ���Ѵ� �ܺ� ����(Ǯ �ƿ��� ����)
select 
    *
from info i full join auth a
on i.auth_id = a.auth_id;


-- CROSS JOIN  �� JOIN  ������ �������� �ʱ� ������
-- �ܼ��� ��� �÷��� ���� JOIN�� �����մϴ�. (���� ���: �� ���̺��� ���� �����ָ� ��.)
-- �����δ� ���� ������� �ʽ��ϴ�. 

select * from info, auth; -- ����Ŭ
select * from
info cross join auth;   -- �Ƚ�

-- ���� �� ���̺� ���� -> Ű ���� ã�� ������ �����ؼ� ���� �˴ϴ�.
select 
    *
from employees e
left join departments d
on e.department_id = d.department_id
left join locations loc
on d.location_id = loc.location_id;

/*
- ���̺� ��Ī a, i�� �̿��Ͽ� LEFT OUTER JOIN ���.
- info, auth ���̺� ���
- job �÷��� scientist�� ����� id, title, content, job�� ���.
*/

select
    i.id, i.title, i.content,a.job
from auth a
left join info i 
on a.auth_id = i.auth_id
where a.job ='scientist';

-- SELF JOIN ���� ���̺� ������ ������ ���մϴ�.
-- ���� ���̺� �÷��� ���� ������ �����ϴ� ���� ��Ī���� ������ �� ����մϴ�.

-- �� ����� �Ŵ����� �̸��� ��ȸ
select
    e1.employee_id, e1.first_name, e1.manager_id,
    e2.first_name, e2.employee_id
from employees e1
join employees e2
on e1.manager_id = e2.employee_id
order by e1.employee_id;


-- �� �Ŵ����� ����ϴ� ����� ���.
select
    m.employee_id as manager_id,
    m.first_name as manager_name,
    count(e.employee_id)
from employees e
join employees m
on e.manager_id = m.employee_id
group by m.employee_id, m.first_name;

-- Naturla Join
-- ������ �̸��� ���� �÷��鿡 ���� �ڵ����� ���������� �����ϴ� ����Դϴ�.
-- ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� inner join�� �����մϴ�.
-- ���εǴ� ���� �̸��� �÷��� Ÿ���� ���ƾ� �ϸ�,
-- alias �� ���̺���� �ڵ� ���� �÷� �տ� ǥ���ϸ� �ȵ˴ϴ�.
-- ��ȸ�Ϸ��� �÷��� * �� ���̸�, ���� �÷��� �� ���� ǥ��˴ϴ�.

select 
    e.employee_id, e.first_name, department_id,
    d.department_name
from employees e
natural join departments d;

-- using join
-- natural join ���� �ٸ���, using�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ������ ����������
-- �ο��� �� �ֽ��ϴ�.
-- USING �������� ���� �÷��� ���� ALIAS �� ���̺���� ǥ���Ͻø� �ȵ˴ϴ�.

select 
    e.employee_id, e.first_name, department_id,
    d.department_name
from employees e
join departments d using(department_id);