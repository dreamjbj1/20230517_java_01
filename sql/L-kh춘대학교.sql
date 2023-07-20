select * from TB_DEPARTMENT;
select * from TB_CLASS;
select * from TB_PROFESSOR;
select * from TB_CLASS_PROFESSOR;
select * from TB_STUDENT;
select * from TB_GRADE;

-- 1번
select department_name "학과명", category "계열"
from tb_class;

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

---- 6번
--select professor_name 
--from 

-- 7번
select department_name "학과"
from tb_department
where department_nae is null;

-- 9번
select distinct(category) 
from tb_department
order by category asc;


-- 실습 2장 

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
select substr(professor_name,2,2) "이름"
from tb_professor
where professor_name like '%_';

-- 5번


-- 8번
select student_no, student_name
from tb_student 
where student_no not like 'A%';

-- 10번
--select department_no "학과번호", student_no "학생수(명)"
--from tb_department

-- 11번
select count(*)
from tb_student
where coach_professor_no is null;

-- 13번
--select department_no "학과코드명" , absence_yn "휴학생"
--from tb_student;
--where count(absence_yn = 'Y');

-- 실습 3장  -----------------------
-- 1번 문제
select student_name "학생 이름", student_address "주소지"
from tb_student
order by 1 asc;

-- 2번 문제
select student_name, student_ssn
from tb_student
where absence_yn = 'Y'
order by student_ssn desc;

-- 3번 문제

 
 -- 실습 3장
-- 1번
 select student_name "학생이름", student_address "주소지" 
from tb_student
order by student_name asc;

-- 2번
select student_name, student_ssn
from tb_student
where absence_yn = 'Y'
order by student_ssn desc;

-- 3번 문제
select student_name "학생이름", student_no "학번", student_address "거주지 주소"
from tb_student
where (substr(student_address,1,3) = '강원도' or substr(student_address,1,3) = '경기도') and substr(student_no,1,2) = '90'
order by student_name asc;


-- 4번 문제
select professor_name, professor_ssn
from tb_professor
where department_no = 005
order by professor_ssn asc;
 
-- 5번
select student_no, point
from tb_grade
where term_no=200402 and class_no = 'C3118100'
order by point desc, student_no desc;

-- 6번 문제 
select student_no, student_name, department_name
from tb_student, tb_department 
where tb_department.department_no = tb_student.department_no
order by student_name asc;

-- 7번 문제
select class_name, department_name
from tb_class
join tb_department using(department_no);

-- 8번 문제
select class_name, professor_name
from tb_class  
join tb_professor using(department_no);

-- 9번 문제
select class_name, professor_name
from tb_class  
join tb_professor using(department_no);


-- 10번 문제
select student_no "학번", student_name "학생이름", round(point,1) "전체 평점"
from tb_student
join tb_grade using (department_no)
where department_name = '음악학과';

-- 15번 문제 group bynull
--select  student_no "학번", student_name "이름", department_name "학과 이름"
--from (select * from tb_student where absence_yn<>'Y') s
--join tb department d using(department_no)
--join tb grade g using (student_no);

-- 18번 문제
--select student_no, student_name
--from tb_student
--join tb_department using (department_no)
--where department_name = '국어국문학과' and rownum = 1;

select student_no, student_name
    from (select student_no, s.student_name, avg(point) 
                from tb_student s
                join tb_department d using(department_no)
                join tb_grade g using(student_no)
                where department_name = '국어국문학과'
                group by student_no, student_name
                order by avg(point) desc)
    where rownum = 1
;
--select * from
--(
--select rownum rn, tb1.* from
--(
--select * from employee order by hire_date asc
--) tb1 
--)
--where rn <= 3
--;

select tb1.* from
(
select * from employee order by hire_date asc
) tb1
where rownum <=3
;