/*
# �����̶�?

- ���� �ٸ� ���̺� ���� ������ ���谡 �����Ͽ�
 1�� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���ؼ� ����մϴ�.
- SELECT �÷�����Ʈ FROM ���δ���� �Ǵ� ���̺� (1�� �̻�)
  WHERE ���� ���� (����Ŭ ���� ����)
*/

-- employees  ���̺��� �μ� id�� ��ġ�ϴ� departments ���̺��� �μ� id�� ã�Ƽ�
-- �μ� �̸��� ��ȸ����.

select 
    e.first_name,
    e.department_id,
    d.department_name
from employees e, departments d
where e.department_id = d.department_id; -- ����Ŭ ���� ����

select 
    e.first_name,
    e.department_id,
    d.department_name
from employees e 
inner join  departments d
on e.department_id = d.department_id; -- ANSO ǥ�� ���� ����

/*
������ ���̺� ���������� �����ϴ� �÷��� ��쿡��
���̺� �̸��� �����ص� �����մϴ�. �׷���, �ؼ��� ��Ȯ���� ����
���̺� �̸��� �ۼ��ϼż� �Ҽ��� ǥ���� �ִ� ���� �ٶ����մϴ�.
���̺� �̸��� �ʹ� �� �ÿ��� ALIAS�� �ۼ��Ͽ� Ī�մϴ�.
�� ���̺� ��� ������ �ִ� �÷��� ��� �ݵ�� ����� �ּž� �մϴ�.
*/

-- 3���� ���̺��� �̿��� ���� ����(INNER JOIN)
-- ��������: ���� ���ǿ� ��ġ���� �ุ ��ȯ�ϴ� ����
-- ���� ���ǿ� ��ġ���� ���� �����ʹ� ��ȸ ��󿡼� ����.

select
    e.first_name, e.department_id, e.job_id,
    d.department_name,
    j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;




select
    e.first_name, e.department_id, e.job_id,
    d.department_name,
    j.job_title,
    loc.city
from 
    employees e, 
    departments d, 
    jobs j, 
    locations loc
where e.department_id = d.department_id
and e.job_id = j.job_id
and d.location_id = loc.location_id
and loc.state_province = 'California'; -- �Ϲ� ������ ���� ���� ���Ŀ� �ۼ��� �ݴϴ�.

-- �ܺ� ����
/*
��ȣ ���̺��� ��ġ�Ǵ� ������ ����Ǵ� ���� ���ΰ��� �ٸ���
��� �� ���̺� ���� ���� ������ �ش� row���� ��ȸ �����
��� ���ԵǴ� ������ ���մϴ�.
*/

select 
    e.first_name,
    d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

-- �ܺ� ���� ���� �� ��� ���ǿ� (+)�� �ٿ��� �ϸ�
-- �Ϲ� ���ǿ��� (+)�� ������ ������ �����Ͱ� �����Ǵ� ������ �߻�.

SELECT
    e.employee_id, e.first_name,
    jh.start_date, jh.end_date, jh.job_id
FROM employees e, job_history jh
WHERE e.employee_id = jh.employee_id(+)
AND jh.department_id(+) = 80;


































