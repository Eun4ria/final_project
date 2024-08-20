SELECT * FROM budget;

UPDATE budget
			SET 
		   budget_name = #{budget_name},
			   amount = #{amount},
		   usedate = TO_DATE(#{usedate},'YYYY-MM-DD HH24:MI:SS'),
			  uptdate = TO_DATE(sysdate, 'YYYY-MM-DD HH24:MI:SS'),
		   project_id = #{project_id},
			   parent_id = #{parent_id},
			  etc = #{etc},
		  user_id = #{user_id}
			 WHERE  budget_id = #{budget_id};

UPDATE BUDGET
SET
    BUDGET_NAME = '예산 수정',
    AMOUNT = 70000000,
    uptdate = TO_DATE(sysdate, 'YYYY-MM-DD '),
    USEDATE = sysdate, -- 사용 예정일이 없는 경우
    PROJECT_ID = 'PRO_0003',
    PARENT_ID = 'BUG_0051',
    USER_ID = 'B_0047',
    ETC = '수정된 예산'
WHERE
    BUDGET_ID = 'BUG_0052';
   
SELECT* FROM budget;   
   SELECT * from(
	SELECT rownum cnt, LEVEL AS lvl, b.*
			FROM budget b
			WHERE project_id = 'PRO_0003'
		START WITH parent_id IS NULL
			CONNECT BY PRIOR budget_id = parent_id
			ORDER siblings BY budget_id DESC) ;
		
		
	SELECT * FROM budget WHERE  project_id = 'PRO_0003';
		
SELECT * FROM budget; 		

SELECT * FROM ( 
              SELECT LEVEL AS lvl, b.budget_id,  b.amount, b.parent_id 
             FROM budget b 
              WHERE b.project_id = 'PRO_0003' 
              START WITH b.parent_id IS NULL 
             CONNECT BY PRIOR b.budget_id = b.parent_id 
               ORDER SIBLINGS BY b.budget_id DESC 
            ) WHERE lvl != 1 AND parent_id = 'BUG_0023';
 
           
           
 SELECT
    child.budget_id,
    child.budget_name AS child_budget_name,
    parent.budget_name AS parent_budget_name,
    parent.budget_id AS parent_budget_id,
    child.amount AS amount,
    parent.amount AS amount
FROM
    (SELECT LEVEL AS lvl, b.budget_id, b.budget_name, b.amount, b.parent_id
     FROM budget b
     WHERE b.project_id = 'PRO_0003'
       START WITH b.parent_id IS NULL
     CONNECT BY PRIOR b.budget_id = b.parent_id
     ORDER SIBLINGS BY b.budget_id DESC
    ) child
JOIN budget parent
    ON child.parent_id = parent.budget_id
WHERE child.lvl != 1
  AND parent.budget_id = 'BUG_0023';

          







