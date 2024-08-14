SELECT * FROM CHAT;
SELECT * FROM team;
SELECT * FROM task;


SELECT COUNT(*) FROM CHAT c 
WHERE OWNER_ID = 'N_0047'
AND USER_ID ='N_0020';

INSERT INTO chat (chatroom_id, chatroom_name, owner_id, user_id, ban_status, BAN_DATE, UPTDATE, project_id) 
VALUES ('CHT_'||TO_CHAR(chat_seq.nextval, 'FM0000'), '채팅'||TO_CHAR(chat_name_seq.nextval), 'N_0047', 'P_0001', 'N', NULL, sysdate,'PRO_0003');

SELECT * FROM CHAT 
WHERE project_id = 'PRO_0003'
AND  owner_id='N_0047'
AND owner_id != user_id;

SELECT COUNT(*) FROM chat c
WHERE owner_id = 'P_0001' AND user_id='N_0047'
AND project_id = 'PRO_0003';

select chatroom_id, chatroom_name from chat
where owner_id='P_0001'
and user_id='N_0047';

SELECT * FROM task;

SELECT * FROM TASK t 
WHERE task_id = 'TSK_0001'; 