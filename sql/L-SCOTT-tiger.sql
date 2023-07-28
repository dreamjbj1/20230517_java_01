-- 제약조건(constraints)
-- not null 예시
create table user_notnull(user_no number not null, user_id varchar2(20) not null, user_pwd varchar2(30) not null,
user_name varchar2(30), gender varchar2(10), phone varchar2(30), email varchar2(50));

insert into user_notnull values(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@kh.or.kr');

select * from user_notnull;

-- UNIQUE 예시
-- UNIQUE 예시1
create table user_unique(user_no number, user_id varchar2(20) unique, user_pwd varchar2(30)not null,
user_name varchar2(30), gender varchar2(10), phone varchar2(30), email varchar2(50));

insert into user_unique values(1,'user01','pass01','홍길동','남','010-1234-5678','hong123@kh.or.kr');
-- 제약조건 위배됨 insert into user_unique values(1,'user01','pass01', null, null, '010-1234-5678', 'hong123@kh.or.kr'); 

-- UNIQUE 예시2
create table user_unique2(user_no number, user_id varchar2(20) ,user_pwd varchar2(30)not null,
user_name varchar2(30), gender varchar2(10), phone varchar2(30), email varchar2(50), unique(user_id));

insert into user_unique2 values(1,'user01','pass01','홍길동','남','010-1234-5678','hong123@kh.or.kr');
insert into user_unique2 values(1,'user01','pass01',null,null,'010-1234-5678','hong123@kh.or.kr');
insert into user_unique2 values(1,null,'pass01','홍길동','남','010-1234-5678','hong123@kh.or.kr');
insert into user_unique2 values(1,null,'pass01','홍길동','남','010-1234-5678','hong123@kh.or.kr');

select * from user_unique2;

-- PRIMARY KEY 예시1
create table user_primarykey(user_no number primary key, user_id varchar2(20) unique, user_pwd varchar2(30) not null,
user_name varchar2(30), gender varchar2(10), phone varchar2(30), email varchar2(50));

insert into user_primarykey values(1,'user01','pass01','홍길동','남','010-1234-5678','hong123@kh.or.kr');
insert into user_primarykey values(1,'user02','pass02','이순신','남','010-5678-9012','lee123@kh.or.kr');
insert into user_primarykey values(null,'user03','pass03','유관순','여','010-3131-3131');

-- PRIMARY KEY 예시2
create table user_primarykey2(user_no number, user_id varchar2(20) , user_pwd varchar2(30) not null,
user_name varchar2(30), gender varchar2(10), phone varchar2(30), email varchar2(50), primary key (user_no,user_id));

insert into user_primarykey2 values(1,'user01','pass01','홍길동','남','010-1234-5678','hong123@kh.or.kr');
insert into user_primarykey2 values(1,'user02','pass02','이순신','남','010-5678-9012','lee123@kh.or.kr');
insert into user_primarykey2 values(2,'user01','pass01','유관순','여','010-3131-3131','yoo123@kh.or.kr');
insert into user_priamrykey2 values(1,'user01','pass01','신사임당','여','010-1111-1111','lee123@kh.or.kr');

select * from user_primarykey2;

-- FOREIGN KEY 예시
CREATE TABLE USER_GRADE(GRADE_CODE NUMBER PRIMARY KEY, GRADE_NAME VARCHAR2(30)NOT NULL);
INSERT INTO USER_GRADE VALUES(10,'일반회원');
INSERT INTO USER_GRADE VALUES(20,'우수회원');
INSERT INTO USER_GRADE VALUES(30,'특별회원');
INSERT INTO USER_GRADE VALUES(40,'일반회원');
SELECT * FROM USER_GRADE;

-- FOREIGN KEY 예시1
CREATE TABLE USER_FOREIGNKEY(USER_NO NUMBER PRIMARY KEY, USER_ID VARCHAR2(30) UNIQUE, USER_PWD VARCHAR2(30)NOT NULL,
USER_NAME VARCHAR2(30), GENDER VARCHAR2(10), PHONE VARCHAR2(30), EMAIL VARCHAR2(50), GRADE_CODE NUMBER,
FOREIGN KEY(GRADE_CODE) REFERENCES USER_GRADE(GRADE_CODE));

INSERT INTO USER_FOREIGNKEY VALUES(1,'USER01','PASS01','홍길동','남','010-1234-5678','HONG123@KH.OR.KR',10);
INSERT INTO USER_FOREIGNKEY VALUES(2,'USER02','PASS02','이순신','남','010-9012-3456','LEE123@KH.OR.KR',20);
INSERT INTO USER_FOREIGNKEY VALUES(3,'USER03','PASS03','유관순','여','010-3131-3131','YOO123@KH.OR.KR',30);
INSERT INTO USER_FOREIGNKEY VALUES(4,'USER04','PASS04','신사임당','여','010-1111-1111','SHIN123@KH.OR.KR',NULL);
INSERT INTO USER_FOREIGNKEY VALUES(5,'USER05','PASS05','안중근','남','010-4444-4444','AHN123@KH.OR.KR',40);

SELECT * FROM USER_FOREIGNKEY;