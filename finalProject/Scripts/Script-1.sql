SELECT * FROM CHAT;
SELECT * FROM team;
SELECT * FROM task;
SELECT * FROM taskfile;
SELECT * FROM BUDGET b;

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

SELECT * FROM ROLE;
SELECT * FROM TEAM  ;
INSERT INTO ROLE (ROLE_CODE, ROLE_NAME)
VALUES('B', 'Budget Manager');

UPDATE BUDGET 
SET LEVELS = 1
WHERE PARENT_ID IS NOT NULL;

SELECT * FROM BUDGET b ;
INSERT INTO BUDGET (BUDGET_ID,BUDGET_NAME,AMOUNT   ,REGDATE     ,USEDATE,PROJECT_ID , PARENT_ID, levels)
VALUES ('BUG_'||TO_CHAR(budget_seq.nextval, 'FM0000'),'인권비','100000000',sysdate,NULL,'PRO_0003','BUG_0022',2);

ALTER TABLE BUDGET ADD (
    parent_id VARCHAR2(20),  -- 부모 예산 항목 ID
    LEVELS NUMBER              -- 계층 레벨
);

ALTER TABLE BUDGET ADD (user_id VARCHAR2(50));

SELECT * FROM BUDGET b ;
UPDATE BUDGET 
SET user_id = 'B_0047'
WHERE LEVELS = 2;

SELECT * FROM BUDGET b 
WHERE PROJECT_ID = 'PRO_0003';

SELECT *from(
SELECT rownum AS cnt, LEVEL, b.*
FROM BUDGET b
WHERE budget_name LIKE '%'||#{budget_name}||'%'
START WITH parent_id IS null
CONNECT BY PRIOR parent_id = budget_id
ORDER siblings BY budget_id DESC);


SELECT *from(
SELECT rownum AS cnt, LEVEL, b.*
FROM BUDGET b
WHERE project_id = 'PRO_0003'
START WITH parent_id IS null
CONNECT BY PRIOR parent_id = budget_id
ORDER siblings BY regdate DESC)
WHERE cnt BETWEEN 1 AND 5;
SELECT * FROM BUDGET;

SELECT count(*) FROM BUDGET b 
WHERE project_id = 'PRO_0003';

SELECT * FROM BUDGET b ;
WHERE PROJECT_ID = 'PRO_0003';

ALTER TABLE BUDGET
ADD no INT;

ALTER TABLE BUDGET
ADD levels INT;

ALTER TABLE BUDGET
drop column no ;

MERGE INTO BUDGET b
USING (
    SELECT BUDGET_ID, ROW_NUMBER() OVER (ORDER BY REGDATE) AS row_num
    FROM BUDGET
) nd
ON (b.BUDGET_ID = nd.BUDGET_ID)
WHEN MATCHED THEN
UPDATE SET b.no = nd.row_num;

UPDATE budget 
SET refno = null
WHERE parent_id =null;

SELECT * from(
SELECT rownum cnt, LEVEL, b.*
FROM budget b
WHERE budget_name LIKE '%%'
AND user_id LIKE '%%'
START WITH parent_id IS NULL
CONNECT BY PRIOR budget_id = parent_id
ORDER siblings BY budget_id DESC);

INSERT INTO budget (budget_id, budget_name, amount, regdate, usedate, project_id, parent_id, user_id)
VALUES ('BUG_'||TO_CHAR(budget_seq.nextval, 'FM0000'), '운영 및 유지보수', 200000000, sysdate, NULL, 'PRO_0003','BUG_0023' ,'B_0047' );

SELECT * FROM BUDGET b ;

ALTER TABLE BUDGET 
ADD etc VARCHAR2(255);


ALTER TABLE BUDGET
MODIFY command varchar2(255);

SELECT * FROM TASK t ;

SELECT * FROM task\r\n"
			+ "WHERE user_id = #{user_id}\r\n"
			+ "AND project_id = #{project_id}

SELECT * FROM(
SELECT rownum cnt, LEVEL, t.*
FROM task t
WHERE user_id = 'B_0047'
AND project_id = 'PRO_0003'
START WITH parent_id = '0'
CONNECT BY PRIOR task_id = parent_id);

SELECT * from(
SELECT rownum cnt, LEVEL, t.*
FROM task t
WHERE user_id = 'B_0047'
AND project_id = 'PRO_0003'
START WITH parent_id IS NULL
CONNECT BY PRIOR task_id = parent_id
ORDER siblings BY task_id DESC);

SELECT * from(
SELECT rownum cnt, LEVEL AS lvl, b.*
FROM budget b
WHERE project_id = 'PRO_0003'
START WITH parent_id IS NULL
CONNECT BY PRIOR budget_id = parent_id
ORDER siblings BY budget_id DESC)
WHERE lvl=2;




