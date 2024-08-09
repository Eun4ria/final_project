package com.web.finalProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.finalProject.vo.Calendar;
import com.web.finalProject.vo.GanttTask;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.Users;

@Mapper
public interface A01_Dao {
	// 아이디 찾기
	@Select("SELECT user_id FROM USERS\r\n"
			+ "WHERE user_name=#{user_name} AND email=#{email}")
	String find_id(Users user);
	// 비밀번호 찾기 (사용자 일치 확인)
	@Select("SELECT count(*) FROM users\r\n"
			+ "WHERE USER_ID = #{user_id} AND USER_NAME = #{user_name} AND EMAIL = #{email}")
	int find_pwd(Users user);
	// 임시비밀번호 업데이트
	@Update("UPDATE USERS\r\n"
			+ "SET PASSWORD = #{tempPwd}\r\n"
			+ "WHERE USER_ID = #{user_id}")
	int updateTempPwd(@Param("tempPwd") String tempPwd, @Param("user_id") String user_id);
	
	// 간트 리스트(조회)
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
			+ "    t.project_id,\r\n"			
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
	// 프로젝트의 팀(간트에서 역할부여할 때)
	@Select("SELECT u.user_name AS text,\r\n"
			+ " u.user_id AS id\r\n"
			+ "FROM users u\r\n"
			+ "JOIN team t ON u.user_id = t.user_id\r\n"
			+ "WHERE t.project_id=#{project_id}")
	List<Users> getTeam(@Param("project_id") String project_id);
	
	// 간트에서 task 등록
	@Insert("INSERT INTO task (task_id, task_name, start_date, end_date, parent_id, priority, progress, backgroundcolor, textcolor, user_id, project_id)\r\n"
			+ "VALUES ('TSK_' || TO_CHAR(task_seq.nextval, 'FM0000'),#{text},#{start_date},(#{start_date} + INTERVAL '1' DAY * #{duration}),#{parent},#{priority},#{progress},#{color},#{textcolor},#{user},#{project_id})")
	int insertGantt(GanttTask ins);
	
	// 간트에서 task 수정
	@Update("UPDATE task " +
	        "SET task_name = #{text}, " +
	        "    start_date = #{start_date}, " +
	        "    end_date = (#{start_date} + INTERVAL '1' DAY * #{duration}), " +
	        "    parent_id = #{parent}, " +
	        "    priority = #{priority}, " +
	        "    progress = #{progress}, " +
	        "    backgroundcolor = #{color}, " +
	        "    textcolor = #{textcolor}, " +
	        "    user_id = #{user}, " +
	        "    project_id = #{project_id} " +
	        "WHERE task_id = #{id}")
	int updateGantt(GanttTask upt);
	
	// 간트에서 task 삭제
	@Delete("DELETE FROM task WHERE task_id=#{id} or parent_id=#{id}")
	int deleteGantt(@Param("id") String task_id);
	
	
	
	
	// 메인에서 프로젝트 생성
	@Insert("INSERT INTO project (project_id, project_name, etc, start_date, end_date, create_date, company_id)\r\n"
			+ "VALUES ('PRO_'||TO_CHAR(project_seq.nextval, 'FM0000'),"
			+ " #{project_name}, #{etc}, TO_DATE(#{start_date}, 'YYYY-MM-DD'), TO_DATE(#{end_date}, 'YYYY-MM-DD'), sysdate, #{company_id})")
	int insertProject(Project ins);
	// 프로젝트 생성 시 팀원 추가하기 위한 user리스트
	@Select("SELECT\r\n"
			+ "    u.user_id,\r\n"
			+ "    u.user_name,\r\n"
			+ "    d.dname,\r\n"
			+ "    u.deptno\r\n"
			+ "FROM\r\n"
			+ "    users u\r\n"
			+ "JOIN\r\n"
			+ "    department d ON u.deptno = d.deptno\r\n"
			+ "ORDER BY\r\n"
			+ "    u.user_id")
	List<Users> getUsers();
	
	
	// 로그인한 유저의 프로젝트 리스트
	@Select("SELECT\r\n"
			+ "    p.project_id,\r\n"
			+ "    c.logo,\r\n"
			+ "    p.project_name,\r\n"
			+ "    MAX(b.amount) AS amount,  -- 예산\r\n"
			+ "    AVG(t.progress) AS progress  -- 평균 진행률\r\n"
			+ "FROM\r\n"
			+ "    users u\r\n"
			+ "JOIN\r\n"
			+ "    team tm ON u.user_id = tm.user_id\r\n"
			+ "JOIN\r\n"
			+ "    project p ON tm.project_id = p.project_id\r\n"
			+ "JOIN\r\n"
			+ "    company c ON p.company_id = c.company_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    task t ON p.project_id = t.project_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    budget b ON p.project_id = b.project_id\r\n"
			+ "WHERE\r\n"
			+ "    u.user_id = #{user_id}\r\n"
			+ "GROUP BY\r\n"
			+ "    p.project_id, c.logo, p.project_name\r\n"
			+ "ORDER BY\r\n"
			+ "    p.project_name")
	List<Project> getProjectList(@Param("user_id") String user_id);
	
	
	
	// 캘린더
	@Select("SELECT\r\n"
			+ "task_id AS id,\r\n"
			+ "task_name AS title,\r\n"
			+ "start_date AS \"start\",\r\n"
			+ "end_date AS \"end\",\r\n"
			+ "backgroundcolor AS backgroundColor,\r\n"
			+ "textcolor AS textColor\r\n"
			+ "FROM task")
	List<Calendar> getCalendarList();
	
	
	
}
