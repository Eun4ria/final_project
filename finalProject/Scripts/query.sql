-- 아이디 찾기
UPDATE USERS
SET PASSWORD = 'min1213!'
WHERE USER_ID = 'P_0001' AND USER_NAME = '박민경' AND EMAIL = 'loverymin1213@gmail.com' ;
SELECT * FROM users;



-- 간트 차트 조회
SELECT 
    task_id AS id, 
    task_name AS text, 
    start_date, 
    (end_date - start_date) AS duration,
    priority,
    user_id AS "user",
    CASE 
        WHEN parent_id IS NULL THEN 1
        ELSE 0
    END AS open, -- TRUE FALSE 값으로 받기 위해 parent_id가 null일 경우 1, null이 아닐 경우 0
    NVL(parent_id, '0') AS parent -- parent_id가 null일 경우 0
FROM task
WHERE project_id='PRO_0001';