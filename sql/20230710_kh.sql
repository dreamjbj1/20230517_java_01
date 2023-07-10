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


-- 모든 사원들의 남, 여 , 성별과 함께 이름과 주민번호
select emp_name, emp_no, 
        decode(substr(emp_no,8,1), 2, '여', 4, '여', '남')
        as "성 별"
    from employee
;
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
