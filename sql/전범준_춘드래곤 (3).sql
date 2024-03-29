DROP TABLE "grade";
DROP TABLE "student";
DROP TABLE "TB_CLASS_PROFESSOR";
DROP TABLE "TB_CLASS";
DROP TABLE "TB_PROFESSOR";
DROP TABLE "TB_DEPARTMENT";

CREATE TABLE "student" (
	"STUDENT_NO"	VARCHAR2(10)		NOT NULL,
	"DEPARTMENT_NO2"	VARCHAR2(10)		NOT NULL,
	"STUDENT_NAME"	VARCHAR2(30)		NOT NULL,
	"STUDENT__SSN"	VARCHAR(14)		NULL,
	"STUDENT_ADDRESS"	VARCHAR2(100)		NULL,
	"ENTRANCE_DATE"	DATE		NULL,
	"ABSENCE_YN"	CHAR(1)		NULL,
	"PROFESSOR_NO2"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "student"."STUDENT_NO" IS '학번YYYY_구성';

COMMENT ON COLUMN "student"."DEPARTMENT_NO2" IS '학과번호';

COMMENT ON COLUMN "student"."STUDENT_NAME" IS '학생이름';

COMMENT ON COLUMN "student"."STUDENT__SSN" IS '학생 주민번호';

COMMENT ON COLUMN "student"."STUDENT_ADDRESS" IS '학생 주소';

COMMENT ON COLUMN "student"."ENTRANCE_DATE" IS '입학일자';

COMMENT ON COLUMN "student"."ABSENCE_YN" IS '휴학 여부';

COMMENT ON COLUMN "student"."PROFESSOR_NO2" IS '지도교수번호';



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


CREATE TABLE "grade" (
	"TERM_NO"	VARCHAR2(10)		NOT NULL,
	"CLASS_NO2"	VARCHAR2(10)		NOT NULL,
	"STUDENT_NO"	VARCHAR2(10)		NOT NULL,
	"POINT"	NUMBER(3,2)		NULL
);

COMMENT ON COLUMN "grade"."TERM_NO" IS '학기번호';

COMMENT ON COLUMN "grade"."CLASS_NO2" IS '과목 번호';

COMMENT ON COLUMN "grade"."STUDENT_NO" IS '학생번호';

COMMENT ON COLUMN "grade"."POINT" IS '학점';

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

DROP TABLE "TB_CLASS";

CREATE TABLE "TB_CLASS" (
	"CLASS_NO"	VARCHAR2(10)		NOT NULL,
	"DEPARTMENT_NO"	VARCHAR2(10)		NOT NULL,
	"PREATTENDING_CLASS_NO"	VARCHAR2(10)		NULL,
	"CLASS_NAME"	VARCHAR2(30)		NOT NULL,
	"CLASS_TYPE"	VARCHAR2(10)		NULL
);

COMMENT ON COLUMN "TB_CLASS"."CLASS_NO" IS '과목 번호';

COMMENT ON COLUMN "TB_CLASS"."DEPARTMENT_NO" IS '학과번호';

COMMENT ON COLUMN "TB_CLASS"."PREATTENDING_CLASS_NO" IS '선수 과목 번호';

COMMENT ON COLUMN "TB_CLASS"."CLASS_NAME" IS '과목 이름';

COMMENT ON COLUMN "TB_CLASS"."CLASS_TYPE" IS '과목 구분';

ALTER TABLE "student" ADD CONSTRAINT "PK_STUDENT" PRIMARY KEY (
	"STUDENT_NO"
);

ALTER TABLE "TB_DEPARTMENT" ADD CONSTRAINT "PK_TB_DEPARTMENT" PRIMARY KEY (
	"DEPARTMENT_NO"
);

ALTER TABLE "TB_CLASS_PROFESSOR" ADD CONSTRAINT "PK_TB_CLASS_PROFESSOR" PRIMARY KEY (
	"CLASS_NO",
	"PROFESSOR_NO2"
);

ALTER TABLE "grade" ADD CONSTRAINT "PK_GRADE" PRIMARY KEY (
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

ALTER TABLE "student" ADD CONSTRAINT "FK_TB_DEPARTMENT_TO_student_1" FOREIGN KEY (
	"DEPARTMENT_NO2"
)
REFERENCES "TB_DEPARTMENT" (
	"DEPARTMENT_NO"
);

ALTER TABLE "student" ADD CONSTRAINT "FK_TB_PROFESSOR_TO_student_1" FOREIGN KEY (
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

ALTER TABLE "grade" ADD CONSTRAINT "FK_TB_CLASS_TO_grade_1" FOREIGN KEY (
	"CLASS_NO2"
)
REFERENCES "TB_CLASS" (
	"CLASS_NO"
);

ALTER TABLE "grade" ADD CONSTRAINT "FK_student_TO_grade_1" FOREIGN KEY (
	"STUDENT_NO"
)
REFERENCES "student" (
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

