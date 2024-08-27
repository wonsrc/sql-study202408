-- 오토 커밋 활성화 여부 확인
show autocommit;
-- 오토 커밋 온
set autocommit on;
-- 오토 커밋 오프
set autocommit off;

select * from emps
order by employee_id desc;

delete from emps where employee_id = 100;

insert into emps
    (employee_id, last_name, email, hire_date, job_id)
values
    (300, 'lee', 'abc11234@naver.com', sysdate, 'test');

-- 보류중인 모든 데이터 변경사항을 취소 (폐기)
-- 직전 커밋 단계로 회귀(돌아가기) 및 트랜잭션 종료.
rollback;

insert into emps
    (employee_id, last_name, email, hire_date, job_id)
values
    (302, 'park', 'park11234@naver.com', sysdate, 'test');

-- 세이브 포인트 생성
-- 롤백할 포인트를 직접 이름을 붙여서 지정.
-- ANSI 표준 뭄법은 아니기 때문에  그게 권장되지 않음,
savepoint insert_kim;

rollback to savepoint insert_kim;

-- 보류중인 모든 데이터 변경 사항을 영구적으로 적용하면서 트랜잭션 종료.
-- 커밋 후에는 어떠한 방법을 사용하더라도 되돌릴 수 없습니다.
commit;