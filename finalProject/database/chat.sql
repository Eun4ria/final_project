SELECT * FROM chat;
SELECT * FROM PROJECT p;

INSERT INTO chat (chatroom_id, CHATROOM_NAME, OWNER_ID,CHATMEM_ID,BAN_STATUS,BAN_DATE,UPTDATE,PROJECT_ID)
values('CH_0001','front','P_0012','C_0001','N',NULL,NULL,'PRO_0001');

UPDATE chat
SET chatroom_id = 'CHT_0002' -- 새 값으로 변경
WHERE chatroom_id = 'CH_0002'; -- 기존 값으로 조건 설정

SELECT * FROM CHAT 
WHERE OWNER_ID ='P_0012';

SELECT * FROM PROJECT p;
SELECT * FROM TEAM t;
SELECT * FROM users; 
SELECT * FROM chat;
SELECT * FROM COMPANY c ;

INSERT INTO PROJECT (project_id, project_name, etc, start_date, end_date, create_date, pstatus, company_id)
values('PRO_0000','ERP 프로젝트', 'WYE 프로젝트입니다', '24-06-10','24-07-05','24-06-07',0,'COM_0002');

INSERT INTO TEAM (PROJECT_ID, USER_ID)
VALUES('PRO_0000', 'P_0012');

SELECT 
    u.USER_NAME,c.CHATROOM_ID,
    c.CHATROOM_NAME
FROM 
    TEAM t
JOIN 
    users u ON t.USER_ID = u.USER_ID 
JOIN 
	chat c ON t.PROJECT_ID = c.PROJECT_ID
WHERE 
    t.PROJECT_ID = 'PRO_0001'
ORDER BY 
    c.UPTDATE DESC;

-- 프로젝트에 속한 팀원 목록 조회
SELECT 
    u.USER_ID,
    u.USER_NAME
FROM 
    TEAM t
JOIN 
    USERS u ON t.USER_ID = u.USER_ID
WHERE 
    t.PROJECT_ID = 'PRO_0001';

-- 로그인한 사용자가 속한 채팅방 목록 조회
SELECT 
    c.CHATROOM_ID,
    c.CHATROOM_NAME,
    c.OWNER_ID,
    c.UPTDATE
FROM 
    CHAT c
WHERE 
    c.OWNER_ID = 'P_0012'
   OR c.CHATMEM_ID = 'P_0012'
ORDER BY 
    c.UPTDATE DESC;



SELECT * FROM chat;
SELECT * FROM project;
UPDATE CHAT 
SET PROJECT_ID='PRO_0001'
WHERE CHATMEM_ID='M_0003';

COMMIT;

SELECT * FROM CHAT ;
WHERE project_id ='PRO_0000';

UPDATE CHAT 
SET owner_id = 'C_0001'
WHERE chatroom_id ='CHT_0001';

SELECT c.chatroom_id, u.USER_ID, u.USER_NAME 
FROM CHAT c
JOIN users u
WHERE c.PROJECT_ID =u.pro;

