

-- INSERT
-- ���̺� ���� Ȯ��
DESC departments;

-- INSERT�� ù��° ���(��� �÷� �����͸� �� ���� �����ؼ� ����)
-- ���� -> �÷��� �������� �ʰ� ���� �ִ� ��쿡�� ��� ���� �� ��� �Ѵ�.
INSERT INTO departments
values(300, '���ߺ�');

select * from departments;
ROLLBACK;   -- ���� ������ �ٽ� �ڷ� �ǵ����� Ű����.

-- INSERT�� �ι�° ���(���� �÷��� �����ϰ� ����, NOT NULL �÷� Ȯ��!)
INSERT INTO departments
    (department_id, department_name)
values
    (301, '������');

-- �纻 ���̺� ����
-- �纻 ���̺��� ������ �� �׳� �����ϸ� -> ��ȸ�� �����ͱ��� ��� ����
-- WHERE���� false��(1 = 2) �����ϸ� -> ���̺��� ������ ����ǰ� �����ʹ� ���� x
-- CTAS���� �÷��� ������ �����͸� ������ ��, ��������(PK, FK...)�� �������� �ʽ��ϴ�.
CREATE TABLE emps AS
(select employee_id, first_name, job_id, hire_date
from employees where 1 = 2);

select * from emps;
drop table emps;

desc emps;

-- INSERT (��������)
INSERT INTO emps
(select employee_id, first_name, job_id, hire_date
from employees where department_id = 50);

select * from emps;

--------------------------------------------------------------------------------

-- UPDATE
-- UPDATE ���̺��̸� SET �÷� = ��, �÷� = ��...... WHERE ������ ��������(����)

-- UPDATE�� ������ ���� ������ ������ �� �������� �� �����ؾ� �մϴ�.
-- �׷��� ������ ���� ����� ���̺� ��ü�� �����˴ϴ�.

CREATE TABLE emps as
(select * from employees);
UPDATE emps
SET salary = 30000;
rollback;

UPDATE emps
SET salary = 30000
where employee_id = 100;

UPDATE emps
set phone_number = '010-1234-5678',
manager_id = 102,
salary = salary + salary * 0.1
where employee_id = 100;

-- UPDATE (��������)
UPDATE emps
SET (job_id, salary, manager_id) = 
    (select 
        job_id, salary, manager_id
    from emps
    where employee_id = 100)
where employee_id = 101;

select * from emps;

------------------------------------------------------------------------

-- DELETE 
-- DELETE�� WHERE �������� ������ ���̺� ��ü ���� ����� �˴ϴ�.
DELETE from emps
where employee_id =103;


-- DELETE (��������)
delete from emps
where department_id = (select department_id from departments
                        where department_name = 'IT');
