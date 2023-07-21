select deptno, avg(sal)
from emp
group by deptno;

select deptno, job, avg(sal)
from emp
group by deptno, job
having avg(sal) >= 2000
order by deptno, job;

-- 7-22 실습문제
select deptno, job, avg(sal)
from emp
group by deptno, job
having avg(sal) >= 2000
order by deptno, job;

-- 7-23 실습문제 
select deptno, job, avg(sal)
from emp
where sal <= 3000
group by deptno, job
having avg(sal) > 2000
order by deptno, job;

-- 7-24 실습문제
select deptno, job, count(*), max(sal), sum(sal), avg(sal)
from emp
group by deptno, job
order by deptno, job;

-- Q1. pg 212
select deptno, floor(avg(sal)) "avg_sal", max(sal) "max_sal", min(sal) "min_sal", count(*) "cnt"
from emp
group by deptno;

-- Q2. pg 212
select job, count(*)
from emp
group by job 
having count(*) >=3;

-- Q3. pg212
--select extract(year from hire_date) hire_year, deptno, count(*) "cnt"
--from emp;


