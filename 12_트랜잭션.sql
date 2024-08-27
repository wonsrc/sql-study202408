-- ���� Ŀ�� Ȱ��ȭ ���� Ȯ��
show autocommit;
-- ���� Ŀ�� ��
set autocommit on;
-- ���� Ŀ�� ����
set autocommit off;

select * from emps
order by employee_id desc;

delete from emps where employee_id = 100;

insert into emps
    (employee_id, last_name, email, hire_date, job_id)
values
    (300, 'lee', 'abc11234@naver.com', sysdate, 'test');

-- �������� ��� ������ ��������� ��� (���)
-- ���� Ŀ�� �ܰ�� ȸ��(���ư���) �� Ʈ����� ����.
rollback;

insert into emps
    (employee_id, last_name, email, hire_date, job_id)
values
    (302, 'park', 'park11234@naver.com', sysdate, 'test');

-- ���̺� ����Ʈ ����
-- �ѹ��� ����Ʈ�� ���� �̸��� �ٿ��� ����.
-- ANSI ǥ�� ������ �ƴϱ� ������  �װ� ������� ����,
savepoint insert_kim;

rollback to savepoint insert_kim;

-- �������� ��� ������ ���� ������ ���������� �����ϸ鼭 Ʈ����� ����.
-- Ŀ�� �Ŀ��� ��� ����� ����ϴ��� �ǵ��� �� �����ϴ�.
commit;