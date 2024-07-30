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

INSERT 





SELECT u.user_name
FROM user u
JOIN team t
ON u.user_id = t.user_id
WHERE t.project_id = '특정 프로젝트 ID';


