CREATE TABLE users (
    user_id VARCHAR2(50) PRIMARY KEY, -- 사용자아이디
    login_id VARCHAR2(50) NOT NULL, -- 로그인
    user_name VARCHAR2(100) NOT NULL, -- 사용자이름
    email VARCHAR2(100), -- 이메일
    password VARCHAR2(100) NOT NULL, -- 비밀번호
    company_id VARCHAR2(50), -- 회사아이디
    department VARCHAR2(50), -- 부서
    role_code VARCHAR2(50) -- 권한코드
    -- CONSTRAINT fk_role_code FOREIGN KEY (role_code) REFERENCES Role(role_code)
);
DROP TABLE users;
SELECT * FROM USERS;

SELECT * FROM DEPARTMENT ;



-- Users 시퀀스 생성
CREATE SEQUENCE users_seq_ex
START WITH 0002
INCREMENT BY 1
NOCACHE
NOCYCLE;

DROP SEQUENCE users_seq_ex;
SELECT * FROM budget;

-- users 테이블의 트리거 생성 (user_id에 자동으로 시퀀스 값 부여)
CREATE OR REPLACE TRIGGER users_before_insert
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
  :new.user_id := 'HPM_' || LPAD(users_seq.NEXTVAL, 4, '0');
END;
/

-- 샘플 데이터 삽입
INSERT INTO Users (user_id, login_id, user_name, email, password, company_id, department, role_code) 
VALUES ('MEM_'||LPAD(users_seq.NEXTVAL, 4, '0'), 'ensu2015', '기믄수', 'ensu@gmail.com', 'Example112!!', 'HPM', 'Develop', 'M');

-/*
INSERT INTO Users (user_id, login_id, user_name, email, password, company_id, department, role_code) 
VALUES ('MEM_'||LPAD(users_seq.NEXTVAL, 4, '0'), #{login_id},  #{user_name}, #{email},#{password}, #{company_id}, #{department}, #{role_code})
*/

SELECT user_name FROM USERS
WHERE user_id = 'MEM_0001' 
AND password='Example112!!';

SELECT * FROM users;

ROLLBACK;
COMMIT;
 
CREATE SEQUENCE users_seq_ex

INSERT INTO users (user_id, user_name, email, password, deptno, company_id)
VALUES ('P_'||TO_CHAR(users_seq_ex.nextval, 'FM0000'), '김은수', 'ensu2015@gmail.com', 'rose112!!', 50, 'COM_0002');

SELECT * FROM users;

DELETE FROM users 
WHERE user_name = '김은수';

INSERT INTO users (user_id, user_name, email, password, deptno, company_id)
VALUES ('P_'||TO_CHAR(users_seq_ex.nextval, 'FM0000'), '김은수', 'ensu2015@gmail.com', 'rose112!!', 50, 'COM_0002');
			
SELECT * FROM DEPARTMENT d ;
