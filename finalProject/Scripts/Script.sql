SELECT * FROM users;

DELETE users
WHERE user_name='김은수';

SELECT * FROM PROJECT;

SELECT * FROM chat;

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

SELECT * FROM CHAT;
SELECT * FROM users;
SELECT * FROM PROJECT;
SELECT * FROM team;
SELECT * FROM COMPANY c ;

INSERT INTO chat (
    CHATROOM_ID, CHATROOM_NAME, OWNER_ID, USER_ID, BAN_STATUS, BAN_DATE, UPTDATE, PROJECT_ID
) VALUES (
    'CHT_'||TO_CHAR(chat_seq.nextval, 'FM0000'), '잡담방', 'N_0047', 'N_0020', 'N', NULL, NULL, 'PRO_0001'
);

INSERT INTO TEAM t (project_id, user_id)
VALUES ('PRO_0003')

-- final 프로젝트 팀 구성
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0001', 'P_0001');  -- 박민경
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0001', 'M_0021');  -- 홍길동
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0001', 'N_0047');  -- 김은수
SELECT * FROM TEAM;

-- PMS 프로젝트 팀 구성
-- PRO_0001: final 프로젝트에 추가 팀 구성
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0003', 'P_0001');  -- 박민경
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0003', 'M_0022');  -- 이수현
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0003', 'P_0023');  -- 유재석

INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0001', 'M_0022');  -- 이수현
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0001', 'P_0023');  -- 유재석
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0001', 'M_0024');  -- 강호동
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0001', 'M_0025');  -- 신동엽

DELETE FROM TEAM t WHERE USER_ID='N_0047';

-- 티켓예매사이트(H_link) 팀 구성
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0023', 'M_0024');  -- 강호동
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0023', 'M_0025');  -- 신동엽
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0023', 'N_0047');  -- 김은수

-- 디자인 팀 구성
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0024', 'P_0001');  -- 박민경
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0024', 'M_0021');  -- 홍길동
INSERT INTO team (PROJECT_ID, USER_ID) VALUES ('PRO_0024', 'M_0022');  -- 이수현


SELECT * FROM chat; 
SELECT * FROM project;
SELECT * FROM users;
SELECT * FROM TEAM t; 

SELECT CHATROOM_ID, CHATROOM_NAME, user_id FROM CHAT
WHERE OWNER_ID ='N_0047'
and project_id= 'PRO_0001';

--채팅 각 프로젝트에 대한 팀원 리스트(로그인 사용자 제외)
SELECT u.USER_ID, u.USER_NAME
FROM users u
JOIN team t ON u.USER_ID = t.USER_ID
WHERE t.PROJECT_ID = 'PRO_0001'
AND u.USER_ID != 'N_0047';

INSERT INTO company (COMPANY_ID, COMPANY_NAME, LOGO)
VALUES 
('COM_'||TO_CHAR(COMPANY_seq.nextval, 'FM0000'), 'METAVERSE', 'https://metaverse.com/logo.png');

SELECT * FROM COMPANY c;
SELECT * FROM PROJECT p ;

INSERT INTO project (PROJECT_ID, PROJECT_NAME, ETC, START_DATE, END_DATE, CREATE_DATE, PSTATUS, COMPANY_ID)
VALUES 
('PRO_' || TO_CHAR(COMPANY_seq.nextval, 'FM0000'), 'KartRider Drift', 'Creating new tracks and vehicles', '2023-03-25', '2023-08-25', '2023-03-25', 0, 'COM_0002');

INSERT INTO team (PROJECT_ID, USER_ID)
VALUES
('PRO_0006', 'N_0047');,

-- Naver Projects
('PRO_0007', 'M_0003'), -- Naver AI Development
('PRO_0007', 'P_0001'),
('PRO_0007', 'M_0021'),
('PRO_0008', 'M_0022'), -- Naver Search Enhancement
('PRO_0008', 'P_0023'),
('PRO_0008', 'M_0024'),

-- Nexon Projects
('PRO_0010', 'M_0003'), -- MapleStory New Village
('PRO_0010', 'P_0001'),
('PRO_0010', 'M_0021'),
('PRO_0011', 'M_0022'), -- Dungeon Fighter Online
('PRO_0011', 'P_0023'),
('PRO_0011', 'M_0024'),
('PRO_0012', 'M_0025'), -- KartRider Drift
('PRO_0012', 'M_0026');

SELECT * FROM CHAT c;
SELECT * FROM users;

DELETE CHAT
WHERE CHATROOM_name = 'M_0003';


INSERT INTO chat (
    chatroom_id, chatroom_name, owner_id, user_id, ban_status, BAN_DATE, UPTDATE, project_id
)
SELECT
    'CHT_' || TO_CHAR(chat_seq.nextval, 'FM0000'),
    'M_0003',
    'N_0047',
    'M_0003',
    'N',
    NULL,
    NULL,
    'PRO_0001'
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM chat
    WHERE owner_id = 'N_0047'
      AND user_id = 'M_0003'
);


 