
-- ������(���������� ����, �����ϴ� ���� ����� �ִ� ���)

create sequence test_seq
    start with 1 -- ���۰� (�⺻���� ������ �� �ּҰ�, ������ �� �ִ밪)
    increment by 1 -- ������ (����� ����, ������ ����, �⺻�� 1)
    maxvalue 10 -- �ִ밪 (�⺻���� ������ �� 1027, ������ �� -1)
    minvalue 1 -- �ּҰ� (�⺻���� ������ �� 1, ������ �� -1028)
    nocache -- ĳ�� �޸� ��� ���� (CACHE �� �⺻��)
    nocycle;-- ��ȯ ����(NOCYCLE�� �⺻, ��ȯ��ų���� CYCLE)

create table test_tbl (
    test_no number(2) primary key,
    test_msg varchar2(100)
);

-- ������ ����ϱ� (NEXTVAL, CURRVAL)

insert into test_tbl
values(test_seq.nextval, 'test');   -- INSERT ���� �� �������� ���� �� Ȱ��.

select * from test_tbl;

select test_seq.currval from dual; -- ���� �������� �� Ȯ��

-- ������ �Ӽ� ����(���� ������ ����)
--  start wih�� ������ �Ұ����մϴ�.

alter sequence test_seq maxvalue 9999;
alter sequence test_seq increment by 10;

-- ������ ���� �ٽ� ó������ ������ ���