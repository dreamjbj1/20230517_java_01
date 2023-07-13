select * from TB_DEPARTMENT;
select * from TB_CLASS;
select * from TB_PROFESSOR;
select * from TB_CLASS_PROFESSOR;
select * from TB_STUDENT;
select * from TB_GRADE;

-- 1번
select department_name "학과명", category "계열"
from tb_department;

-- 2번

select department_name || '의 정원은' || capacity || '명 입니다.'
from tb_department;

-- 3번
--select student_name
--from tb_department, 

--4번 문제
--select student_name
--from 

 
-- 5번
select department_name, category
from tb_department
where capacity >= 20 and capacity <= '30';

-- 6번
select professor_name 
from 
 
-- 9번
select distinct(category) 
from tb_department
order by category asc;


-- 실습 2번

select * from TB_DEPARTMENT;
select * from TB_CLASS;
select * from TB_PROFESSOR;
select * from TB_CLASS_PROFESSOR;
select * from TB_STUDENT;
select * from TB_GRADE;

-- 1번
select student_no "학번", student_name "이름", entrance_date "입학년도"
from tb_student
where department_no= '002'
order by entrance_date asc;

-- 2번
select professor_name, professor_ssn
from tb_professor
where professor_name not like '___';

---- 3번
--select professor_name "이름", 

-- 4번
select professor_name "이름"
from tb_professor
where professor_name not like '%__';