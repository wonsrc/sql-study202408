

-- INSERT
-- 테이블 구조 확인
DESC departments;

-- INSERT의 첫번째 방법(모든 컬럼 데이터를 한 번에 지정해서 삽입)
-- 에러 -> 컬럼을 지정하지 않고 값만 주는 경우에는 모든 값을 다 줘야 한다.
INSERT INTO departments
values(300, '개발부');

select * from departments;
ROLLBACK;   -- 실행 시점을 다시 뒤로 되돌리는 키워드.

-- INSERT의 두번째 방법(직접 컬럼을 지정하고 저장, NOT NULL 컬럼 확인!)
INSERT INTO departments
    (department_id, department_name)
values
    (301, '영업부');

-- 사본 테이블 생성
-- 사본 테이블을 생성할 때 그냥 생성하면 -> 조회된 데이터까지 모두 복사
-- WHERE절에 false값(1 = 2) 지정하면 -> 테이블의 구조만 복사되고 데이터는 복사 x
-- CTAS문은 컬럼의 구조와 데이터를 복사할 뿐, 제약조건(PK, FK...)은 복제되지 않습니다.
CREATE TABLE emps AS
(select employee_id, first_name, job_id, hire_date
from employees where 1 = 2);

select * from emps;
drop table emps;

desc emps;

-- INSERT (서브쿼리)
INSERT INTO emps
(select employee_id, first_name, job_id, hire_date
from employees where department_id = 50);

select * from emps;

--------------------------------------------------------------------------------

-- UPDATE
-- UPDATE 테이블이름 SET 컬럼 = 값, 컬럼 = 값...... WHERE 누구를 수정할지(조건)

-- UPDATE를 진행할 때는 누구를 수정할 지 조건으로 잘 지목해야 합니다.
-- 그렇지 않으면 수정 대상이 테이블 전체로 지정됩니다.

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

-- UPDATE (서브쿼리)
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
-- DELETE도 WHERE 지정하지 않으면 테이블 전체 행이 대상이 됩니다.
DELETE from emps
where employee_id =103;


-- DELETE (서브쿼리)
delete from emps
where department_id = (select department_id from departments
                        where department_name = 'IT');
