-- 권한테이블(단독)
CREATE TABLE role (
    role_code CHAR(1) PRIMARY KEY, -- 역할코드
    role_name VARCHAR2(50) NOT NULL    -- 역할이름
);

-- 샘플 데이터
INSERT INTO role VALUES ('C', 'Company');
INSERT INTO role VALUES ('P', 'Project Manger');
INSERT INTO role VALUES ('M', 'Team Member');

-- 보기
SELECT * FROM ROLE;



-- 부서테이블(단독)
CREATE TABLE department (
    deptno NUMBER PRIMARY KEY, -- 부서코드    
    dname VARCHAR2(50) NOT NULL    -- 부서이름
);

-- 샘플 데이터
INSERT INTO department VALUES (10, '관리');
INSERT INTO department VALUES (20, '인사');
INSERT INTO department VALUES (30, '재무');
INSERT INTO department VALUES (40, '마케팅');
INSERT INTO department VALUES (50, '개발');
INSERT INTO department VALUES (60, 'IT');
INSERT INTO department VALUES (70, '품질보증');

-- 보기
SELECT * FROM department;



-- 사용자 테이블
CREATE TABLE users (
    user_id CHAR(6) PRIMARY KEY,  -- 사용자아이디
    user_name VARCHAR2(100) NOT NULL,  -- 사용자이름
    email VARCHAR2(100) UNIQUE NOT NULL,   -- 이메일
    password VARCHAR2(100) NOT NULL,   -- 비밀번호
    deptno NUMBER,           -- 부서
    company_id CHAR(8)           -- 회사아이디
   -- FOREIGN KEY (company_id) REFERENCES company(company_id)
);

-- 시퀀스 생성
CREATE SEQUENCE users_seq START WITH 0001 INCREMENT BY 1;

-- 샘플 데이터
INSERT INTO users (user_id, user_name, email, password, deptno, company_id)
VALUES ('P_'||TO_CHAR(users_seq.nextval, 'FM0000'), '박민경', 'loverymin1213@gmail.com', 'min1213!', 10, 'COM_0001');

-- 보기
SELECT * FROM users;



-- 회사
CREATE TABLE company (
    company_id CHAR(8) PRIMARY KEY, -- 회사아이디
    company_name VARCHAR2(100) NOT NULL  -- 회사이름
);

CREATE SEQUENCE company_seq START WITH 0001 INCREMENT BY 1;

-- 샘플 데이터
INSERT INTO company VALUES ('COM_'||TO_CHAR(company_seq.nextval, 'FM0000'), 'NAVER');
INSERT INTO company VALUES ('COM_'||TO_CHAR(company_seq.nextval, 'FM0000'), 'NEXON');

-- 보기
SELECT * FROM company;



-- 팀
CREATE TABLE team (
    project_id CHAR(8) PRIMARY KEY,   -- 프로젝트아이디
    user_id CHAR(6)      -- 사용자아이디
    --FOREIGN KEY (project_id) REFERENCES project(project_id),
    --FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 샘플 데이터
INSERT INTO team VALUES ('PRO_0001', 'P_0001');

-- 보기
SELECT * FROM team;



-- 캘린더
CREATE TABLE calendar (
    cal_id CHAR(8) PRIMARY KEY,   -- 일정아이디
    title VARCHAR2(100),               -- 제목
    start1 DATE,                       -- 시작일시
    end1 DATE,                         -- 종료일시
    content VARCHAR2(500),             -- 내용
    background VARCHAR2(20),           -- 배경색
    textcolor VARCHAR2(20),            -- 글자색
    allday VARCHAR2(10),               -- 종일여부
    urlink VARCHAR2(100),              -- 새 일정링크
    user_id CHAR(6)       -- 사용자아이디
   -- FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 시퀀스 생성
CREATE SEQUENCE calendar_seq START WITH 0001 INCREMENT BY 1;

-- 샘플 데이터
INSERT INTO calendar (cal_id, title, start1, end1, content, background, textcolor, allday, urlink, user_id)
	VALUES ('CAL_'||TO_CHAR(calendar_seq.nextval, 'FM0000'),
	'회의', TO_DATE('2023-07-17', 'YYYY-MM-DD'), TO_DATE('2023-07-20', 'YYYY-MM-DD'),
	'프로젝트 회의', '#FFFFFF', '#000000', 'Y', 'http://naver.com', 'P_0001');

SELECT * FROM calendar;



-- 프로젝트
CREATE TABLE project (
    project_id CHAR(8) PRIMARY KEY, -- 프로젝트아이디
    project_name VARCHAR2(100) NOT NULL, -- 프로젝트명
    etc VARCHAR2(500),                   -- 기타사항
    start_date DATE NOT NULL,                     -- 시작일
    end_date DATE NOT NULL,                       -- 종료일
    create_date DATE NOT NULL,                    -- 생성일
    pstatus VARCHAR2(20),                -- 진행상태
    company_id CHAR(8)             -- 회사아이디
    --FOREIGN KEY (company_id) REFERENCES company(company_id)
);

-- 시퀀스 생성
CREATE SEQUENCE project_seq START WITH 0001 INCREMENT BY 1;

-- 샘플 데이터
INSERT INTO project (project_id, project_name, etc, start_date, end_date, create_date, pstatus, company_id)
VALUES ('PRO_'||TO_CHAR(project_seq.nextval, 'FM0000'), 'final 프로젝트', '최종 프로젝트입니다.', TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-08-26', 'YYYY-MM-DD'), sysdate, '진행중', 'COM_0001');

-- 보기
SELECT * FROM project;



-- 회사게시판
CREATE TABLE board (
    no NUMBER PRIMARY KEY,      -- 번호
    refno NUMBER,               -- 참조번호
    subject VARCHAR2(100),        -- 주제
    content VARCHAR2(500),        -- 내용
    writer VARCHAR2(50),          -- 작성자
    readcnt NUMBER,               -- 조회수
    regdate DATE,                 -- 등록일
    uptdate DATE,                  -- 수정일
    company_id CHAR(8)         -- 회사아이디
   -- FOREIGN KEY (company_id) REFERENCES company(company_id)
);

CREATE SEQUENCE board_seq START WITH 1 INCREMENT BY 1;

-- 샘플 데이터
INSERT INTO board (no, refno, subject, content, writer, readcnt, regdate, company_id)
VALUES (board_seq.nextval, '', '공지사항', '중요 공지사항입니다.', 'P_0001', 125, sysdate, 'COM_0001');

-- 보기
SELECT * FROM board;



-- 게시판 파일
CREATE TABLE boardfile (
    no NUMBER PRIMARY KEY,          -- 번호
    fname VARCHAR2(100),            -- 파일이름
    etc VARCHAR2(500),              -- 내용
    regdate DATE,                   -- 등록일
    uptdate DATE                   -- 수정일
    --FOREIGN KEY (no) REFERENCES board(no)
);

-- 샘플 데이터
INSERT INTO boardfile (no, fname, etc, regdate)
VALUES ('1', 'file1.txt', '공지사항.txt', sysdate);

-- 보기
SELECT * FROM boardfile;



-- 업무
CREATE TABLE task (
    task_id CHAR(8) PRIMARY KEY,    -- 업무아이디
    task_name VARCHAR2(100) NOT NULL,            -- 업무이름
    start_date DATE,                     -- 시작일
    end_date DATE,                       -- 종료일
    priority VARCHAR2(20),               -- 우선순위
    parent_id VARCHAR2(50),              -- 부모아이디
    content VARCHAR2(500),               -- 내용
    progress NUMBER,                     -- 진행상황
    backgroundcolor VARCHAR2(20),        -- 배경색
    textcolor VARCHAR2(20),              -- 글자색
    tstatus VARCHAR2(20),                -- 진행상태
    user_id CHAR(6),                -- 사용자아이디
    project_id CHAR(8)            -- 프로젝트아이디
    --FOREIGN KEY (user_id) REFERENCES users(user_id),
    --FOREIGN KEY (project_id) REFERENCES project(project_id)
);

CREATE SEQUENCE task_seq START WITH 0001 INCREMENT BY 1;

-- 샘플 데이터
INSERT INTO task (task_id, task_name, start_date, end_date, priority, parent_id, content, progress, backgroundcolor, textcolor, tstatus, user_id, project_id)
VALUES ('TSK_'||TO_CHAR(task_seq.nextval, 'FM0000'), '설계', TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-07-24', 'YYYY-MM-DD'), '높음', NULL, '설계', 50, '#FFFFFF', '#000000', '진행중', 'P_0001', 'PRO_0001');

-- 보기
SELECT * FROM task;



-- 업무파일
CREATE TABLE taskfile (
    task_id CHAR(8) PRIMARY KEY,    -- 업무아이디
    fname VARCHAR2(100)NOT NULL,               -- 파일이름
    etc VARCHAR2(500),                 -- 내용
    regdate DATE,                      -- 등록일
    uptdate DATE                      -- 수정일
    --FOREIGN KEY (task_id) REFERENCES task(task_id)
);

CREATE SEQUENCE taskfile_seq START WITH 1 INCREMENT BY 1;

-- 샘플 데이터
INSERT INTO taskfile (task_id, fname, etc, regdate)
VALUES ('TSK_0001', '설계 결과.txt', '전반 설계입니다.', sysdate);

-- 보기
SELECT * FROM taskfile;



-- 예산
CREATE TABLE budget (
    budget_id CHAR(8) PRIMARY KEY, -- 예산아이디
    budget_name VARCHAR2(100) NOT NULL,-- 예산명
    amount NUMBER NOT NULL,            -- 금액
    regdate DATE NOT NULL,             -- 등록일
    usedate DATE,                      -- 사용일
    project_id CHAR(8)            -- 프로젝트아이디
    --FOREIGN KEY (project_id) REFERENCES project(project_id)
);

DROP TABLE budget;
CREATE SEQUENCE budget_seq START WITH 0001 INCREMENT BY 1;

-- 샘플 데이터
INSERT INTO budget (budget_id, budget_name, amount, regdate, project_id)
VALUES ('BUG_'||TO_CHAR(budget_seq.nextval, 'FM0000'), '최종 프로젝트 예산', 100000000, TO_DATE('2024-07-19', 'YYYY-MM-DD'), 'PRO_0001');

SELECT * FROM budget;



-- 채팅
CREATE TABLE chat (
    chatroom_id CHAR(8) PRIMARY KEY, -- 채팅방아이디
    chatroom_name VARCHAR2(100) NOT NULL,          -- 채팅방이름
    owner_id CHAR(6) NOT NULL,                -- 소유자아이디
    chatmem_id CHAR(6) ,              -- 채팅멤버아이디
    ban_status VARCHAR2(20),              -- 밴상태
    ban_date DATE,                        -- 밴일
    uptdate DATE,                          -- 수정일
    project_id CHAR(8)             -- 프로젝트아이디
    --FOREIGN KEY (project_id) REFERENCES projects(project_id)
);


-- 시퀀스 생성
CREATE SEQUENCE chat_seq START WITH 0001 INCREMENT BY 1;

-- 샘플 데이터
INSERT INTO chat (chatroom_id, chatroom_name, owner_id, chatmem_id, ban_status, ban_date, project_id)
VALUES ('CHT_'||TO_CHAR(chat_seq.nextval, 'FM0000'), '최종 프로젝트 채팅방', 'P_0001', 'M_0001', 'N', NULL, 'PRO_0001');

-- 보기
SELECT * FROM chat;
