select * from  EMPLOYEE;
select * from  DEPARTMENT;
select * from  JOB;
select * from  LOCATION;
select * from  NATIONAL;
select * from  SAL_GRADE;

select emp_name, length(emp_name) len, lengthb(emp_name) byteLen
    from employee
    ;
select * from employee where emp_name = '방_명수';

--
--ORA-00911: 문자가 부적합합니다
--00911. 00000 -  "invalid character"
--SELECT EMAIL, INSTR(EMAIL, '@', -1, 1) 위치
--SELECT EMAIL, INSTR(EMAIL, '@') 위치
-- instr - 1부터시작
SELECT EMAIL, INSTR(EMAIL, '@', 2) 위치
    FROM EMPLOYEE
;
-- email 은 @ 이후에 . 1개 이상있어야 함.
SELECT EMAIL, INSTR(EMAIL, '@'), INSTR(EMAIL, '.', INSTR(EMAIL, '@')) 위치
    FROM EMPLOYEE
    where INSTR(EMAIL, '.', INSTR(EMAIL, '@')) <> 0
;
--
select INSTR('AORACLEWELCOME', 'O', 1)   from dual;
select INSTR('AORACLEWELCOME', 'O', 1, 2)    from dual;
select INSTR('AORACLEWELCOMEOKEY', 'O', 1, 3)    from dual;
select INSTR('AORACLEWELCOMEOKEY', 'O', 3)   from dual;
select INSTR('AORACLEWELCOMEOKEY', 'O', 3, 2)    from dual;
select INSTR('AORACLEWELCOMEOKEY', 'O', 3, 3)    from dual;

-- 급여를 3500000보다 많이 받고 6000000보다 적게 받는 직원이름과 급여 조회
-- ‘전’씨 성을 가진 직원 이름과 급여 조회
-- 핸드폰의 앞 네 자리 중 첫 번호가 7인 직원 이름과 전화번호 조회
-- EMAIL ID 중 ‘_’의 앞이 3자리인 직원 이름, 이메일 조회
-- like '__*_' escape '*'
-- ‘이’씨 성이 아닌 직원 사번, 이름, 이메일 조회
-- 관리자도 없고 부서 배치도 받지 않은 직원 조회
-- 부서 배치를 받지 않았지만 보너스를 지급받는 직원 조회
-- D6 부서와 D8 부서원들의 이름, 부서코드, 급여 조회
-- ‘J2’ 또는 ‘J7’ 직급 코드 중 급여를 2000000보다 많이 받는 직원의 이름, 급여, 직급코드 조회

-- 모든 사원들의 남, 여 성별과 함께 이름과 주민번호
select emp_name, emp_no, 
        decode(substr(emp_no, 8,1), 2, '여', 4, '여', 1, '남', 3, '남', '그외')
        as "성 별"
    from employee
;
select emp_name, emp_no, 
        case
            when substr(emp_no, 8,1) = 2 then '여'
            when substr(emp_no, 8,1) > 1 then '남'
            when substr(emp_no, 8,1) > 4 then '여'
            when substr(emp_no, 8,1) > 3 then '남'
            else '그외'
        end
        as "성 별"
    from employee
;
select emp_name, emp_no, 
        case substr(emp_no, 8,1)
            when '2' then '여'
            when '1' then '남'
            when '4' then '여'
            when '3' then '남'
            else '그외'
        end
        as "성 별"
    from employee
;
select emp_name, emp_no, 
--ORA-00932: 일관성 없는 데이터 유형: CHAR이(가) 필요하지만 NUMBER임
--00932. 00000 -  "inconsistent datatypes: expected %s got %s"
--ORA-00932: 일관성 없는 데이터 유형: NUMBER이(가) 필요하지만 CHAR임
--00932. 00000 -  "inconsistent datatypes: expected %s got %s"
        case to_number(substr(emp_no, 8,1))
            when 2 then '여'
            when 1 then '남'
            when 4 then '여'
            when 3 then '남'
            else '그외'
        end
        as "성 별"
    from employee
;
-- java, js 삼항연산자
-- string a = ( substr(emp_no, 8,1) == 2 ? "여" : "남";
--if(substr(emp_no, 8,1) == 2){
--    return "여";
--} else {
--    return "남";
--}
--if(substr(emp_no, 8,1) == 2){
--    return "여";
--} else if(substr(emp_no, 8,1) == 4) {
--    return "여";
--} else if(substr(emp_no, 8,1) == 1) {
--    return "남";
--} else if(substr(emp_no, 8,1) == 3) {
--    return "남";
--} else {
--    return "그외";
--}
--switch(substr(emp_no, 8,1)){
--    case 1:
--        return "남";
--    case 2:
--        return "여";
--    case 3:
--        return "남";
--    case 4:
--        return "여";
--    default:
--        return "그외";
--}



select substr(emp_no, 8,3) from employee;

-- 직원들의 평균 급여는 얼마인지 조회
select (avg(salary)) 평균급여 from employee;
select floor(avg(salary)) 평균급여 from employee;
select trunc(avg(salary), 4) 평균급여 from employee;
select round(avg(salary)) 평균급여 from employee;
select ceil(avg(salary)) 평균급여 from employee;

SELECT COUNT(DISTINCT DEPT_CODE) 
    FROM EMPLOYEE;
SELECT COUNT(DEPT_CODE) 
    FROM EMPLOYEE;  -- 21
SELECT COUNT(*) 
    FROM EMPLOYEE; -- 23
SELECT * --COUNT(*) 
    FROM EMPLOYEE 
    where dept_code is null;
-- count 는 resultset의 row값이 null 이면 count 되지 않음.
-- count(*) row 개수
SELECT COUNT(dept_code), count(bonus), count(emp_id), count(manager_id), count(*)
    FROM EMPLOYEE 
    where dept_code is null;
    
SELECT COUNT(DEPT_CODE), COUNT(distinct DEPT_CODE)
    FROM EMPLOYEE; 

SELECT DEPT_CODE    FROM EMPLOYEE; 
SELECT distinct DEPT_CODE    FROM EMPLOYEE; 

SELECT distinct DEPT_CODE    FROM EMPLOYEE
    order by dept_code asc
; 
-- EMPLOYEE에서 부서코드, 그룹 별 급여의 합계, 그룹 별 급여의 평균(정수처리), 인원 수를 조회하고 부서 코드 순으로 정렬

-- EMPLOYEE테이블에서 부서코드와 보너스 받는 사원 수 조회하고 부서코드 순으로 정렬
-- EMPLOYEE테이블에서 성별과 성별 별 급여 평균(정수처리), 급여 합계, 인원 수 조회하고 인원수로 내림차순 정렬


--부서 코드와 급여 3000000 이상인 직원의 그룹별 평균 조회
select dept_code, avg(salary)
    from employee
-- 사원 각자의 급여가 3000000 이상
    where salary >= 3000000
    group by dept_code
;
--부서 코드와 급여 평균이 3000000 이상인 그룹 조회
select dept_code, avg(salary)
    from employee
    group by dept_code
-- 그룹된 부서별 평균 급여가 3000000 이상
    having avg(salary) > 3000000
;

--- 사원명, 부서번호, 부서명, 부서위치를 조회
select tb1.emp_name, tb1.dept_code, tb2.dept_title, tb2.location_id, tb3.national_code, tb4.national_name
    from employee tb1
        join department tb2 on tb1.dept_code = tb2.dept_id
        join location tb3 on tb2.location_id = tb3.local_code
        join national tb4 on tb3.national_code = tb4.national_code 
        -- join조건에 사용되는 컬럼명이 다르면 using 사용 불가
;
--- 사원명, 부서번호, 부서명, 부서위치를 조회
--ORA-00904: "TB3"."NATIONAL_CODE": 부적합한 식별자
--00904. 00000 -  "%s: invalid identifier"
--select tb1.emp_name, tb1.dept_code, tb2.dept_title, tb2.location_id, tb3.national_code, tb4.national_name
select tb1.emp_name as c1, tb1.dept_code c2, tb2.dept_title, tb2.location_id, national_code, tb4.national_name
    from employee tb1
        join department tb2 on tb1.dept_code = tb2.dept_id
        join location tb3 on tb2.location_id = tb3.local_code
        join national tb4 using (national_code)
        -- join조건에 사용되는 컬럼명이 다르면 using 사용 불가
;
select emp_name, dept_code, dept_title, location_id, national_code, national_name
    from employee tb1
        join department tb2 on tb1.dept_code = tb2.dept_id
        join location tb3 on tb2.location_id = tb3.local_code
        join national tb4 using (national_code)
        -- join조건에 사용되는 컬럼명이 다르면 using 사용 불가
;

select tb1.emp_name, tb1.dept_code, tb2.dept_title, tb2.location_id, tb3.national_code, tb4.national_name
    from employee tb1, department tb2, location tb3, national tb4
    where tb1.dept_code = tb2.dept_id
        and tb2.location_id = tb3.local_code
        and tb3.national_code = tb4.national_code 
;
select * from  EMPLOYEE;
select * from  DEPARTMENT;
select * from  JOB;
select * from  LOCATION;
select * from  NATIONAL;
select * from  SAL_GRADE;

select * 
from  EMPLOYEE e
 join DEPARTMENT d on e.dept_code=d.dept_id
;
select * 
from  EMPLOYEE e
 left outer join DEPARTMENT d on e.dept_code=d.dept_id
;
select * 
from  EMPLOYEE e
 right outer join DEPARTMENT d on e.dept_code=d.dept_id
;
select * 
from  EMPLOYEE e
 full outer join DEPARTMENT d on e.dept_code=d.dept_id
;
select * 
from  EMPLOYEE e , DEPARTMENT d 
 where e.dept_code=d.dept_id(+)
;
select * 
from  EMPLOYEE e , DEPARTMENT d 
 where e.dept_code(+)=d.dept_id
;
-- oracle join에서 full outer join 표기법없음
--ORA-01468: outer-join된 테이블은 1개만 지정할 수 있습니다
--01468. 00000 -  "a predicate may reference only one outer-joined table"
--select * 
--from  EMPLOYEE e
-- , DEPARTMENT d 
-- where e.dept_code(+)=d.dept_id(+)
--;




select * from employee;
select * from department;
select * from job;
select * from location;
select * from national;
select * from sal_grade;

select *
from EMPLOYEE e
 left outer join DEPARTMENT d on e.dept_code=d.dept_id
 ;
 
 select *
from EMPLOYEE e
 right outer join DEPARTMENT d on e.dept_code=d.dept_id
 ;

select *
from EMPLOYEE e
 full outer join DEPARTMENT d on e.dept_code=d.dept_id
 ;

select * from employee;

select emp_id, emp_name, job_code, salary
from employee
where salary >= (select avg(salary) from employee);

select emp_name, job_code,dept_code,salary
from employee
where salary >= (select avg(salary) from employee)
order by 2;

(select avg(salary) from employee);

select emp_id, emp_name, job_code,salary
from employee
where(job_code,salary)in(select job_code,min(salary) from employee group by job_code)
order by 3;

select emp_name, job_code,dept_code,hire_date
from employee
where (dept_code, job_code) in (select dept_code, job_code from employee WHERE SUBSTR(EMP_NO,8,1)=2 AND ENT_YN='Y');


select emp_id, emp_name, job_code,salary
from employee
where (job_code, salary) in (select job_code, min(salary) from employee group by job_code)
order by 3;

-- 2 실습 시작

-- 1번 문제
select * from job;

-- 2번 문제
select job_name
from job;

-- 3번 문제
select * from department;

-- 4번 문제 
select emp_name, email, phone, hire_date
from employee;

-- 5번 문제
select hire_date, emp_name, salary
from employee;

-- 6번 문제
--select emp_name, salary*12, 
--from employee;

-- 7번 문제
select emp_name, salary, hire_date, phone
from employee
where sal_level= 'S1';

-- 8번 문제
select *
from employee;

-- 9번 문제
select *
from employee
where salary >= 4000000 and job_code = 'J2';

-- 10번 문제 다시풀기
select emp_name, dept_code, hire_date
from employee
where (dept_code = 'D9' or dept_code='D5') and hire_date < to_date('020101', 'yymmdd');

--select to_date(020101, 'yymmdd') from dual;

-- 11번 문제 다시풀기 
select *
from employee
where hire_date >= to_date('900101','rrmmdd')
    and hire_date <= to_date('010101','rrmmdd')
;

-- 12번 문제
select emp_name
from employee
where emp_name like '%연';

-- 13번 문제
select emp_name, phone
from employee
where not phone like '010%';

-- 14번 문제
select *
from employee
where email like'____#_%' escape '#' and (dept_code='D9' or dept_code= 'D6') and hire_date >= to_date('900101','rrmmdd')
    and hire_date <= to_date('010101','rrmmdd') and salary >= 2700000;
    
-- 15번 문제
select *
from employee;

-- 16번 문제
--select emp_name, emp_no
--from employee;
--where
 
CREATE TABLE USER_CHECK(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10) CHECK (GENDER IN ('남', '여')),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50)
);
INSERT INTO USER_CHECK VALUES(1, 'user01', 'pass01', '홍길동', '남자', 010-1234-5678, 
'hong123@kh.or.kr');
select * from USER_CHECK;

create table employee_copy
as select emp_id, emp_name, salary, dept_title, job_name
    from employee
left join department on (dept_code = dept_id)
left join job using(job_code);

select * from employee_copy;

insert into employee
values(1,'홍길동', '820114-1010101','hong_kd@kh.or.kr','01099998888','D5','J2','S4',3800000,null,'200',sysdate,null,default);

update employee
set emp_id = 290
where emp_name = '홍길동';

delete from employee
where emp_name = '홍길동';

--create table emp_01(
--    emp_id number,
--    emp_name varchar2(30),
--    dept_title varchar2(20)
--);

--insert into emp_01(
--    select emp_id
--            emp_name,
--            dept_title
--    from employee
--    left join department on(dept_code = dept_id));
--    
--select * from employee;

CREATE TABLE EMP_01(
EMP_ID NUMBER,
EMP_NAME varchar2(30),
DEPT_TITLE VARCHAR2(20)
);

INSERT INTO EMP_01(
SELECT EMP_ID,
EMP_NAME,
DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
);

select * 
from emp_01;

--INSERT ALL
--WHEN HIRE_DATE < '2000/01/01' THEN
--INTO EMP_OLD VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
--WHEN HIRE_DATE >= '2000/01/01' THEN
--INTO EMP_NEW VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
--SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
--FROM EMPLOYEE;

create table dept_copy
as select * from department;

update dept_copy
set dept_title='전략기획팀'
where dept_id = 'D9';

select * from dept_copy;

--방영수 사원의 급여와 보너스율을 유재식 사원과 동일하게 변경
create table emp_salary
as select emp_id, emp_name, dept_code, salary, bonus
from employee;

update emp_salary
set salary = (select salary from emp_salary where emp_name='유재식'),
bonus=(select bonus from emp_salary where emp_name='유재식')
where emp_name='방명수';

select * from emp_salary
where emp_name in('유재식','방명수');

-- 각각 쿼리문 작성한 것을 다중 행 다중 열 서브쿼리로 변경
update emp_salary
set(salary,bonus)=(select salary, bonus from emp_salary where emp_name = '유재식')
where emp_name = '방명수';

select * from emp_salary
where emp_name in('유재식','방명수');

--  update 예시4번
update EMP_SALARY
set bonus = 0.3
where emp_id in(select emp_id 
from employee 
join department on(dept_id = dept_code)
join location on(location_id = local_code)
where local_name like 'ASIA%');

select * from emp_salary;

-- delete 예시1
delete from employee
where emp_name = '장채현';

delete from department
where dept_id = 'D1';

select * from department;

-- delete 예시2
delete from department
where dept_id ='D3';

alter table employee
disable constraint emp_deptcode_fk cascade;

delete from department
where dept_id ='D1';

alter table employee
enable constraint emp_deptcode_fk;




alter table dept_copy
add(cname varchar2(20));

select * from dept_copy;

alter table dept_copy
add(lname varchar2(40) default '한국');

select * from dept_copy;

ALTER TABLE DEPT_COPY
    ADD CONSTRAINT DCOPY_DID_PK PRIMARY KEY(DEPT_ID);
ALTER TABLE DEPT_COPY    
    ADD CONSTRAINT DCOPY_DTITLE_UNQ UNIQUE(DEPT_TITLE);
ALTER TABLE DEPT_COPY
    MODIFY LNAME CONSTRAINT DCOPY_LNAME_NN NOT NULL;
    
SELECT UC.CONSTRAINT_NAME, 
UC.CONSTRAINT_TYPE,
UC.TABLE_NAME,
UCC.COLUMN_NAME,
UC.SEARCH_CONDITION
FROM USER_CONSTRAINTS UC
JOIN USER_CONS_COLUMNS UCC ON (UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME)
WHERE UC.TABLE_NAME = 'DEPT_COPY';

desc dept_copy;

alter table dept_copy
--    modify dept_id char(3)
    modify dept_title varchar(30)
    modify location_id varchar2(2)
    modify cname char(20)
    modify lname default '미국';

select * from dept_copy;

alter table dept_copy
drop column dept_id;

select * from dept_copy;

CREATE TABLE EMP_DEPT_D1
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE 1 = 0;

CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID, EMP_NAME, MANAGER_ID
FROM EMPLOYEE
WHERE 1 = 0;

drop table EMP_DEPT_D1;
drop table EMP_MANAGER;
INSERT ALL
INTO EMP_DEPT_D1 VALUES(EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
INTO EMP_MANAGER VALUES(EMP_ID, EMP_NAME, MANAGER_ID)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';



select * from EMP_DEPT_D1;

select * from EMP_MANAGER;



INSERT ALL
WHEN HIRE_DATE < '2000/01/01' THEN
INTO EMP_OLD VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
WHEN HIRE_DATE >= '2000/01/01' THEN
INTO EMP_NEW VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
FROM EMPLOYEE;


-- 21. EMPLOYEE테이블에서 직원 명, 부서코드, 생년월일, 나이(만) 조회
--(단, 생년월일은 주민번호에서 추출해서 00년 00월 00일로 출력되게 하며
--나이는 주민번호에서 출력해서 날짜데이터로 변환한 다음 계산)
--select emp_name, dept_code,
--    substr(emp_no, 1,2)||"년'|| substr(emp_no, 3,2)||'월 ' || substr(emp_no,5,2)|| '일' "생년월일
----  만나이
--    , extract(
--    from employee
--;    

create synonym emp for employee;
select * from emp;


select dept_code, count(bonus)
from employee
where bonus is not null
group by dept_code
order by dept_code asc;


-- 20230717
-- group by -- 꼭 지켜져야하는 룰: group by 컬럼명, 컬럼명 만 select 로 선택할 수 있음. 또는 그룹함수 사용 가능
select job_code, sum(salary)
from employee
group by rollup(job_code)
order by 1;
select job_code, sum(salary) from employee group by cube(job_code) order by 1;

-- 집계(전체) 
select dept_code, job_code, sum(salary) from employee
group by rollup(dept_code, job_code)
order by 1;

select dept_code, job_code, sum(salary)
from employee
group by cube(dept_code,job_code)
order by 1;

select emp_id, emp_name, salary,
rank() over(order by salary desc) 급여순위 
from employee;

select rank(2300000) within group (order by salary desc) as 순위
from employee;

create table user_foreignkey(user_no number primary key, user_id varchar2(20) unique, user_pwd varchar2(30) not null,
user_name varchar2(30), gender varchar(10), phone varchar2(30), email varchar2(50), grade_code number, 
foreign key (grade_code) references user_grade(grade_code));





