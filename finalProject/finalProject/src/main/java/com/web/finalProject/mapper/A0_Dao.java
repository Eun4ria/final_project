package com.web.finalProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.web.finalProject.vo.Chat;
import com.web.finalProject.vo.GanttTask;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.Users;

@Mapper
public interface A0_Dao {
	
	//회원가입
//		@Insert("INSERT INTO users (user_id, user_name, email, password, deptno, company_id, role_code)\r\n"
//				+ "VALUES (#{role_code}||'_'||TO_CHAR(users_seq_ex.nextval, 'FM0000'), #{user_name}, #{email}, #{password}, #{deptno}, #{company_id}, #{role_code})")
//		int insertUser(Users ins);
//		
//	@Insert("INSERT INTO users (user_id, user_name, email, password, deptno, company_id, role_code) " +
//            "VALUES ('P_'||TO_CHAR(users_seq_ex.nextval, 'FM0000'), '김은수', 'ensu2015@gmail.com', 'rose112!!', '0', 'COM_0000', 'P') " )
//    @SelectKey(statement = "SELECT 'P_'||TO_CHAR(users_seq_ex.currval, 'FM0000') FROM dual", keyProperty = "user_id", before = false, resultType = String.class)
//    int insertUser(Users ins);
	@Insert("INSERT INTO users (user_id, user_name, email, password, deptno, company_id, role_code) \r\n"
			+ "VALUES (#{user_id}, #{user_name}, #{email}, #{password}, #{deptno}, #{company_id}, #{role_code})")
    @SelectKey(statement = "SELECT #{role_code}||'_'||TO_CHAR(users_seq_ex.nextval, 'FM0000') FROM dual", keyProperty = "user_id", before = true, resultType = String.class)
    int insertUser(Users ins);
	
	//이메일 유효성 확인
		@Select("SELECT count(*) FROM USERS \r\n"
				+ "WHERE email = #{email}")
		int emailCk(String email);
	
		
	//로그인
	@Select("SELECT * FROM USERS\r\n"
			+ "WHERE user_id = #{user_id} \r\n"
			+ "AND password=#{password}")
	Users login(Users user);
	
	@Select("SELECT count(*) FROM USERS \r\n"
			+ "WHERE user_id = #{user_id} \r\n"
			+  "AND password=#{password}")
	int loginCk(Users user);

	// 아이디 찾기
	@Select("SELECT user_id FROM USERS\r\n"
			+ "WHERE user_name=#{user_name} AND email=#{email}")
	String find_id(Users user);
	
	// 비밀번호 재설정
	@Update("UPDATE USERS\r\n"
			+ "SET PASSWORD = ''\r\n"
			+ "WHERE USER_ID = #{user_id} AND USER_NAME = #{user_name} AND EMAIL = #{email}")
	int tempPwd(Users user);
	
	// 프로젝트 생성
	@Insert("INSERT INTO project (project_id, project_name, etc, start_date, end_date, create_date, company_id)\r\n"
			+ "VALUES ('PRO_'||TO_CHAR(project_seq.nextval, 'FM0000'),"
			+ " #{project_name}, #{etc}, TO_DATE(#{start_date}, 'YYYY-MM-DD'), TO_DATE(#{end_date}, 'YYYY-MM-DD'), sysdate, #{company_id})")
	int insertProject(Project ins);
	
	// 팀 생성
	@Select("SELECT u.user_name AS text,\r\n"
			+ " u.user_id AS id\r\n"
			+ "FROM users u\r\n"
			+ "JOIN team t ON u.user_id = t.user_id\r\n"
			+ "WHERE t.project_id=#{project_id}")
	List<Users> getTeam(@Param("project_id") String project_id);
		
	
	// 프로젝트 리스트
	@Select("SELECT p.*,\r\n"
			+ "	t.*,\r\n"
			+ "	b.AMOUNT ,\r\n"
			+ "	u.image\r\n"
			+ "FROM\r\n"
			+ "    project p \r\n"
			+ "JOIN team t ON p.project_id = t.project_id\r\n"
			+ "JOIN users u ON p.company_id=u.company_id\r\n"
			+ "JOIN BUDGET b ON p.project_id=b.project_id\r\n"
			+ "WHERE\r\n"
			+ "    t.user_id = #{user_id}")
	List<Project> getProjectList(@Param("user_id") String user_id);
	

	// 간트 리스트
	@Select("SELECT \r\n"
			+ "    t.task_id AS id, \r\n"
			+ "    t.task_name AS text, \r\n"
			+ "    t.start_date, \r\n"
			+ "    (t.end_date - t.start_date) AS duration,\r\n"
			+ "    t.priority,\r\n"
			+ "    t.backgroundcolor AS color,\r\n"
			+ "    t.textcolor,\r\n"
			+ "    t.progress,\r\n"
			+ "    u.user_id AS \"user\",\r\n"
			+ "    u.user_name AS name,\r\n"
			+ "    CASE \r\n"
			+ "        WHEN parent_id IS NULL THEN 1\r\n"
			+ "        ELSE 0\r\n"
			+ "    END AS open, -- TRUE FALSE 값으로 받기 위해 parent_id가 null일 경우 1, null이 아닐 경우 0\r\n"
			+ "    NVL(parent_id, '0') AS parent -- parent_id가 null일 경우 0\r\n"
			+ "FROM task t\r\n"
			+ "JOIN \r\n"
			+ "    users u ON t.user_id = u.user_id\r\n"
			+ "WHERE project_id=#{project_id}")
	List<GanttTask> getGantt(@Param("project_id") String project_id);
	
	
	
	
	//채팅 리스트-프젝에 속한 모든 팀원
	@Select("SELECT *\r\n"
			+ "FROM users u\r\n"
			+ "JOIN team t ON u.USER_ID = t.USER_ID\r\n"
			+ "WHERE t.project_id = #{project_id} \r\n"
			+ "AND u.user_id != #{user_id}")
	List<Users> getMemList(Users sch);
/*	
	@Insert("INSERT INTO chat (\r\n"
			+ "    CHATROOM_ID, CHATROOM_NAME, OWNER_ID, USER_ID, BAN_STATUS, BAN_DATE, UPTDATE, PROJECT_ID\r\n"
			+ ") VALUES (\r\n"
			+ "    'CHT_'||TO_CHAR(chat_seq.nextval, 'FM0000'), '잡담방', 'N_0047', 'N_0020', 'N', NULL, NULL, 'PRO_0001'\r\n"
			+ ")")
*/	
	
	
	@Select("SELECT * FROM Chat\r\n"
			+ "WHERE user_id = #{user_id} \r\n"
			+ "AND project_id=#{project_id}")
	Chat chat(Chat chat);
  
	
}
