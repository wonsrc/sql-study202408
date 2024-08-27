
-- 시퀀스(순차적으로 증가, 감소하는 값을 만들어 주는 기능)

create sequence test_seq
    start with 1 -- 시작값 (기본값은 증가할 때 최소값, 감소할 때 최대값)
    increment by 1 -- 증가값 (양수면 증가, 음수면 감소, 기본값 1)
    maxvalue 10 -- 최대값 (기본값은 증가일 때 1027, 감소일 때 -1)
    minvalue 1 -- 최소값 (기본값은 증가일 때 1, 감소일 때 -1028)
    nocache -- 캐시 메모리 사용 여부 (CACHE 가 기본값)
    nocycle;-- 순환 여부(NOCYCLE이 기본, 순환시킬꺼면 CYCLE)

create table test_tbl (
    test_no number(2) primary key,
    test_msg varchar2(100)
);

-- 시퀀스 사용하기 (NEXTVAL, CURRVAL)

insert into test_tbl
values(test_seq.nextval, 'test');   -- INSERT 실행 시 시퀀스의 다음 값 활용.

select * from test_tbl;

select test_seq.currval from dual; -- 현재 시퀀스의 값 확인

-- 시퀀스 속성 수정(직접 수정이 가능)
--  start wih은 수정이 불가능합니다.

alter sequence test_seq maxvalue 9999;
alter sequence test_seq increment by 10;

-- 시퀀스 값을 다시 처음으로 돌리는 방법