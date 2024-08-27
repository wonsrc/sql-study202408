-- 테이블 생성과 제약조건
-- : 테이블에 부적절한 데이터가 입력되는 것을 방지하기 위해 규칙을 설정하는 것.

-- 테이블 열레벨 제약조건 (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: 테이블의 고유 식별 컬럼입니다. (주요 키) 중복X, NULL X
-- UNIQUE: 유일한 값을 갖게 하는 컬럼 (중복값 방지), NULL 인정
-- NOT NULL: null을 허용하지 않음. (필수값)
-- FOREIGN KEY: 참조하는 테이블의 PRIMARY KEY를 저장하는 컬럼
-- CHECK: 정의된 형식만 저장되도록 허용.

-- 컬럼 레벨 제약 조건(컬럼 선언마다 제약조건 지정)
create table dept2(
    -- 제약조건 식별자는 생략이 가능합니다. (오라믈케어 알아서 이름 지음)
    dept_no number(2) constraint dept2_deptno_pk primary key, 
    dept_name varchar(14) not null constraint dept2_deptname_uk unique,
    loca number(4) constraint dept2_loca_locid_fk references locations(location_id),
    dept_bonus number(10) constraint dept2_bonus_ck check(dept_bonus > 10000),
    dept_gender varchar2(1) constraint dept2_gender_ck check(dept_gender in('M', 'F'))
);

drop table dept2;

-- 테이블 레벨 제약 조건 (모든 열 선언 후 제약 조건을 취하는 방식)

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

-- 외래 키(foreign key)가 부모테이블(참조테이블)에 없다면 INSERT가 불가능.
insert into dept2
values (10, 'gg', 6542, 90000, 'M');

insert into dept2
values (20, 'hh', 1900, 90000, 'M');

select * from dept2;

update dept2
set loca = 4000
where dept_no = 10; -- 실패 (외래키 제약조건 위반)

update detp2
set dept_no = 20;
where dept_no = 10; -- 실패(pk 제약조건위반)

update detp2
set dept_bonus = 900;
where dept_no = 10; -- 실패(check 제약조건 위반)

-- 테이블 생성 이후 제약조건 추가 및 변경, 삭제
-- 제약조건은 추가, 삭제만 가능합니다, 변경은 안됩니다.
-- 변경하려면 삭제하고 새로운내용으로 추가하면 됩니다.

create table dept2(
    dept_no number(2), 
    dept_name varchar(2) not null,
    loca number(4),
    dept_bonus number(10),
    dept_gender varchar2(1)
);
-- pk  추가
alter table dept2
add CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no);

-- UNIQUE 추가
alter table dept2
add CONSTRAINT dept2_deptname_uk UNIQUE(dept_name);

-- FK 추가
alter table dept2
add CONSTRAINT dept2_loca_locid_fk 
FOREIGN KEY(loca) REFERENCES locations(location_id);

-- CHECK  추가
alter table dept2
add CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000);

alter table dept2
add CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'));

-- NOT NULL은 열 수정 형태로 변경합니다.
alter table dept2
modify dept_bonus number(10) not null;

-- 제약 조건 확인
select * from user_constraints
where table_name = 'DEPT2';

-- 제약 조건 삭제 ( 제약 조건의 이름으로 -> 이름을 직접 짓지 않았다면 오라클이 부여한 이름을 제시)
alter table dept2 drop constraint dept2_bonus_ck;