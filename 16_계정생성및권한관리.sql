
-- 사용자 계정 확인
select * from all_users;

-- 계정 생성 명령
create user user1 identified by user1;

grant create session to user1;

/*
DCL: GRANT(권한 부여), REVOKE(권한 회수)

CREATE USER -> 데이터베이스 유저 생성 권한
CREATE SESSION -> 데이터베이스 접속 권한
CREATE TABLE -> 테이블 생성 권한
CREATE VIEW -> 뷰 생성 권한
CREATE SEQUENCE -> 시퀀스 생성 권한
ALTER ANY TABLE -> 어떠한 테이블도 수정할 수 있는 권한
INSERT ANY TABLE -> 어떠한 테이블에도 데이터를 삽입하는 권한.
SELECT ANY TABLE...

SELECT ON [테이블 이름] TO [유저 이름] -> 특정 테이블만 조회할 수 있는 권한.
INSERT ON....
UPDATE ON....

- 관리자에 준하는 권한을 부여하는 구문.
RESOURCE, CONNECT, DBA TO [유저 이름]
*/

grant create session to user1;

grant select on hr.departments to user1;
grant insert on hr.departments to user1;

grant create table to user1;

grant resource, connect, dba to user1;
revoke resource, connect, dba from user1;

-- ROLE : 특정 권한들의 모음, 일괄적으로 권한을 부여하거나 회수하기 위해 사용.

create role my_team_role;

grant select, update on hr.employees to my_team_role;

grant my_team_role to user1;


