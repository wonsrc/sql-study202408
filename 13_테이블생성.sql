/*
- NUMBER(2) -> ������ 2�ڸ����� ������ �� �ִ� ������ Ÿ��.
- NUMBER(5, 2) -> ������, �Ǽ��θ� ��ģ �� �ڸ��� 5�ڸ�, �Ҽ��� 2�ڸ�
- NUMBER -> ��ȣ�� ������ �� (38, 0)���� �ڵ� �����˴ϴ�.
- VARCHAR2(byte) -> ��ȣ �ȿ� ���� ���ڿ��� �ִ� ���̸� ����. (4000byte����)
- CLOB -> ��뷮 �ؽ�Ʈ ������ Ÿ�� (�ִ� 4Gbyte)
- BLOB -> ������ ��뷮 ��ü (�̹���, ���� ���� �� ���)
- DATE -> BC 4712�� 1�� 1�� ~ AD 9999�� 12�� 31�ϱ��� ���� ����
- ��, ��, �� ���� ����.
*/

create table dept2(
    dept_no NUMBER(2), 
    dept_name varchar2(14),
    loca varchar2(15),
    dept_date date default sysdate,
    dept_bonus number(10) default 100000
);

desc dept2;
select * from dept2;

-- NUMBER�� VARCHAR2 Ÿ���� ���̸� Ȯ��
insert into dept2
values(30, '����','���', sysdate, 2000000.86);

-- �÷� �߰�
alter table dept2
add dept_count number(3);

-- �÷��� ����
alter table dept2
rename column dept_count to emp_count;

-- * CREATE�� ����� ��  ALTER�� �����Ѵ�.

-- �÷� �Ӽ� ����
-- ���� �����ϰ��� �ϴ� �÷��� �����Ͱ� �̹� �����Ѵٸ�, �׿� �´� Ÿ������ 
-- �����ؾ� �մϴ�. ���� ���� Ÿ�����δ� ������ �Ұ����մϴ�.
alter table dept2
modify dept_no number(4);

-- DDL(CREATE, ALTER, TRUNCATE, DROP) �� Ʈ������� ����� �ƴմϴ�,
-- DML (INSERT, UPDATE, DELETE) ���� DDL�� �����ϸ� COMMIT�� �ڵ����� ���ϴ�.
rollback;

-- �÷� ����
alter table dept2
drop column dept_bonus;

select * from dept3;

-- ���̺� �̸� ����
alter table dept2
rename to dept3;

-- ���̺� ����(������ ���ܵΰ� ���� �����͸� ��� ����)
TRUNCATE TABLE dept3;

-- ���̺� ����
drop table dept3;















