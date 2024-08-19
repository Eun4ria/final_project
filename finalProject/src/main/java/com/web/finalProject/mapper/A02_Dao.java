package com.web.finalProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.web.finalProject.vo.Budget;
import com.web.finalProject.vo.BudgetSch;
import com.web.finalProject.vo.Chat;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.Taskfile;
import com.web.finalProject.vo.Tasks;
import com.web.finalProject.vo.Users;

@Mapper
public interface A02_Dao {
	//로그인
	   @Select("SELECT * FROM USERS\r\n"
	         + "WHERE user_id = #{user_id} \r\n"
	         + "AND password=#{password}")
	   Users login(Users user);
	   
	   @Select("SELECT count(*) FROM USERS \r\n"
	         + "WHERE user_id = #{user_id} \r\n"
	         +  "AND password=#{password}")
	   int loginCk(Users user);
	//회원가입
//	@Insert("INSERT INTO users (user_id, user_name, email, password, deptno, company_id, role_code)\r\n"
//			+ "VALUES (#{role_code}||'_'||TO_CHAR(users_seq_ex.nextval, 'FM0000'), #{user_name}, #{email}, #{password}, #{deptno}, #{company_id}, #{role_code})")
//	int insertUser(Users ins);
//	
//@Insert("INSERT INTO users (user_id, user_name, email, password, deptno, company_id, role_code) " +
//        "VALUES ('P_'||TO_CHAR(users_seq_ex.nextval, 'FM0000'), '김은수', 'ensu2015@gmail.com', 'rose112!!', '0', 'COM_0000', 'P') " )
//@SelectKey(statement = "SELECT 'P_'||TO_CHAR(users_seq_ex.currval, 'FM0000') FROM dual", keyProperty = "user_id", before = false, resultType = String.class)
//int insertUser(Users ins);
@Insert("INSERT INTO users (user_id, user_name, email, password, deptno, company_id, role_code) \r\n"
		+ "VALUES (#{user_id},  #{user_name}, #{email}, #{password}, #{deptno}, #{company_id}, #{role_code})")
@SelectKey(statement = "SELECT #{role_code}||'_'||TO_CHAR(users_seq_ex.nextval, 'FM0000') FROM dual", keyProperty = "user_id", before = true, resultType = String.class)
int insertUser(Users ins);

//이메일 유효성 확인
	@Select("SELECT count(*) FROM USERS \r\n"
			+ "WHERE email = #{email}")
	int emailCk(String email);
	
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
	
	
	//채팅 리스트-프젝에 속한 모든 팀원
		@Select("SELECT *\r\n"
				+ "FROM users u\r\n"
				+ "JOIN team t ON u.USER_ID = t.USER_ID\r\n"
				+ "WHERE t.project_id = #{project_id} \r\n"
				+ "AND u.user_id != #{user_id}")
		List<Users> getMemList(Users sch);
		
		
		//채팅방생성
		@Insert("INSERT INTO chat (chatroom_id, chatroom_name, owner_id, user_id, ban_status, BAN_DATE, UPTDATE, project_id) " +
	            "VALUES ('CHT_'||TO_CHAR(chat_seq.nextval, 'FM0000'), '채팅'||TO_CHAR(chatname_seq.nextval), #{owner_id}, #{user_id}, 'N', NULL, sysdate, #{project_id})")
//	    @Options(useGeneratedKeys = true, keyProperty = "chatroom_id", keyColumn = "chatroom_id")
		int insertchatroom(Chat ins);
		
		@Insert("INSERT INTO chat (chatroom_id, chatroom_name, owner_id, user_id, ban_status, BAN_DATE, UPTDATE, project_id) " +
				"VALUES ('CHT_'||TO_CHAR(chat_seq.currval, 'FM0000'), '채팅'||TO_CHAR(chatname_seq.currval), #{user_id}, #{owner_id}, 'N', NULL, sysdate, #{project_id})")
//	    @Options(useGeneratedKeys = true, keyProperty = "chatroom_id", keyColumn = "chatroom_id")
		int insertchatroom1(Chat ins1);
		
		@Select("select chatroom_id, chatroom_name from chat \r\n"
				+ "where owner_id=#{owner_id} \r\n"
				+ "and user_id=#{user_id}")
		Chat getchatRoomId(Chat get);
	//	
/*
	// user_id
	// project_id
	// owner_id
	 * 
 * */
	//	
		//채팅방 유무 확인
		@Select("SELECT COUNT(*) FROM chat c  \r\n"
				+ "WHERE owner_id = #{owner_id} \r\n"
				+ "AND user_id = #{user_id} \r\n"
				+ "AND project_id = #{project_id} ")
		int chatroomCk(Chat ch);
		
		// 
		
	//채팅 리스트
		@Select("SELECT * FROM CHAT \r\n"
				+ "WHERE project_id = #{project_id}\r\n"
				+ "AND  owner_id=#{owner_id}")
		List<Chat> getchatList(Chat chsch);
		
		
	

//todo
//	// ToDo List -조회
	@Select("SELECT * FROM task\r\n"
			+ "WHERE user_id = #{user_id}\r\n"
			+ "AND project_id = #{project_id}")
	List<Tasks> getTaskList(Tasks sch);
	
	// ToDo List -조회 : pm
	@Select("SELECT * FROM task\r\n"
			+ "WHERE project_id = #{project_id}")
	List<Tasks> getAllTaskList(Tasks sch);

	
	// ToDo detail - 상세
	@Select("SELECT * FROM TASK t \r\n"
			+ "WHERE task_id = #{task_id}")
	Tasks getTaskDetail(@Param("task_id") String task_id);

	
// ToDo update - 수정
	@Update("UPDATE task\r\n"
			+ "SET task_id = #{task_id},\r\n"
			+ "    task_name = #{task_name},\r\n"
			+ "    start_date = #{start_date},\r\n"
			+ "    end_date = #{end_date},\r\n"
			+ "    priority = #{priority},\r\n"
			+ "    parent_id = #{parent_id},\r\n"
			+ "    content = #{content},\r\n"
			+ "    progress = #{progress},\r\n"
			+ "    tstatus = #{tstatus},\r\n"
			+ "    user_id = #{user_id},\r\n"
			+ "    project_id = #{project_id}\r\n"
			+ "WHERE task_id = #{task_id}")
	int updatetask(Tasks upt);
	
	//파일 업로드
	@Insert("INSERT INTO TASKFILE (TASK_ID , FNAME  ,ETC ,REGDATE ,UPTDATE)\r\n"
			+ "values(#{task_id}, #{fname} , #{etc} , sysdate  ,sysdate)")
	int taskfileinsert(Taskfile ins);
	//파일 이름
	@Select("SELECT * FROM TASKFILE t \r\n"
			+ "WHERE task_id = #{task_id}")
	List<Taskfile> getfilename(@Param("task_id") String task_id);
	
	// ToDo Delete - 삭제
	@Delete("delete from task \r\n"
			+ "where task_id = #{task_id}")
	int deletetask(@Param("task_id") String task_id);
	
	
//예산관리 - 검색
	//  예산 budget_id 찾기
	@Select("SELECT * FROM budget WHERE budget_id = #{budget_id}")
    List<Budget> findBudgetId(String budget_id);
	
	//전체 데이터 수
	@Select("SELECT count(*)\r\n"
			+ "FROM BUDGET\r\n"
			+ "WHERE project_id = #{project_id}")
	int getBudgetCount(BudgetSch sch);
	
	@Select("SELECT * from(\r\n"
			+ "SELECT rownum cnt, LEVEL, b.*\r\n"
			+ "FROM budget b\r\n"
			+ "WHERE project_id = #{project_id}\r\n"
			+ "START WITH parent_id IS NULL\r\n"
			+ "CONNECT BY PRIOR budget_id = parent_id\r\n"
			+ "ORDER siblings BY budget_id DESC)\r\n"
			+ "WHERE cnt BETWEEN #{start} AND #{end}")
	List<Budget> getBudgetList(BudgetSch sch);
	
	// 등록에서 list 뽑기
	@Select("SELECT * from(\r\n"
			+ "SELECT rownum cnt, LEVEL AS lvl, b.*\r\n"
			+ "FROM budget b\r\n"
			+ "WHERE project_id = #{project_id}\r\n"
			+ "START WITH parent_id IS NULL\r\n"
			+ "CONNECT BY PRIOR budget_id = parent_id\r\n"
			+ "ORDER siblings BY budget_id DESC)\r\n"
			+ "WHERE lvl= 2")
	List<Budget> getparentList(BudgetSch sch);
	
	
	// Budget 등록
	@Insert("INSERT INTO budget (budget_id, budget_name, amount, regdate, usedate, project_id, parent_id, user_id)\r\n"
			+ "VALUES ('BUG_'||TO_CHAR(budget_seq.nextval, 'FM0000'), #{budget_name}, #{amount}, sysdate, #{usedate}, #{project_id},#{parent_id} ,#{user_id} ) ")
	int budgetInsert(Budget ins);
	
	// Budget 수정
	@Insert("UPDATE budget\r\n"
			+ "SET \r\n"
			+ "    budget_name = #{budget_name},\r\n"
			+ "    amount = #{amount},\r\n"
			+ "    regdate = #{regdate},\r\n"
			+ "    usedate = #{usedate},\r\n"
			+ "    project_id = #{project_id},\r\n"
			+ "    parent_id = #{parent_id},\r\n"
			+ "    user_id = #{user_id}\r\n"
			+ "WHERE  budget_id = #{budget_id}\r\n")
	int budgetUpdate(Budget upt);
	
	// Budget 삭제
	@Delete("delete from budget \r\n"
			+ "where budget_id = #{budget_id}")
	int deleteBudget(@Param("budget_id") String budget_id);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}