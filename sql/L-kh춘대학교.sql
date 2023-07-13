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

-- 5번
--select department_name, category
--from tb_department
--where category 

-- 9번
select distinct(category) 
from tb_department
order by category asc;