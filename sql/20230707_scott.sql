--학습용 SCOTT 명령어들
SELECT * 
FROM EMP
;
SELECT ENPNO, ENAME, SAL
FROM EMP
;

select ENAME, MGR, SAL, DEPTNO   --3. 속성값,컬럼갑은 대소문자구분 철저히함
from emp                      --2. 테이블명도 대소문자 구분안함
where DEPTNO=20 or SAL>1500   --1. 파란색(where,from,select)예약어라고 하는데 대소문자 구분하지 않는다.
;
select ENAME, MGR, SAL, DEPTNO
from emp  
--where ENAME = 'smith'             --3. 속성값,컬럼갑은 대소문자구분 철저히함  이거는 사용 불가능함
where ENAME = 'SMITH'            --3. 속성값,컬럼갑은 대소문자구분 철저히함 이거는 사용 가능 > 속성값이 대문자라서 가능함 
;

select empno, ename, sal
from emp
;

--* 을 사용하는 것 보다 속도 빠름, 권장
select EMPNO, ENAME, job, mgr, hiredate, sal, comm, deptno
from emp;
-- * 보다 컬럼명을 나열하는 것이 속도면에서 좋음 
select * from emp;
select * from dept;
select * from salgrade;
select * from bonus;

-- Q: 사원명과 연봉을 조회
select ename, sal*12, sal*12 + nvl(comm, 0)
from emp
;
select comm, nvl(comm, 0), nvl(comm, 100)
from emp
;
select ename as "사원명", sal*12 as 연봉, sal*12 + nvl(comm, 0) as "보너스 포함 연봉"
from emp
;
select '안녕' as hello
from emp
;
select '안녕' as hello
from dept
;
select sal '$'  as 단위, sal
from emp
;

select distinct 's' as 단위, sal
from emp;