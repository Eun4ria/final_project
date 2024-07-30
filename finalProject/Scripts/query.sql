-- 아이디 찾기
UPDATE USERS
SET PASSWORD = 'min1213!'
WHERE USER_ID = 'P_0001' AND USER_NAME = '박민경' AND EMAIL = 'loverymin1213@gmail.com' ;
SELECT * FROM users;



-- 간트 차트 조회
SELECT 
    t.task_id AS id, 
    t.task_name AS text, 
    t.start_date, 
    (t.end_date - t.start_date) AS duration,
    t.priority,
    u.user_name AS "user",
    CASE 
        WHEN parent_id IS NULL THEN 1
        ELSE 0
    END AS open, -- TRUE FALSE 값으로 받기 위해 parent_id가 null일 경우 1, null이 아닐 경우 0
    NVL(parent_id, '0') AS parent -- parent_id가 null일 경우 0
FROM task t
JOIN 
    users u ON t.user_id = u.user_id
WHERE project_id='PRO_0001';

SELECT 
    u.user_name AS name,
    u.user_id AS id
FROM users u
JOIN team t ON u.user_id = t.user_id
WHERE t.project_id = 'PRO_0001';



SELECT * FROM task;
INSERT INTO task (task_id, task_name, start_date, end_date, priority, parent_id, content, progress, backgroundcolor, textcolor, tstatus, user_id, project_id)
VALUES ('TSK_'||TO_CHAR(task_seq.nextval, 'FM0000'), '설계', TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-07-24', 'YYYY-MM-DD'), '높음', NULL, '설계', 50, '#FFFFFF', '#000000', '진행중', 'P_0001', 'PRO_0001');