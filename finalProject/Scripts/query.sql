SELECT
    sid,
    serial#,
    username,
    status,
    program
FROM
    v$session;
   
   ALTER SYSTEM KILL SESSION '161,2567';
  
SELECT
    l.session_id AS sid,
    l.locked_mode,
    s.username,
    s.program,
    s.serial#,
    s.status,
    s.osuser,
    s.machine
FROM
    v$locked_object l
    JOIN v$session s ON l.session_id = s.sid;
   
   ALTER SYSTEM KILL SESSION '114,3259';



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
    t.backgroundcolor AS color,
    t.textcolor,
    t.progress,
    u.user_id AS "user",
    u.user_name AS name,
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
    u.user_name AS text,
    u.user_id AS id
FROM users u
JOIN team t ON u.user_id = t.user_id
WHERE t.project_id = 'PRO_0001';

ALTER TABLE project
MODIFY  NUMBER(1,0) DEFAULT 1;
ALTER SEQUENCE project_seq START WITH 1;


SELECT * FROM project;
DROP SEQUENCE project_seq;

SELECT * FROM project;
INSERT INTO project (project_id, project_name, etc, start_date, end_date, create_date, company_id)
VALUES ('PRO_'||TO_CHAR(project_seq.nextval, 'FM0000'), 'final 프로젝트', '최종 프로젝트입니다.', TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-08-26', 'YYYY-MM-DD'), sysdate, 'COM_0001');

SELECT * FROM USERs;
-- 해당 사용자의 프로젝트 목록
SELECT p.*,
	t.*,
	b.AMOUNT ,
	u.image
FROM
    project p 
JOIN team t ON p.project_id = t.project_id
JOIN users u ON p.company_id=u.company_id
JOIN BUDGET b ON p.project_id=b.project_id
WHERE
    t.user_id = 'P_0012';
   
SELECT * FROM USERs;
   
   SELECT * FROM chat;
  
SELECT count(*) FROM chat
WHERE project_id='PRO_0000';
SELECT * FROM USERs;

SELECT u.*, p.project_id
FROM USERS u
JOIN project p ON u.user_id = u.user_id;

SELECT * FROM project;

SELECT * FROM team;
INSERT INTO team values('PRO_0002','M_0003');
INSERT INTO team values('PRO_0002','P_0012');

SELECT * FROM users;

update USERS
SET image='https://image.rocketpunch.com/company/5466/naver_logo.png?s=400x400&t=inside'
WHERE user_id='C_0001';

update USERS
SET image='https://an2-img.amz.wtchn.net/image/v2/GzFiTxs-FufrxcMLcvE0mA.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk1USTRNSGczTWpCeE9EQWlYU3dpY0NJNklpOTJNaTl6ZEc5eVpTOXBiV0ZuWlM4eE5qWTNNakF5TkRNeE1ESTFOREkxTVRZM0luMC5pNW5WNjBKVzB6azJMbmF6VlBfS2RPc1B3cGZYT2Qyanl6TDRCMnlZalBv'
WHERE user_id='P_0012';



ALTER TABLE users
ADD (image varchar2(500));

SELECT * FROM chat;

ALTER TABLE chat
RENAME COLUMN chatmem_id TO user_id;

SELECT *
FROM TEAM t
JOIN project p ON t.project_id = p.project_id
WHERE user_id='P_0012';
   

SELECT * FROM project;
INSERT INTO project (project_id, project_name, etc, start_date, end_date, create_date, pstatus, company_id)
VALUES ('PRO_'||TO_CHAR(project_seq.nextval, 'FM0000'), #{project_name}, #{project_name}, TO_DATE(#{start_date}, 'YYYY-MM-DD'), TO_DATE(#{end_date}, 'YYYY-MM-DD'), sysdate, 'COM_0001');
SELECT * FROM task;
INSERT INTO task (task_id, task_name, start_date, end_date, priority, parent_id, content, progress, backgroundcolor, textcolor, tstatus, user_id, project_id)
VALUES ('TSK_'||TO_CHAR(task_seq.nextval, 'FM0000'), '설계', TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-07-24', 'YYYY-MM-DD'), '높음', NULL, '설계', 50, '#FFFFFF', '#000000', '진행중', 'P_0001', 'PRO_0001');