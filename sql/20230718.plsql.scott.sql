set serveroutput on;
set serveroutput off;

begin
    dbms_output.put_line('hello world');
    dbms_output.put_line('hello world2');
    

end;
/
declare 
emp_id number;
emp_name varchar2(30);

begin
emp_id:=888;
emp_name:='배장남';
dbms_output.put_line('emp_id: ' || emp_id);
dbms_output.put_line('emp_name :' || emp_name);

end;
/

declare 
emp_id employee.emp_id%type;
emp_name employee.emp_name%type;

begin
select emp_id,emp_name
into emp_id,emp_name
from employee
where emp_id = '&emp_id';
dbms_output.put_line('emp_id: ' || emp_id);
dbms_output.put_line('emp_name :' || emp_name);

end;
/


desc dept
select * from dept;
insert into dept values(10,'ACCOUNT','NEW YORK');
insert into dept values('&deptno값을 넣어주세요', '&부서명', '&지역');

create or replace procedure pro_dept_insert
--declare
is
begin
    insert into dept values('&deptno', '&부서명', '&지역');
    commit;
end;
/
select * from user_procedures;

declare 
     e employee%rowtype;
begin
    select * into e
    from employee
    where emp_id = '&emp_id';
    dbms_output.put_line('emp_id: ' || e.emp_id);
    dbms_output.put_line('emp_name: ' || e.emp_name);
    dbms_output.put_line('emp_no: ' || e.emp_no);
     dbms_output.put_line('salary: ' || e.salary);
end;     
/ 

declare
    type emp_id_table_type is table of employee.emp_id%type
    index by binary_integer;
    type emp_name_table_type is table of employee.emp_name%type
    index by binary_integer;
        
    emp_id_table emp_id_table_type;
    emp_name_table emp_name_table_type;
    
    i binary_integer :=0;
begin
    for k in (select emp_id, emp_name from employee) loop
                i := i + 1;
                emp_id_table(i) := k.emp_id;
                emp_name_table(i) := k.emp_name;
    end loop;
    for j in 1..I loop
                        dbms_output.put_line('EMP_ID: ' || emp_id_table(j) ||',
EMP_NAME: ' || emp_name_table(j));
    end loop;
end;
/

declare 
    type emp_record_type is record (
                    emp_id employee.emp_id%type,
                    emp_name employee .emp_name%type,
                    dept_title department.dept_title%type,
                    job_name job.job_name%type
    );
    emp_record emp_record_type;
begin
    select emp_id, emp_name, dept_title, job_name into emp_record
    from employee e, department d, job j
    where e.dept_code = d.dept_id
            and e.job_code = j.job_code
            and emp_name = '&emp_name'; 
            
    dbms_output.put_line('사번 : ' || emp_record.emp_id);
    dbms_output.put_line('이름:  ' || emp_record.emp_name);
    dbms_output.put_line('부서 : ' || emp_record.dept_title);
     dbms_output.put_line('직급: ' || emp_record.job_name);
end;
/

declare
    emp_id employee.emp_id%type;
    emp_name employee.emp_name%type;
    salary employee.salary%type;
    bonus employee.bonus%type;
begin
    select emp_id,emp_name,salary,nvl(bonus,0)
    into emp_id,emp_name,salary,bonus
    from employee
    where emp_id = '&emp_id';
     dbms_output.put_line('사번 : ' || emp_id);
    dbms_output.put_line('이름 : ' || emp_name);
    dbms_output.put_line('급여 : ' || salary);
    
    if(bonus = 0) then 
    dbms_output.put_line('보너스를 지급받지 않는 사원입니다.');
     dbms_output.put_line('보너스를 지급받지 않는 사원입니다.');
    end if;
    
    dbms_output.put_line('보너스율 :' || bonus * 100 || '%');
end;
/

declare
    emp_id employee.emp_id%type;
    emp_name employee.emp_name%type;
    dept_title department.dept_title%type;
    national_code location.national_code%type;
    team varchar2(20);
begin
    select emp_id, emp_name, dept_title, national_code
    into emp_id, emp_name, dept_title, national_code
    from employee e, department d, location l
    where e.dept_code = d.dept_id
            and d.location_id = l.local_code
            and emp_id = '&emp_id';
    
    if(national_code = 'ko') then team := '국내팀';
    else team := '해외팀';
    end if;
    
    dbms_output.put_line('사번 : ' || emp_id);
    dbms_output.put_line('이름 : ' || emp_name);
    dbms_output.put_line('부서 : ' || dept_title);
    dbms_output.put_line('소속 : ' || team);
end;
/

declare
    dup_empno exeception;
    PRAGMA exception_INIT(dup_empno, -00001);
begin 
    update employee
    set emp_id ='&사번'
    where emp_id = 200;
exception
    when dup_empno
    then dbms_output.put_line('이미 존재하는 사번입니다.');
end;
/

-- procedure 만들기
-- 사원번호를 전달받아서 이름, 급여, 업무를 반환함.
create or replace procedure PRO_EMP_ARG_TEST
    (ARG_EMPNO in EMP.EMPNO%TYPE, ARG_ENAME out EMP.ENAME%TYPE )
is

begin
    dbms.output.put.line('ARG_ENPNO: ' || ARG_EMPNO);
    -- procedure는 return 없음 - 대신 매개변수에 IN/OUT 를 설정해서 out로 설정하면 그것이 return 
    -- function는 return 있음    
end;
/

create or replace procedure pro_all_emp
is
begin
    for e in (select * from employee) loop
       select_empid(e.emp_id, e.emp_name, e.salary, e.bonus);
       dbms_output.put_line(e.emp_name ||', '|| e.salary||', '||e.bonus);
    end loop;
end;
/
exec pro_all_emp;


declare 
    v_empno number(4) := 7788;
    v_ename varchar2(10);
begin
    v_ename := 'scott';
    dbms_output.put_line('v_empno : ' || v_empno);
    dbms_output.put_line('v_ename : ' || v_ename);
end;
/

declare
    v_tax constant number(1) := 3;
begin
    dbms_output.put_line('v_tex : ' || v_tax);
end;
/

declare 
    v_deptno number(2) default 10;
begin
    dbms_output.put_line('v_deptno : ' || v_deptno);
end;
/

