--학습용 SCOTT 명령어들
SELECT * 
FROM EMP
;
SELECT EMPNO, ENAME, SAL
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


-- 20번 부서를 제외한 사원 정보를 조회
select * 
    from emp
-- where deptno != 20
-- where deptno <>= 20
-- where deptno ^= 20
-- where not deptno = 20
    where deptno in (20, 10)
 ;

-- 20번 부서를 제외한 사원 중 comm()이 null 정보를 조회
-- 오류   comm = null (=쓰면 안된다) 애초에 null 값은 is null or is not null을 써야한다.
select * 
    from emp
    where not deptno = 20
     and comm is null       
;

-- 10, 20, 30 부서를 사원 정보를 조회
select *
    from emp
--    where deptno = 10 or deptno = 20 or  deptno = 30
    where deptno in(10,20,30)
;
-- 10, 20 부서를 제외한 사원 정보를 조회
select *
    from emp
    where not (deptno = 10 or deptno = 20)
--    where dept != 10 and deptno != 20
;

select ename, sal
    from emp
    where ename like 'S_%'
; 

-- 사원명의 길이와 byte크기를 조회
    select length(ename), lengthb(ename)
    from emp
    ;
--    select ' a안 녕 b', length('a 안 녕 b'), lengthb('a 안 녕 b')
select trim('a안 녕b'), length(trim('a안 녕b')), lengthb(trim('a안 녕b'))
--    from emp
     from dual
     -- 테이블 dual은 임시테이블로 연산이나 간단한 함수 결과값을 조회할 때 사용함.
;
-- 사원명의 시작부분 s와 끝나는 부분 s 모두 제거해주세요.
select Rtrim(Ltrim(ename, 'S'), 'S') from emp;
-- Ltrim 예시 010제거

-- LPad / Rpad 채워넣기
-- ename이 총 10자가 되도록 left 쪽에 'S'를 채워주세요.
select Lpad(ename, 10, 'S') from emp;
-- ename이 총 10자가 되도록 left 쪽에 ' ' 공백(default)를 채워주세요.
select Lpad(ename, 10) from emp;

-- 문자열(컬럼) 이어붙이기 
select concat(ename, comm) from emp;
select ename || comm from emp;
select sal || '달러' from emp;
select concat(sal, '달러') from emp;
-- substr 엄청 중요 !!
-- replace
select replace(ename, 'AM', 'X') from emp;

-- sysdate은 함수는 아니나 명령어가 실행되는 시점에 결과값을 출력해주므로 함수호출과 같음.
select sysdate from dual;
select hiredate from emp;
select hiredate, add_months(hiredate, 1) from emp;
-- 2023.07.10 (월)
select sysdate, to_char(sysdate, 'yyyy.mm.dd (dy) hh24:mi:ss')from dual;
-- 2023.07.10 (월요일)
select sysdate, to_char(sysdate, 'yyyy.mm.dd (day) hh24:mi:ss')from dual;

alter session set NLS_DATE_FORMAT = 'yyyy-mm-dd hh24:mi:ss';
select sysdate from dual;
select * from emp;

-- year 2023 month 09 day 11 hour 13 
select to_date('2023091113', 'yyyymmddhh24') from dual;
select add_months(to_date('2023091113', 'yyyymmddhh24'), 5) from dual;
select next_day(to_date('2023091113', 'yyyymmddhh24'), '수') from dual;
select next_day(to_date('2023091113', 'yyyymmddhh24'), 4) from dual;
-- 1:일요일 2: 월요일 3: 화요일 ...
select last_day(to_date('2023091113', 'yyyymmddhh24')) from dual;

select to_char(empno, '000000') , '$'||trim(to_char(sal, '999,999,999,999'))
    from emp;
select to_char(empno, '000000') , trim(to_char(sal, 'L999,999,999,999'))
    from emp;

select to_number('123,4567,8901', '999,9999,9999')*5 from dual;
-- 오류 select '123,4567,8901'*5 from dual;


select * from emp
    order by sal desc, ename asc
    ;
    
select ename, sal*12+nvl(comm, 0) salcomm 
    from emp
    order by 2 desc, 1 desc
    ;
-- job 오름차순
select * from emp
--    order by job;
    order by 3;    
    
    
-- 사원명, 부서번호, 부서명, 부서위치의 조회
select * from dept;
select * from emp;
select * 
    from emp
        join dept on emp.deptno = dept.deptno 
; 
select * 
    from emp
        join dept using (deptno)
; 
select ename, deptno, dname, loc 
    from emp
        join dept using (deptno)
;


select *
from emp
where comm is not null;

select *
from emp
where comm is null;

select *
from emp
where mgr is null;

select *
from emp
order by sal asc;

select *
from emp
order by sal desc, comm desc;

select empno, ename, job, hiredate
from emp
order by hiredate asc;

select empno, ename
from emp
order by empno desc;

-- 부서위치가 DALLAS인 사원명, 부서번호, 부서번호, 부서명, 위치를 조회
--select ename, dept.deptno, dname, loc
--    from emp, dept




select empno, loc
    from emp cross join dept
;

select * from emp;
select * from salgrade;
-- 사원의 이름, 사번, sal, grade를 조회

select e.ename, e.empno, e.sal ,s.grade 등급
from emp e
    join salgrade s on e.sal between s.losal and s.hisal
    order by s.grade desc, e.sal desc
;
select * from emp;

-- 자료형
create table t1(
    c1 char(5),
    c2 varchar2(5)
);
insert into t1 values('12','12');
commit;
select * from t1;
select length(c1), length(c2) from t1;

desc t1;
desc emp;

-- ERD ( entity relationship diagram )
-- UML - classDiagram, ERD 

-- 오류
select rownum, e.*  from emp e where deptno in (20, 30)
    order by ename asc
;
-- 해결 방법
select rownum, e.*  
    from (select * from emp order by ename asc) e
    where deptno in (20, 30)
;

-- 1page 1-3
select rownum, e.*
    from ( select * from emp where deptno in (20, 30) order by ename asc) e
    where rownum between 1 and 3
;
-- 2page 4-6
select rownum rnum, e.*
    from ( select * from emp where deptno in (20, 30) order by ename asc) e
    where rownum between 4 and 6
    -- rnum은 select -6 수행순서로 where 절에서 사용할 수 없음.
;
-- 해결방법 -- rownum을 제대로 사용하기 위해서는 2개의 중첩 subquery(inline-view) 필요함.
-- 3page 7-9
select *
from (select rownum rnum, e.* 
            from ( select * from emp where deptno in (20,30) order by ename asc) e
        )
        where rnum between 7 and 9 
;

with abc as (select rownum rnum, e.* 
            from ( select * from emp where deptno in (20,30) order by ename asc) e)
select *
from abc
where rnum between 7 and 9
;

create view view_abc
as 
select rownum rnum, e.* 
            from ( select * from emp where deptno in (20,30) order by ename asc) e
;
select * from view_abc;
select *
from view_abc
where rnum between 7 and 9
;


select empno, hiredate, ename, sal
from emp;
where empno asc;

-- 9번
select sysdate
from dual;

-- 8번
select empno, ename, sal
from emp
order by empno desc, hiredate desc;

-- 10번
select empno, ename, round(sal, -2)
from emp
order by sal desc;

-- 11번
select *
from emp;
where mod(empno,2)=1; 

-- 12번 문제
select ename, extract(year from hiredate) year, extract(month from hiredate)month
from emp;

-- 13번 문제
select *
from emp
where extract(month from hiredate)='9';

-- 14번 문제
select *
from emp
where extract(year from hiredate)='1981';

-- 15번문제 
select *
from emp
where ename like '%E';

-- 16번 문제
select *
from emp
where ename like '__R%';

--select *
--from emp
--where substr(ename, 3, R)

-- 17번 문제
select empno, ename, hiredate, add_months(hiredate, 480) 
from emp;

-- 18번 문제
select *
from emp
where months_between(sysdate,hiredate) >= 456;

-- 19번 문제
select extract(year from sysdate) 
from dual;
--- 1 실습 끝

-- 2 실습 시작

-- 1번 문제
