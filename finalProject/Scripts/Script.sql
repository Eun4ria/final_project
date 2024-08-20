SELECT * FROM users;
SELECT * FROM chat;
SELECT * FROM TASK;
SELECT * FROM budget;

SELECT COUNT(*) FROM chat c
WHERE owner_id = 'N_0047'
AND user_id = 'M_0022'
AND project_id = 'PRO_0001';

DELETE users
WHERE user_id='N_0047';

DROP SEQUENCE CHATROOM_NAME_SEQ;

SELECT COUNT(*) FROM chat c 
WHERE ((owner_id = 'N_0047' AND user_id='P_0001')
OR (owner_id = 'P_0001' AND user_id='N_0047'))
AND project_id = 'PRO_0003';

SELECT * FROM PROJECT;
SELECT * FROM COMPANY c;
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

-- chat_seq 시퀀스 생성
CREATE SEQUENCE chat_seq
START WITH 1
INCREMENT BY 1;

-- chat_seq2 시퀀스 생성
CREATE SEQUENCE chatname_seq1
START WITH 1
INCREMENT BY 1;


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

SELECT * FROM chat;

DELETE chat
WHERE chatroom_name='M_0003';

SELECT * FROM task
WHERE user_id ='N_0047'
AND project_id = 'PRO_0003';

UPDATE task 
SET project_id='PRO_0003'
WHERE user_id = 'N_0047';

DELETE FROM CHAT c WHERE owner_id = 'N_0047' AND user_id <> 'P_0001';

CREATE SEQUENCE chatroom_name_seq
    START WITH 1
    INCREMENT BY 1;
    NOCACHE
    NOCYCLE;
   
SELECT * FROM chat;

SELECT * FROM CHAT 
WHERE project_id = 'PRO_0003'
AND (user_id = 'N_0047' OR owner_id='N_0047');

SELECT constraint_name
FROM user_constraints
WHERE table_name = 'CHAT'
  AND constraint_type = 'P';

ALTER TABLE CHAT DROP CONSTRAINT SYS_C007359;


CREATE TABLE chat (
    chatroom_id char(8) ,
    chatroom_name VARCHAR2(50) NOT NULL,
    owner_id char(8) NOT NULL,
    user_id char(8) NOT NULL,
    ban_status VARCHAR2(1),
    ban_date DATE,
    uptdate DATE DEFAULT SYSDATE,
    project_id char(8)
  
);
SELECT * FROM chat;

SELECT COUNT(*) FROM chat c 
WHERE owner_id = 'B_0047'
AND user_id = 'P_0001'
AND project_id = 'PRO_0003';

SELECT * FROM CHAT ;
WHERE project_id = 'PRO_0003'
AND  owner_id= 'B_0047';
AND owner_id != 'B_0047';

select chatroom_id, chatroom_name from chat 
where owner_id='B_0047' 
and user_id='P_0001';

// B_0047
// PRO_0003
// P_0001

/*
		@Select("SELECT COUNT(*) FROM chat c \r\n"
				+ "WHERE owner_id = #{owner_id}\r\n"
				+ "AND user_id = #{user_id}\r\n"
				+ "AND project_id = #{project_id}")
				
 * */

SELECT * FROM chat;
COMMIT;
SELECT COUNT(*) FROM chat c
				WHERE owner_id = 'B_0047'
				AND user_id = 'P_0001' 
				AND project_id = 'PRO_0003';
CREATE TABLE chat2
AS SELECT * FROM chat;
SELECT * FROM chat2;
COMMIT;
SELECT * FROM userfile;		


CREATE TABLE userfile (
    user_id char(6) PRIMARY KEY, -- 사용자 ID, 고유 식별자로 설정
    image VARCHAR2(100)              -- 이미지 파일 이름, 최대 길이 255자로 설정
         -- 기타 정보, 최대 길이 4000자로 설정
);

DROP TABLE userfile;
			
PRO_0003
P_0001
B_0047

SELECT * from(
SELECT rownum cnt, LEVEL, b.*
FROM budget b
WHERE project_id = 'PRO_0003'
START WITH parent_id IS NULL
CONNECT BY PRIOR budget_id = parent_id
ORDER siblings BY budget_id DESC)
WHERE CNT BETWEEN 1 AND 7;

SELECT count(*)
FROM BUDGET
WHERE project_id = 'PRO_0003';

SELECT * FROM BUDGET b 
WHERE project_id='PRO_0003';

SELECT * FROM BUDGET;

DELETE budget WHERE budget_id = 'BUG_0033';

delete budget 
where parent_id = #{budget_id};

SELECT * FROM BUDGET;
INSERT INTO budget (budget_id, budget_name, amount, regdate, usedate, project_id, parent_id, user_id)
VALUES ('BUG_'||TO_CHAR(budget_seq.nextval, 'FM0000'), '예산', 10000, sysdate, null, 'PRO_0003', NULL ,'B_0047');

SELECT * FROM budget;

ALTER TABLE budget
add (uptdate DATE) ;

SELECT * from(
			SELECT rownum cnt, LEVEL AS lvl, b.*
			FROM budget b
			WHERE project_id = 'PRO_0003'
			START WITH parent_id IS NULL
			CONNECT BY PRIOR budget_id = parent_id
			ORDER siblings BY budget_id DESC)
			WHERE lvl= 2 OR lvl =1;

INSERT INTO BUDGET (BUDGET_ID, BUDGET_NAME, AMOUNT, REGDATE, USEDATE, PROJECT_ID, PARENT_ID, USER_ID, ETC, UPTDATE) VALUES
('BUG_0102', '기술 지원 예산', 15000000, TO_DATE('2024-09-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'PRO_0011', 'BUG_0101', 'U_0002', '기술 관련 비용', NULL);

INSERT INTO BUDGET (BUDGET_ID, BUDGET_NAME, AMOUNT, REGDATE, USEDATE, PROJECT_ID, PARENT_ID, USER_ID, ETC, UPTDATE) VALUES
('BUG_0103', '연구 개발 예산', 30000000, TO_DATE('2024-09-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'PRO_0012', 'BUG_0101', 'U_0003', 'R&D 관련 비용', NULL);

INSERT INTO BUDGET (BUDGET_ID, BUDGET_NAME, AMOUNT, REGDATE, USEDATE, PROJECT_ID, PARENT_ID, USER_ID, ETC, UPTDATE) VALUES
('BUG_0104', '마케팅 예산', 20000000, TO_DATE('2024-09-07 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'PRO_0013', 'BUG_0101', 'U_0004', '마케팅 활동 비용', NULL);

INSERT INTO BUDGET (BUDGET_ID, BUDGET_NAME, AMOUNT, REGDATE, USEDATE, PROJECT_ID, PARENT_ID, USER_ID, ETC, UPTDATE) VALUES
('BUG_0105', '운영비 예산', 10000000, TO_DATE('2024-09-10 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'PRO_0014', 'BUG_0102', 'U_0005', '일상 운영비', NULL);	



-- 상위 예산 항목
INSERT INTO BUDGET (BUDGET_ID, BUDGET_NAME, AMOUNT, REGDATE, USEDATE, PROJECT_ID, PARENT_ID, USER_ID, ETC, UPTDATE) VALUES
('BUG_2001', '총괄 예산', 500000000, TO_DATE('2024-10-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'PRO_0020', NULL, 'U_0010', '전체 프로젝트 예산', NULL);

INSERT INTO BUDGET (BUDGET_ID, BUDGET_NAME, AMOUNT, REGDATE, USEDATE, PROJECT_ID, PARENT_ID, USER_ID, ETC, UPTDATE) VALUES
('BUG_2002', '연간 예산', 300000000, TO_DATE('2024-10-02 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'PRO_0021', NULL, 'U_0011', '연간 계획 예산', NULL);

-- 하위 예산 항목 1 (총괄 예산의 자식 항목)
INSERT INTO BUDGET (BUDGET_ID, BUDGET_NAME, AMOUNT, REGDATE, USEDATE, PROJECT_ID, PARENT_ID, USER_ID, ETC, UPTDATE) VALUES
('BUG_2003', '개발 예산', 150000000, TO_DATE('2024-10-03 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'PRO_0020', 'BUG_2001', 'U_0012', '개발 관련 비용', NULL);

-- 하위 예산 항목 2 (총괄 예산의 자식 항목)
INSERT INTO BUDGET (BUDGET_ID, BUDGET_NAME, AMOUNT, REGDATE, USEDATE, PROJECT_ID, PARENT_ID, USER_ID, ETC, UPTDATE) VALUES
('BUG_2004', '마케팅 예산', 80000000, TO_DATE('2024-10-04 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'PRO_0020', 'BUG_2001', 'U_0013', '마케팅 활동 비용', NULL);

-- 하위 예산 항목 3 (연간 예산의 자식 항목)
INSERT INTO BUDGET (BUDGET_ID, BUDGET_NAME, AMOUNT, REGDATE, USEDATE, PROJECT_ID, PARENT_ID, USER_ID, ETC, UPTDATE) VALUES
('BUG_2005', '자산 관리 예산', 50000000, TO_DATE('2024-10-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'PRO_0021', 'BUG_2002', 'U_0014', '자산 관리 비용', NULL);

-- 하위 예산 항목 4 (연간 예산의 자식 항목)
INSERT INTO BUDGET (BUDGET_ID, BUDGET_NAME, AMOUNT, REGDATE, USEDATE, PROJECT_ID, PARENT_ID, USER_ID, ETC, UPTDATE) VALUES
('BUG_2006', '운영 예산', 70000000, TO_DATE('2024-10-06 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'PRO_0021', 'BUG_2002', 'U_0015', '운영 비용', NULL);


		
		