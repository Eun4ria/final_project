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



-- 패스워드 찾기
  
SELECT count(*) FROM users
WHERE USER_ID = 'C_0001' AND USER_NAME = '박민경' AND EMAIL = 'loverymin1213@gmail.com' ;

UPDATE USERS
SET PASSWORD = 'min1213!'
WHERE USER_ID = 'C_0001';
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

SELECT * FROM task;

INSERT INTO task VALUES('TSK_'||TO_CHAR(task_seq.nextval, 'FM0000','요구사항 정의서','')

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

SELECT u.user_name AS text,
u.user_id AS id
FROM users u
JOIN team t ON u.user_id = t.user_id
WHERE t.project_id='PRO_0001';

SELECT
t.task_id AS id,
t.task_name AS text,
t.start_date,
t.END_DATE ,
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
END AS open, -- TRUE FALSE 값으로 받기 위해 parent_id가 null일 경우 1, null이 아닐 경우 0\r\n"
NVL(parent_id, '0') AS parent
FROM task t
JOIN
users u ON t.user_id = u.user_id
WHERE project_id='PRO_0042';


SELECT u.user_name AS text,
u.user_id AS id
FROM users u
JOIN team t ON u.user_id = t.user_id
WHERE t.project_id='PRO_0001';

SELECT * FROM team;
			
SELECT * FROM TASK;

INSERT INTO task (task_id, task_name, start_date, end_date, priority, progress, backgroundcolor, textcolor, user_id, project_id)
VALUES ('TSK_'||TO_CHAR(task_seq.nextval, 'FM0000'), '회원가입', TO_DATE('2024-07-28', 'YYYY-MM-DD'), TO_DATE('2024-07-28', 'YYYY-MM-DD')+5, '상', 10, 'green', 'white', 'M_0022', 'PRO_0001');
   

SELECT * FROM project;
INSERT INTO project (project_id, project_name, etc, start_date, end_date, create_date, pstatus, company_id)
VALUES ('PRO_'||TO_CHAR(project_seq.nextval, 'FM0000'), #{project_name}, #{project_name}, TO_DATE(#{start_date}, 'YYYY-MM-DD'), TO_DATE(#{end_date}, 'YYYY-MM-DD'), sysdate, 'COM_0001');
SELECT * FROM task;
INSERT INTO task (task_id, task_name, start_date, end_date, priority, parent_id, content, progress, backgroundcolor, textcolor, tstatus, user_id, project_id)
VALUES ('TSK_'||TO_CHAR(task_seq.nextval, 'FM0000'), '설계', TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-07-24', 'YYYY-MM-DD'), '상', NULL, '설계', 50, '#FFFFFF', '#000000', '진행중', 'P_0001', 'PRO_0001');

INSERT INTO project values('PRO_'||TO_CHAR(project_seq.nextval, 'FM0000'), '마블컬렉션 프로젝트','2차 프로젝트', TO_DATE('2024-05-01', 'YYYY-MM-DD'),TO_DATE('2024-05-22', 'YYYY-MM-DD'),TO_DATE('2024-04-30', 'YYYY-MM-DD'),0,'COM_0000');

SELECT * FROM task;

INSERT INTO task (task_id, task_name, start_date, end_date, priority, parent_id, content, progress, backgroundcolor, textcolor, tstatus, user_id, project_id)
VALUES ('TSK_'||TO_CHAR(task_seq.nextval, 'FM0000'), '화면설계', TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), '중', NULL, '설계', 100, '#FFFFFF', '#000000', '완료', 'N_0047', 'PRO_0000');

SELECT * FROM task;

INSERT INTO task (task_id, task_name, start_date, end_date, priority, progress, backgroundcolor, textcolor, user_id, project_id)
VALUES ('TSK_' || TO_CHAR(task_seq.nextval, 'FM0000'),'테스트용 테스크2',TO_DATE('2024-07-01', 'YYYY-MM-DD'),TO_DATE('2024-07-01', 'YYYY-MM-DD') + 5,'상',50,'red','white','P_0001','PRO_0000');

DELETE FROM task WHERE task_id='TSK_0037';

UPDATE task
SET
    task_name = '테스트용 테스크2',
    start_date = TO_DATE('2024-07-01', 'YYYY-MM-DD'),
    end_date = TO_DATE('2024-07-01', 'YYYY-MM-DD') + 5,
    parent_id=null,
    priority = '상',
    progress = 50,
    backgroundcolor = 'red',
    textcolor = 'white',
    user_id = 'P_0001',
    project_id = 'PRO_0000'
WHERE
    task_id = #{id};
   SELECT * FROM task;

SELECT * FROM task;


-- 캘린더
SELECT
task_id AS id,
task_name AS title,
start_date AS "start",
end_date AS "end",
backgroundcolor AS backgroundColor,
textcolor AS textColor
FROM task;




SELECT * FROM users;

UPDATE users 
SET
user_name='민갬이'
user_email='민갬이'
user_company_id='민갬이'
user_image='민갬이'
WHERE user_id='P_0001';

SELECT
task_id AS id,
task_name AS title,
start_date AS "start",
end_date AS "end",
backgroundcolor AS backgroundColor,
textcolor AS textColor
FROM task
where project_id='PRO_0003';


SELECT
    u.user_id,
    u.company_id,
    d.dname AS department_name,
    p.project_id,
    p.project_name,
    p.etc,
    p.start_date,
    p.end_date,
    CASE
        WHEN p.project_id IS NOT NULL THEN 1
        ELSE 0
    END AS is_active
FROM
    users u
    LEFT JOIN department d ON u.deptno = d.deptno
    LEFT JOIN team t ON u.user_id = t.user_id
    LEFT JOIN project p ON t.project_id = p.project_id
ORDER BY
    u.user_id, p.project_id;

SELECT * FROM calendar;

ALTER TABLE calendar
ADD (entity_type VARCHAR2(20));

SELECT * FROM task;
ALTER TABLE calendar
DROP (
    entity_type
);

UPDATE calendar SET 
entity_type='T'
WHERE user_id='M_0003';
SELECT * FROM calendar;


INSERT INTO calendar values('CAL_'||TO_CHAR(calendar_seq.nextval, 'FM0000'),'가족여행',sysdate, TO_DATE('2024-08-20', 'YYYY-MM-DD'), '휴가를 떠나요',NULL,NULL,NULL,NULL,'P_0001','P');


SELECT 
    c.cal_id, 
    c.title,
    c.start1 "start",
    c.end1 "end",
    c.content,
    '#85eee2' AS backgroundColor,
    'black' AS textColor, 
    c.urllink AS urlLink, 
    c.allday AS allDay,
    c.user_id AS user_id, 
    c.entity_type,
    u.user_name AS writer  -- 사용자 이름을 가져옵니다.
FROM 
    calendar c
JOIN 
    users u ON c.user_id = u.user_id  -- user_id를 기준으로 조인합니다.
WHERE 
     entity_type='P' AND c.user_id = 'P_0001';
   
SELECT 
    c.cal_id AS id, 
    c.title,
    c.start1 "start",
    c.end1 "end",
    c.content,
    '#85eee2' AS backgroundColor,
    'black' AS textColor, 
    c.urllink AS urlLink, 
    c.user_id AS user_id, 
    t.project_id,
    c.entity_type,
    u.user_name AS writer  -- 사용자 이름을 가져옵니다.
FROM 
    calendar c
JOIN 
    users u ON c.user_id = u.user_id  -- user_id를 기준으로 조인합니다.
JOIN
    team t ON t.user_id = u.user_id
WHERE entity_type='T' AND project_id='PRO_0003';
   



SELECT * FROM calendar;


ALTER TABLE calendar RENAME COLUMN urlink to urllink;



UPDATE task
SET task_name = '화면설계dd',
    start_date = TO_DATE('2024-07-01', 'YYYY-MM-DD'),
    end_date = TO_DATE('2024-07-01', 'YYYY-MM-DD') + INTERVAL '1' DAY * 10,
    parent_id = null,
    priority = '중',
    progress = 50,
    backgroundcolor = 'red',
    textcolor = 'white',
    user_id = 'P_0001',
    project_id = 'PRO_0003'
WHERE task_id = 'TSK_0193';

SELECT * FROM task;

SELECT * FROM calendar;

DELETE FROM calendar WHERE cal_id = 'CAL_0035';

UPDATE calendar
SET title = '일정 수정',
start =sysdate,
end =sysdate,
allDay = 1,
content = '수정테스트',
entity_type = 'P'
WHERE cal_id = 'CAL_0036';


SELECT * FROM calendar;
SELECT * FROM project;

SELECT COUNT(*) FROM chat c
            WHERE owner_id = 'B_0047'
            AND user_id = 'P_0001' 
            AND project_id = 'PRO_0003';
           
           select chatroom_id, chatroom_name from chat
			where owner_id='P_0001'
			and user_id='B_0047';
SELECT
    u.*,  -- users 테이블의 모든 열
    d.dname,  -- department 테이블의 부서 이름
    t.project_id,  -- team 테이블의 프로젝트 ID
    p.project_name,  -- project 테이블의 프로젝트 이름
    CASE
        WHEN p.start_date <= CURRENT_TIMESTAMP AND p.end_date >= CURRENT_TIMESTAMP THEN 'Active'
        ELSE 'Inactive'
    END AS project_status  -- 현재 프로젝트가 활동 중인지 확인
FROM
    users u
JOIN
    department d ON u.deptno = d.deptno
LEFT JOIN
    team t ON u.user_id = t.user_id  -- team 테이블과 users 테이블을 user_id 기준으로 LEFT JOIN
LEFT JOIN
    project p ON t.project_id = p.project_id  -- project 테이블과 team 테이블을 project_id 기준으로 LEFT JOIN
    ORDER BY
    u.user_id;

SELECT DISTINCT
    u.*,  -- users 테이블의 모든 열
    d.dname,  -- department 테이블의 부서 이름
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM team t
            JOIN project p ON t.project_id = p.project_id
            WHERE t.user_id = u.user_id
              AND p.start_date <= CURRENT_TIMESTAMP
              AND p.end_date >= CURRENT_TIMESTAMP
        ) THEN 'Active'
        ELSE 'Inactive'
    END AS project_status  -- 현재 프로젝트가 활동 중인지 확인
FROM
    users u
JOIN
    department d ON u.deptno = d.deptno
LEFT JOIN
    team t ON u.user_id = t.user_id  -- team 테이블과 users 테이블을 user_id 기준으로 LEFT JOIN
LEFT JOIN
    project p ON t.project_id = p.project_id  -- project 테이블과 team 테이블을 project_id 기준으로 LEFT JOIN
ORDER BY
    u.user_id;
   
   
SELECT
    u.*, 
    d.dname, 
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM team t
            JOIN project p ON t.project_id = p.project_id
            WHERE t.user_id = u.user_id
              AND p.start_date <= sysdate
              AND p.end_date >= sysdate
        ) THEN 1
        ELSE 0
    END AS project_status  -- 현재 프로젝트가 활동 중인지 확인
FROM
    users u
JOIN
    department d ON u.deptno = d.deptno
    where u.user_id='P_0001' OR d.dname='P_0001' or u.company_id ='P_0001' OR u.user_name='P_0001'
ORDER BY
    u.user_id;
    
SELECT COUNT(*)
FROM users u
JOIN department d ON u.deptno = d.deptno
where u.user_id='P_0001' or d.dname='P_0001' or u.company_id ='P_0001' OR u.user_name='P_0001';

SELECT *
FROM (
    SELECT rownum cnt, LEVEL
        u.*, 
        d.dname, 
        CASE
            WHEN EXISTS (
                SELECT 1
                FROM team t
                JOIN project p ON t.project_id = p.project_id
                WHERE t.user_id = u.user_id
                  AND p.start_date <= SYSDATE
                  AND p.end_date >= SYSDATE
            ) THEN 1
            ELSE 0
        END AS project_status
    FROM
        users u
    JOIN
        department d ON u.deptno = d.deptno
    WHERE
        u.user_id = '' 
        OR d.dname = '' 
        OR u.company_id = '' 
        OR u.user_name = ''
    ORDER BY
        u.user_id
)
WHERE ROWNUM BETWEEN 1 AND 5;