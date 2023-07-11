select * from employee;
select * from department;
select * from job;
select * from location;
select * from national;
select * from sal_grade;

select * from employee where job_code = 'J1';

-- 급여를 3500000보다 많이 받고 6000000보다 적제 받는 직원 이름과 급여 조회
--select EMP_NAME, SALARY
--from EMPLOYEE
--where SALARY >= 3500000 and SALARY <= 6000000;
-- 또는
select EMP_NAME, SALARY
from EMPLOYEE
where SALARY between 3500000 and 6000000;

-- '전'씨 성을 가진 직원 이름과 급여 조회
select EMP_NAME, SALARY
from EMPLOYEE
where EMP_NAME LIKE '전%';


-- 핸드폰 앞 네 자리 중 첫 번호가 7인 직원 이름과 전화번호 조회
select EMP_NAME, PHONE
from EMPLOYEE
where PHONE LIKE '___7%';
-- '이'씨 성이 아닌 직원 사번, 이름, 이메일 조회
--select EMP_NAME,EMP_ID, EMAIL
--from employee
--where EMP_NAME NOT LIKE '이%'
select EMP_ID, EMP_NAME, EMAIL
from employee
where not EMP_NAME LIKE '이%';
-- EMAIL ID 중 '_'의 앞이 3자리인 직원 이름, 이메일 조회
select EMP_NAME, EMAIL
from employee
where EMAIL LIKE '___#_%' ESCAPE '#';
-- NULL 여부를 비교하는 연산자
-- 관리자도 없고 부서 배치도 받지 않은 직원 조회
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
FROM EMPLOYEE
where manager_id is null and dept_code is null;

-- 부서 배치를 받지 않았지만 보너스를 지급받는 지원 조회
select emp_name, bonus, dept_code
from employee
where dept_code is null and bonus is not null;


-- 모든 사원들의 남, 여 , 성별과 함께 이름과 주민번호
select emp_name, emp_no, 
        decode(substr(emp_no,8,1), 2, '여', 4, '여', '남')
        as "성 별"
    from employee
;
-- 비교하려는 값 목록에 일치하는 값이 있으면 TRUE를 반환하는 연산자
-- D6 부서와 D8 부서원들의 이름, 부서코드, 급여조회
select emp_name, dept_code, salary
from employee
where dept_code in ('D6', 'D8');

select emp_name, dept_code, salary
from employee
where dept_code = 'D6' or dept_code = 'D8';

-- 연산자 우선순위
-- 'J2' 또는 'J7' 직급 콛 ㅡ중 급여를 2000000보다 많이 받는 직원의 이름,급여, 직급코드 조회
select emp_name, salary, job_code
from employee
where job

-- java, js 삼항연산자와 비슷함
-- string a = (substr(emp_no,8,1) == 2 ? "여" : "남";
--if(substr(emp_no,8,1) == 2) {
--    return "여";
--} else{
--   return "남";
--}

select substr(emp_no,8,3) from employee;



-- EMPLOYEE에서 부서코드, 그룹 별 급여의 합계, 그룹 별 급여의 평균(정수처리), 인원 수를 조회하고 부서 코드 순으로 정렬
    select DEPT_CODE 부서코드, SUM(SALARY) 합계, FLOOR(AVG(SALARY)) 평균,count(*) 인원수
    from EMPLOYEE
    group by DEPT_CODE
    order by DEPT_CODE ASC;
-- EMPLOYEE테이블에서 부서코드와 보너스 받는 사원 수 조회하고 부서코드 순으로 정렬
-- EMPLOYEE테이블에서 성별과 성별 별 급여 평균(정수처리), 급여 합계, 인원 수 조회하고 인원수로 내림차순 정렬     

-- 사원명, 부서번호, 부서명, 부서위치를 조회
select tb1.emp_name, tb1.dept_code, tb2.dept_title, tb2.location_id, tb3.national_code, tb4.national_name
    from employee tb1
        join department tb2 on tb1.dept_code = tb2.dept_id
        join location tb3 on tb2.location_id = tb3.local_code
        join national tb4 on tb3.national_code = tb4.national_code
            --join조건에 사용되는 칼럼명이 다르면 using 사용 불가        
;




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
--select *
--from employee
--where hire_date >= to_date(900101,'yymmdd') and hire_date <= to_date(010101,'yymmdd');

-- 12번 문제
select emp_name
from employee
where emp_name like '%연';

-- 13번 문제
select emp_name, phone
from employee
where phone