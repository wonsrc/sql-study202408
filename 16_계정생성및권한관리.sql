
-- ����� ���� Ȯ��
select * from all_users;

-- ���� ���� ���
create user user1 identified by user1;

grant create session to user1;

/*
DCL: GRANT(���� �ο�), REVOKE(���� ȸ��)

CREATE USER -> �����ͺ��̽� ���� ���� ����
CREATE SESSION -> �����ͺ��̽� ���� ����
CREATE TABLE -> ���̺� ���� ����
CREATE VIEW -> �� ���� ����
CREATE SEQUENCE -> ������ ���� ����
ALTER ANY TABLE -> ��� ���̺� ������ �� �ִ� ����
INSERT ANY TABLE -> ��� ���̺��� �����͸� �����ϴ� ����.
SELECT ANY TABLE...

SELECT ON [���̺� �̸�] TO [���� �̸�] -> Ư�� ���̺� ��ȸ�� �� �ִ� ����.
INSERT ON....
UPDATE ON....

- �����ڿ� ���ϴ� ������ �ο��ϴ� ����.
RESOURCE, CONNECT, DBA TO [���� �̸�]
*/

grant create session to user1;

grant select on hr.departments to user1;
grant insert on hr.departments to user1;

grant create table to user1;

grant resource, connect, dba to user1;
revoke resource, connect, dba from user1;

-- ROLE : Ư�� ���ѵ��� ����, �ϰ������� ������ �ο��ϰų� ȸ���ϱ� ���� ���.

create role my_team_role;

grant select, update on hr.employees to my_team_role;

grant my_team_role to user1;


