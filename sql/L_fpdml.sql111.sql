select * from food;
select * from diet;

select * from diet;

SELECT * FROM diet WHERE member_id = '77@77.77';

SELECT * FROM FOOD;

SELECT * FROM FOOD_APi;

SELECT 
       a.meal_code  
     , a.member_id
     , a.food_date
     , a.food_time
     , a.feedback
     , b.food_cd
     , b.FOOD_GP
     , b.meal_code
     , b.food_quality
     , c.food_name
     , c.calorie
     , c.crabs
     , c.protein
     , c.fat
       FROM 
       diet a
     , FOOD b
     , FOOD_APi c
 WHERE a.meal_code = b.meal_code
   AND b.food_cd = c.food_cd
   AND a.member_id = '77@77.77'
   AND a.food_time = 'A';
   
   ALTER TABLE FOOD ADD FOOD_GP NUMBER;
   
   SELECT * FROM FOOD;
   
  UPDATE FOOD
     SET FOOD_GP = 12
   WHERE meal_code = '2023092977@77.77D00009C'; 

commit;

select * from food;


SELECT * FROM diet;


commit;

SELECT *FROM diet;

SELECT * FROM food;



SELECT NVL(max(food_gp),0) as food_gp FROM food;
(SELECT NVL(max(food_gp),0) as food_gp FROM food);

commit;

select * from member;
select * from board;

alter table notice rename column notice_number to NOTICE_NO;

SELECT * FROM diet;

SELECT * FROM food;


delete from food where food_gp = 23;

commit;

---------------------------------

SELECT * FROM food_api;






SELECT 

      a.food_time
      ,round(avg(NVL(c.calorie,0)),2) as total_cal
      ,sum(c.crabs) as total_crabs
      ,sum(c.protein) as total_protein
      ,sum(fat) as total_fat
      FROM 
       diet a
     , FOOD b
     , FOOD_APi c
 WHERE a.meal_code = b.meal_code
   AND b.food_cd = c.food_cd
   AND a.member_id = '77@77.77'
  
   GROUP BY a.food_time;
      
   
 AND a.food_time = 'ALL';
 
 
 
 
 
 
 SELECT 
    
    sum(c.calorie) as total_cal
     ,sum(c.crabs) as total_crabs
      ,sum(c.protein) as total_protein
      ,sum(fat) as total_fat
    
      FROM 
       diet a
     , FOOD b
     , FOOD_APi c
 WHERE a.meal_code = b.meal_code
   AND b.food_cd = c.food_cd
   AND a.member_id = '77@77.77';
  
   GROUP BY a.food_time;
   
   
   
   insert into diet
	(
	  meal_code
	, member_id
	, food_date
	, food_time
	, feedback
	)
	SELECT 
	
	   #{mealCode, jdbcType=VARCHAR}
    	, #{memberId, jdbcType=VARCHAR}
     	, #{foodDate, jdbcType=VARCHAR}
     	, #{foodTime, jdbcType=VARCHAR}
     	, #{feedback, jdbcType=VARCHAR}
	FROM DUAL
    WHERE NOT EXISTS (SELECT 1 FROM diet WHERE mealCode = #{mealCode, jdbcType=VARCHAR})
    
    
    
