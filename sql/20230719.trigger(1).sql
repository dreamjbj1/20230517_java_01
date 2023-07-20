create or replace trigger TRG_01 
after insert on employee
begin 
dbms_output.put_line('신입사원이 입사했습니다.');
end;
/

CREATE OR REPLACE TRIGGER TRG_01
AFTER INSERT
ON EMPLOYEE
BEGIN
DBMS_OUTPUT.PUT_LINE('신입사원이 입사했습니다.');
END;
/

--insert into employee values(905, '길성춘', 690512-1151432','dfdfd@kh.or.kr',)


create table product(
    pcode number primary key,
    pname varchar2 (30),
    brand varchar2 (30),
    price number,
    stock number default 0);
    
create table pro_detail(
    dcode number primary key,
    pcode number,
    pdate date,
    amount number,
    status varchar2(10) check (status in ('입고', '출고')),
    foreign key (pcode) references product(pcode));
    
create sequence seq_pcode;
create sequence seq_dcode;

insert into product values(seq_pcode.nextval, '갤럭스노트8', '삼송', 900000, default);
insert into product values(seq_pcode.nextval, '아이뽀8', '사과', 1000000, default);
insert into product values(seq_pcode.nextval, '대륙폰', '샤우미', 600000, default);

select * from product;

create or replace trigger tgr_02
after insert on pro_detail
for each row
begin
if :new.status='입고'
then update product set stock = stock + :new.amount
where pcode = :new.pcode;
end if;

if :new.status='출고'
then
    update product set stock = stock - :new.amount
    where pcode = :new.pcode;
end if;

end; 
/

insert into pro_detail values(seq_dcode.nextval,1,sysdate,5,'입고');
insert into pro_detail values(seq_dcode.nextval,2,sysdate,10,'입고');
insert into pro_detail values(seq_dcode.nextval,3,sysdate,20,'입고');

insert into pro_detail values(seq_dcode.nextval,1,sysdate,1,'츨고');
insert into pro_detail values(seq_dcode.nextval,2,sysdate,7,'츨고');
insert into pro_detail values(seq_dcode.nextval,3,sysdate,11,'츨고');

select * from pro_detail;
select * from user_constraints where constraint_name='SYS_C008486';
select * from user_cons_columns  where constraint_name='SYS_C008486';
desc PRO_DETAIL;

select * from tb_department;
