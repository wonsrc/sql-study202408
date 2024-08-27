-- ���̺� ������ ��������
-- : ���̺� �������� �����Ͱ� �ԷµǴ� ���� �����ϱ� ���� ��Ģ�� �����ϴ� ��.

-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�. (�ֿ� Ű) �ߺ�X, NULL X
-- UNIQUE: ������ ���� ���� �ϴ� �÷� (�ߺ��� ����), NULL ����
-- NOT NULL: null�� ������� ����. (�ʼ���)
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷�
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���.

-- �÷� ���� ���� ����(�÷� ���𸶴� �������� ����)
create table dept2(
    -- �������� �ĺ��ڴ� ������ �����մϴ�. (������ɾ� �˾Ƽ� �̸� ����)
    dept_no number(2) constraint dept2_deptno_pk primary key, 
    dept_name varchar(14) not null constraint dept2_deptname_uk unique,
    loca number(4) constraint dept2_loca_locid_fk references locations(location_id),
    dept_bonus number(10) constraint dept2_bonus_ck check(dept_bonus > 10000),
    dept_gender varchar2(1) constraint dept2_gender_ck check(dept_gender in('M', 'F'))
);

drop table dept2;

-- ���̺� ���� ���� ���� (��� �� ���� �� ���� ������ ���ϴ� ���)

create table dept2(
    dept_no number(2), 
    dept_name varchar(2) not null,
    loca number(4),
    dept_bonus number(10),
    dept_gender varchar2(1),
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no), 
    CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
    
);

-- �ܷ� Ű(foreign key)�� �θ����̺�(�������̺�)�� ���ٸ� INSERT�� �Ұ���.
insert into dept2
values (10, 'gg', 6542, 90000, 'M');

insert into dept2
values (20, 'hh', 1900, 90000, 'M');

select * from dept2;

update dept2
set loca = 4000
where dept_no = 10; -- ���� (�ܷ�Ű �������� ����)

update detp2
set dept_no = 20;
where dept_no = 10; -- ����(pk ������������)

update detp2
set dept_bonus = 900;
where dept_no = 10; -- ����(check �������� ����)

-- ���̺� ���� ���� �������� �߰� �� ����, ����
-- ���������� �߰�, ������ �����մϴ�, ������ �ȵ˴ϴ�.
-- �����Ϸ��� �����ϰ� ���ο������ �߰��ϸ� �˴ϴ�.

create table dept2(
    dept_no number(2), 
    dept_name varchar(2) not null,
    loca number(4),
    dept_bonus number(10),
    dept_gender varchar2(1)
);
-- pk  �߰�
alter table dept2
add CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no);

-- UNIQUE �߰�
alter table dept2
add CONSTRAINT dept2_deptname_uk UNIQUE(dept_name);

-- FK �߰�
alter table dept2
add CONSTRAINT dept2_loca_locid_fk 
FOREIGN KEY(loca) REFERENCES locations(location_id);

-- CHECK  �߰�
alter table dept2
add CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000);

alter table dept2
add CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'));

-- NOT NULL�� �� ���� ���·� �����մϴ�.
alter table dept2
modify dept_bonus number(10) not null;

-- ���� ���� Ȯ��
select * from user_constraints
where table_name = 'DEPT2';

-- ���� ���� ���� ( ���� ������ �̸����� -> �̸��� ���� ���� �ʾҴٸ� ����Ŭ�� �ο��� �̸��� ����)
alter table dept2 drop constraint dept2_bonus_ck;