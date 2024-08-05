SELECT * FROM users;

SELECT * FROM PROJECT;

SELECT * FROM task;

SELECT p.PROJECT_ID, p.PROJECT_NAME, p.ETC, p.START_DATE, p.END_DATE, p.CREATE_DATE, p.PSTATUS, p.COMPANY_ID
FROM project p
JOIN users u ON u.COMPANY_ID = p.COMPANY_ID
WHERE u.USER_ID = 'P_0012';

UPDATE TASK 
SET TASK_NAME = '프로젝트 관리'
WHERE TASK_NAME = 'FRONT';
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
			  t.user_id = 'PRO_0012';
			  
			 -- 프로젝트 매핑 추가
INSERT INTO task (TASK_ID, TASK_NAME, START_DATE, END_DATE, PRIORITY, PARENT_ID, CONTENT, PROGRESS, BACKGROUNDCOLOR, TEXTCOLOR, TSTATUS, USER_ID, PROJECT_ID)
VALUES ('TSK_0002', 'FRONT', TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-07-24', 'YYYY-MM-DD'), '상', NULL, '관리', 100, 'yellow', 'black', '진행중', 'P_0012', 'PRO_0001');

-- 팀원 매핑 추가
INSERT INTO task (TASK_ID, TASK_NAME, START_DATE, END_DATE, PRIORITY, PARENT_ID, CONTENT, PROGRESS, BACKGROUNDCOLOR, TEXTCOLOR, TSTATUS, USER_ID, PROJECT_ID)
VALUES 
('TSK_0004', '테스트', TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-07-24', 'YYYY-MM-DD'), '중', NULL, '테스트 작업', 20, 'green', 'black', '진행중', 'M_0022', 'PRO_0001');

-- 프로젝트 업무 추가
INSERT INTO task (TASK_ID, TASK_NAME, START_DATE, END_DATE, PRIORITY, PARENT_ID, CONTENT, PROGRESS, BACKGROUNDCOLOR, TEXTCOLOR, TSTATUS, USER_ID, PROJECT_ID)
VALUES 
('TSK_0005', '디자인', TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-07-24', 'YYYY-MM-DD'), '중', NULL, '디자인 작업', 30, 'purple', 'white', '진행중', 'M_0026', 'PRO_0001');


SELECT * FROM users WHERE USER_ID = 'P_0012';

UPDATE users 
SET image='https://i.namu.wiki/i/Bge3xnYd4kRe_IKbm2uqxlhQJij2SngwNssjpjaOyOqoRhQlNwLrR2ZiK-JWJ2b99RGcSxDaZ2UCI7fiv4IDDQ.webp'
WHERE image is NULL;

ALTER TABLE users
MODIFY image DEFAULT 'https://i.namu.wiki/i/Bge3xnYd4kRe_IKbm2uqxlhQJij2SngwNssjpjaOyOqoRhQlNwLrR2ZiK-JWJ2b99RGcSxDaZ2UCI7fiv4IDDQ.webp';


SELECT * FROM CHAT
WHERE user_id = 'M_0003'
and project_id='PRO_0001';

SELECT * FROM CHAT;

SELECT * FROM CHAT c WHERE project_id='PRO_0001';

SELECT * FROM users;
DELETE FROM USERS u 
WHERE USER_NAME = '남지연';




