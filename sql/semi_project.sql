


-- 테이블 생성

CREATE TABLE PRO_USER
( 
    user_id                NUMBER	 CONSTRAINT user_id_seq PRIMARY KEY,
    user_name           VARCHAR2(20) NOT NULL,
    user_address          VARCHAR2(200) NOT NULL,
    user_email           VARCHAR2(200) NOT NULL,
    user_gradeId        VARCHAR2(20) NOT NULL,
    registerDate        DATE default sysdate NOT NULL,,
    modifyDate        DATE
    
    CONSTRAINT emp_pk PRIMARY KEY (empno)
);


CREATE SEQUENCE user_id_seq
(
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE
);





CREATE TABLE PRO_review
( 
    review_id            NUMBER  CONSTRAINT review_id_seq PRIMARY KEY, 
    board_id              NUMBER, 
    title                   VARCHAR2(20) NOT NULL,
    content              VARCHAR2(2000) NOT NULL,
    rating                NUMBER NOT NULL,
    registerDate        DATE default sysdate NOT NULL,,
    modifyDate        DATE
    
    
);


CREATE SEQUENCE review_id_seq
(
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE
);


----------------------------------------------------------- semi ------------------




SELECT * FROM PRO_BOARD;

INSERT INTO PRO_BOARD
(board_id, user_id, title, content,  readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 1, '제목 테스트', '본문 테스트', 5, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 2, '제목2 테스트', '본문2 테스트',0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content,  readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 3, '제목3 테스트', '본문3 테스트',0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content,readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 4, '제목4 테스트', '본문4 테스트',0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 5, '제목5 테스트', '본문5 테스트', 0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content,readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 6, '제목6 테스트', '본문6 테스트',0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 7, '제목7 테스트', '본문7 테스트', 0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 8, '제목8 테스트', '본문8 테스트', 0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 9, '제목9 테스트', '본문9 테스트', 0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 10, '제목10 테스트', '본문10 테스트', 0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 11, '제목11 테스트', '본문11 테스트', 0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 12, '제목12 테스트', '본문12 테스트', 0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 13, '제목13 테스트', '본문13 테스트', 0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 14, '제목14 테스트', '본문14 테스트', 0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 15, '제목15 테스트', '본문15 테스트', 0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 16, '제목16 테스트', '본문16 테스트', 0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 17, '제목17 테스트', '본문17 테스트', 0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 18, '제목18 테스트', '본문18 테스트',0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 19, '제목19 테스트', '본문19 테스트',0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 24, '제목24 테스트', '본문20` 테스트',0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 32, '제목111 테스트', '본문21` 테스트',0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 31, '제목333 테스트', '본문29` 테스트',0, sysdate, null);

INSERT INTO PRO_BOARD
(board_id, user_id, title, content, readCount, registerDate, modifyDate)
VALUES (board_id_seq.nextval, 30, '제목222 테스트', '본문28` 테스트',0, sysdate, null);

commit;


SELECT * FROM PRO_BOARD;

DROP TABLE PRO_BOARD;

commit;



CREATE TABLE PRO_BOARD
( 
    board_id        NUMBER  CONSTRAINT board_id_seq PRIMARY KEY, 
    user_id         VARCHAR2(100) NOT NULL,
    title           VARCHAR2(20) NOT NULL,
    content         VARCHAR2(2000) NOT NULL,

    readCount       NUMBER,
    registerDate    DATE default sysdate NOT NULL,
    modifyDate      DATE

);

CREATE TABLE PRO_BOARD_detail
( 
   
    content VARCHAR2(2000) NOT NULL
   

);

DROP SEQUENCE board_id_seq;

CREATE SEQUENCE board_id_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;





DROP TABLE SALES_INFO;

DROP TABLE CUSTOMER_info;

SELECT * FROM CUSTOMER_info;

SELECT * FROM SALES_INFO;

        SELECT b.* FROM 
    (SELECT rownum rm ,a.* FROM 
         (SELECT
		     board_id
		   , user_id
		   , title
		   , content
		   , readCount
		   , registerDate
		   , modifyDate
		 FROM
		  	PRO_BOARD
            ORDER BY board_id DESC
            )a ORDER BY rm ASC)b
            WHERE b.rm BETWEEN 1 AND 5;
            
		  ORDER BY registerDate DESC;
          
          
SELECT count(*) FROM PRO_BOARD 
		
			WHERE title LIKE '%제목%';
            
            
            SELECT b.* FROM 
   		 (SELECT 
   		     rownum rm 
   		 	,a.* 
   		 FROM 
         (SELECT
		     board_id
		   , user_id
		   , title
		   , content
		   , rating
		   , readCount
		   , registerDate
		   , modifyDate
		 FROM
		  	PRO_BOARD
		 <if test="searchWord != null">
			 WHERE title LIKE '%' || #{searchWord} || '%' 
	    </if>
	    ) a
  		
		     ORDER BY rm ASC)b
            WHERE b.rm BETWEEN #{startRow} AND #{endRow}
           
		  ORDER BY registerDate DESC;
          
          
          
          ALTER TABLE PRO_BOARD MODIFY user_id VARCHAR2(100);
          
          SELECT user_id, title, content  FROM PRO_BOARD WHERE board_id = 114;
          
          
          UPDATE
			 PRO_BOARD
		SET 
			title = 'ASASD'
			, content = 'asdasd'
			, modifyDate = SYSDATE	
		WHERE
		    board_id = 115;
            
            
            
            ALTER TABLE PRO_BOARD
MODIFY (title VARCHAR2(200));

commit;
            