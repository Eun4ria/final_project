SELECT * FROM CHAT;
SELECT * FROM team;
SELECT * FROM task;
SELECT * FROM taskfile;

ALTER TABLE task
MODIFY parent_id DEFAULT '0';


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

UPDATE task
SET 
    task_name = '업데이트 확인',
    start_date = '2024-07-21',
    end_date = '2024-07-22',
    priority = '상',
    parent_id = '0',
    content = '업데이트된 작업 내용',
    progress = 70,
    backgroundcolor = '#f3edaf',
    textcolor = 'black',
    tstatus = '진행중',
    user_id = 'N_0047',
    project_id = 'PRO_0003'
WHERE task_id = 'TSK_0133';

SELECT * FROM TASKFILE t;
INSERT INTO TASKFILE (TASK_ID , FNAME  ,ETC ,REGDATE ,UPTDATE)
values('TSK_0004' , '디자인 시안.jpg  ','디자인 시안입니다' ,sysdate  ,sysdate);




SELECT constraint_name, table_name, column_name
FROM all_cons_columns
WHERE constraint_name = 'SYS_C007342';

SELECT fname
FROM TASKFILE
WHERE fname = 'Project4_구현상세.pptx';

ALTER TABLE TASKFILE DROP CONSTRAINT SYS_C007342;

SELECT fname FROM TASKFILE t 
WHERE task_id ='TSK_0132';



