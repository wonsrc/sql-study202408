-- lower(�ҹ���), initcap(�ձ��ڸ� �빮��), upper(�빮��)

select * from dual;

/*
dual�̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�,
���� �� �࿡ �� �÷��� ��� �ִ� dummy ���̺� �Դϴ�.
�Ͻ����� ��� �����̳� ��¥ ���� � �ַ� ����մϴ�.
��� ����ڰ� ������ �� �ֽ��ϴ�.
*/

select
    'abcDEF',
    lower('abcDEF'),
    initcap('abcDEF'),
    upper('abcDEF')
from dual;

select
    last_name,
    lower(last_name),
    initcap(last_name),
    upper(last_name)
from employees;

select
    *
from employees
where lower(last_name) = 'austin';

-- length(����), instr(���� ã��, ������ 0�� ��ȯ, ������ �ε��� ��)
SELECT
    'abcdef', LENGTH('abcdef'), INSTR('abcdef', 'b')
FROM dual;

select
    first_name,
    length(first_name),
    instr(first_name, 'a')
from employees;

-- substr(�ڸ� ���ڿ�, �����ε���, ����)
-- substr(�ڸ� ���ڿ�, �����ε���) -> ���ڿ� ������.
-- �ε��� 1���� ����
-- concat(���� ����)
SELECT
    'abcdef' AS ex,
    SUBSTR('abcdef', 2),
    CONCAT('abc', '123')
FROM dual;

select
    first_name,
    substr(first_name, 1, 3),
    concat(first_name, last_name)
from employees;

-- LTRIM(), RTRIM()
-- TRIM() -> ���� ���� ����
-- LTRIM(param1, param2) -> param2�� ���� param1���� ã�Ƽ� ���� (���ʺ���)
-- RTRIM(param1, param2) -> param2�� ���� param1���� ã�Ƽ� ���� (�����ʺ���)
SELECT
    LTRIM('javascript_java', 'java')
FROM dual; 

SELECT
    RTRIM('javascript_java', 'java')
FROM dual;

SELECT TRIM('       java       ') FROM dual;


-- LPAD(), RPAD() :  �¤� ������ ������ ���ڿ��� ä���
select
    lpad('abc',10,'*'),
    rpad('abc',10,'#')
from dual;


-- REPLACE(str, old, new)
SELECT
    REPLACE('My dream is a president', 'president', 'programmer')
FROM dual;

SELECT
    REPLACE(REPLACE('My dream is a president', 'president', 'programmer'), ' ', '')
FROM dual;

SELECT
    REPLACE(CONCAT('hello', 'world!'), '!', '?')
FROM dual;

