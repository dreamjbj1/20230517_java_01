DROP TABLE "TB_GRADE";
DROP TABLE "TB_STUDENT";
DROP TABLE "TB_CLASS_PROFESSOR";
DROP TABLE "TB_CLASS";
DROP TABLE "TB_PROFESSOR";
DROP TABLE "TB_DEPARTMENT";

CREATE TABLE "TB_STUDENT" (
	"STUDENT_NO"	VARCHAR2(10)		NOT NULL,
	"DEPARTMENT_NO2"	VARCHAR2(10)		NOT NULL,
	"STUDENT_NAME"	VARCHAR2(30)		NOT NULL,
	"STUDENT__SSN"	VARCHAR(14)		NULL,
	"STUDENT_ADDRESS"	VARCHAR2(100)		NULL,
	"ENTRANCE_DATE"	DATE		NULL,
	"ABSENCE_YN"	CHAR(1)		NULL,
	"PROFESSOR_NO2"	VARCHAR2(10)		NULL
);

COMMENT ON COLUMN "TB_STUDENT"."STUDENT_NO" IS '학번YYYY_구성';

COMMENT ON COLUMN "TB_STUDENT"."DEPARTMENT_NO2" IS '학과번호';

COMMENT ON COLUMN "TB_STUDENT"."STUDENT_NAME" IS '학생이름';

COMMENT ON COLUMN "TB_STUDENT"."STUDENT__SSN" IS '학생 주민번호';

COMMENT ON COLUMN "TB_STUDENT"."STUDENT_ADDRESS" IS '학생 주소';

COMMENT ON COLUMN "TB_STUDENT"."ENTRANCE_DATE" IS '입학일자';

COMMENT ON COLUMN "TB_STUDENT"."ABSENCE_YN" IS '휴학 여부';

COMMENT ON COLUMN "TB_STUDENT"."PROFESSOR_NO2" IS '지도교수번호';

CREATE TABLE "TB_DEPARTMENT" (
	"DEPARTMENT_NO"	VARCHAR2(10)		NOT NULL,
	"DEPARTMENT_NAME"	VARCHAR2(20)		NOT NULL,
	"CATEGORY"	VARCHAR2(20)		NULL,
	"OPEN_YN"	CHAR(1)		NULL,
	"CAPACITY"	NUMBER		NULL
);

COMMENT ON COLUMN "TB_DEPARTMENT"."DEPARTMENT_NO" IS '학과번호';

COMMENT ON COLUMN "TB_DEPARTMENT"."DEPARTMENT_NAME" IS '학과이름';

COMMENT ON COLUMN "TB_DEPARTMENT"."CATEGORY" IS '계열';

COMMENT ON COLUMN "TB_DEPARTMENT"."OPEN_YN" IS '개설여부';

COMMENT ON COLUMN "TB_DEPARTMENT"."CAPACITY" IS '정원';

CREATE TABLE "TB_CLASS_PROFESSOR" (
	"CLASS_NO"	VARCHAR2(10)		NOT NULL,
	"PROFESSOR_NO2"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "TB_CLASS_PROFESSOR"."CLASS_NO" IS '과목 번호';

COMMENT ON COLUMN "TB_CLASS_PROFESSOR"."PROFESSOR_NO2" IS '교수번호';



CREATE TABLE "TB_GRADE" (
	"TERM_NO"	VARCHAR2(10)		NOT NULL,
	"CLASS_NO2"	VARCHAR2(10)		NOT NULL,
	"STUDENT_NO"	VARCHAR2(10)		NOT NULL,
	"POINT"	NUMBER(3,2)		NULL
);

COMMENT ON COLUMN "TB_GRADE"."TERM_NO" IS '학기번호';

COMMENT ON COLUMN "TB_GRADE"."CLASS_NO2" IS '과목 번호';

COMMENT ON COLUMN "TB_GRADE"."STUDENT_NO" IS '학생번호';

COMMENT ON COLUMN "TB_GRADE"."POINT" IS '학점';



CREATE TABLE "TB_PROFESSOR" (
	"PROFESSOR_NO"	VARCHAR2(10)		NOT NULL,
	"PROFESSOR_NAME"	VARCHAR2(30)		NOT NULL,
	"PROFESSOR_SSN"	VARCHAR2(14)		NULL,
	"PROFESSOR_ADDRESS"	VARCHAR2(100)		NULL,
	"DEPARTMENT_NO"	VARCHAR2(10)		NULL,
	"DEPARTMENT_NO2"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "TB_PROFESSOR"."PROFESSOR_NO" IS '교수번호';
COMMENT ON COLUMN "TB_PROFESSOR"."PROFESSOR_NAME" IS '교수 이름';
COMMENT ON COLUMN "TB_PROFESSOR"."PROFESSOR_SSN" IS '교수 주민번호';
COMMENT ON COLUMN "TB_PROFESSOR"."PROFESSOR_ADDRESS" IS '교수 주소';
COMMENT ON COLUMN "TB_PROFESSOR"."DEPARTMENT_NO" IS '학과 번호';
COMMENT ON COLUMN "TB_PROFESSOR"."DEPARTMENT_NO2" IS '학과번호';


CREATE TABLE "TB_CLASS" (
	"CLASS_NO"	VARCHAR2(10)		NOT NULL,
	"DEPARTMENT_NO"	VARCHAR2(10)		NOT NULL,
	"PREATTENDING_CLASS_NO"	VARCHAR2(20)		NULL,
	"CLASS_NAME"	VARCHAR2(30)		NOT NULL,
	"CLASS_TYPE"	VARCHAR2(20)		NULL
);

COMMENT ON COLUMN "TB_CLASS"."CLASS_NO" IS '과목 번호';

COMMENT ON COLUMN "TB_CLASS"."DEPARTMENT_NO" IS '학과번호';

COMMENT ON COLUMN "TB_CLASS"."PREATTENDING_CLASS_NO" IS '선수 과목 번호';

COMMENT ON COLUMN "TB_CLASS"."CLASS_NAME" IS '과목 이름';

COMMENT ON COLUMN "TB_CLASS"."CLASS_TYPE" IS '과목 구분';

ALTER TABLE "TB_STUDENT" ADD CONSTRAINT "PK_TB_STUDENT" PRIMARY KEY (
	"STUDENT_NO"
);

ALTER TABLE "TB_DEPARTMENT" ADD CONSTRAINT "PK_TB_DEPARTMENT" PRIMARY KEY (
	"DEPARTMENT_NO"
);

ALTER TABLE "TB_CLASS_PROFESSOR" ADD CONSTRAINT "PK_TB_CLASS_PROFESSOR" PRIMARY KEY (
	"CLASS_NO",
	"PROFESSOR_NO2"
);

ALTER TABLE "TB_GRADE" ADD CONSTRAINT "PK_TB_GRADE" PRIMARY KEY (
	"TERM_NO",
	"CLASS_NO2",
	"STUDENT_NO"
);

ALTER TABLE "TB_PROFESSOR" ADD CONSTRAINT "PK_TB_PROFESSOR" PRIMARY KEY (
	"PROFESSOR_NO"
);

ALTER TABLE "TB_CLASS" ADD CONSTRAINT "PK_TB_CLASS" PRIMARY KEY (
	"CLASS_NO"
);

ALTER TABLE "TB_STUDENT" ADD CONSTRAINT "FK_TB_DEPARTMENT_TO_TB_STUDENT_1" FOREIGN KEY (
	"DEPARTMENT_NO2"
)
REFERENCES "TB_DEPARTMENT" (
	"DEPARTMENT_NO"
);

ALTER TABLE "TB_STUDENT" ADD CONSTRAINT "FK_TB_PROFESSOR_TO_TB_STUDENT_1" FOREIGN KEY (
	"PROFESSOR_NO2"
)
REFERENCES "TB_PROFESSOR" (
	"PROFESSOR_NO"
);

ALTER TABLE "TB_CLASS_PROFESSOR" ADD CONSTRAINT "FK_TB_CLASS_TO_TB_CLASS_PROFESSOR_1" FOREIGN KEY (
	"CLASS_NO"
)
REFERENCES "TB_CLASS" (
	"CLASS_NO"
);

ALTER TABLE "TB_CLASS_PROFESSOR" ADD CONSTRAINT "FK_TB_PROFESSOR_TO_TB_CLASS_PROFESSOR_1" FOREIGN KEY (
	"PROFESSOR_NO2"
)
REFERENCES "TB_PROFESSOR" (
	"PROFESSOR_NO"
);

ALTER TABLE "TB_GRADE" ADD CONSTRAINT "FK_TB_CLASS_TO_TB_GRADE_1" FOREIGN KEY (
	"CLASS_NO2"
)
REFERENCES "TB_CLASS" (
	"CLASS_NO"
);

ALTER TABLE "TB_GRADE" ADD CONSTRAINT "FK_TB_STUDENT_TO_TB_GRADE_1" FOREIGN KEY (
	"STUDENT_NO"
)
REFERENCES "TB_STUDENT" (
	"STUDENT_NO"
);

ALTER TABLE "TB_PROFESSOR" ADD CONSTRAINT "FK_TB_DEPARTMENT_TO_TB_PROFESSOR_1" FOREIGN KEY (
	"DEPARTMENT_NO2"
)
REFERENCES "TB_DEPARTMENT" (
	"DEPARTMENT_NO"
);

ALTER TABLE "TB_CLASS" ADD CONSTRAINT "FK_TB_DEPARTMENT_TO_TB_CLASS_1" FOREIGN KEY (
	"DEPARTMENT_NO"
)
REFERENCES "TB_DEPARTMENT" (
	"DEPARTMENT_NO"
);

PROMPT LOADING TB_DEPARTMENT...
INSERT INTO TB_DEPARTMENT (DEPARTMENT_NO, DEPARTMENT_NAME, CATEGORY, OPEN_YN, CAPACITY)
VALUES ('001', '국어국문학과', '인문사회', 'Y', 20);
INSERT INTO TB_DEPARTMENT (DEPARTMENT_NO, DEPARTMENT_NAME, CATEGORY, OPEN_YN, CAPACITY)
VALUES ('002', '영어영문학과', '인문사회', 'Y', 36);
PROMPT LOADING TB_CLASS...
INSERT INTO TB_CLASS (CLASS_NO, DEPARTMENT_NO, PREATTENDING_CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('C0245500', '001', NULL, '고전시가론특강', '전공선택');
INSERT INTO TB_CLASS (CLASS_NO, DEPARTMENT_NO, PREATTENDING_CLASS_NO, CLASS_NAME, CLASS_TYPE)
VALUES ('C0405000', '001', NULL, '국어어휘론특강', '전공선택');
