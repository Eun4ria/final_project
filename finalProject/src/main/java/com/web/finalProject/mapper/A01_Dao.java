package com.web.finalProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.finalProject.vo.Calendar;
import com.web.finalProject.vo.Company;
import com.web.finalProject.vo.GanttTask;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.UserSch;
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
	@Insert("INSERT INTO task (task_id, task_name, start_date, end_date, parent_id, priority, progress, backgroundcolor, user_id, project_id)\r\n"
			+ "VALUES ('TSK_' || TO_CHAR(task_seq.nextval, 'FM0000'),#{text},#{start_date},(#{start_date} + INTERVAL '1' DAY * #{duration}),#{parent},#{priority},#{progress},#{color},#{user},#{project_id})")
	int insertGantt(GanttTask ins);
	
	// 간트에서 task 수정
	@Update("UPDATE task " +
	        "SET task_name = #{text, jdbcType=VARCHAR}, " +
	        "    start_date = #{start_date, jdbcType=DATE}, " +
	        "    end_date = #{start_date, jdbcType=DATE} + #{duration}, " +
	        "    parent_id = #{parent, jdbcType=VARCHAR}, " +
	        "    priority = #{priority, jdbcType=VARCHAR}, " +
	        "    progress = #{progress, jdbcType=INTEGER}, " +
	        "    backgroundcolor = #{color, jdbcType=VARCHAR}, " +
	        "    user_id = #{user, jdbcType=CHAR}, " +
	        "    project_id = #{project_id, jdbcType=CHAR} " +
	        "WHERE task_id = #{id, jdbcType=CHAR}")
	int updateGantt(GanttTask upt);
	
	// 간트에서 task 삭제
	@Delete("DELETE FROM task WHERE task_id=#{id} or parent_id=#{id}")
	int deleteGantt(@Param("id") String task_id);
	
	
	
	
	// 메인에서 프로젝트 생성
	@Insert("INSERT INTO project (project_id, project_name, etc, start_date,"
			+ " end_date, create_date, company_id)\r\n"
			+ "VALUES ('PRO_'||TO_CHAR(project_seq.nextval, 'FM0000'),"
			+ " #{project_name}, #{etc},#{start_date},#{end_date}, sysdate,"
			+ " #{company_id})")
	int insertProject(Project ins);
	// 생성된 project_id를 조회
	@Select("SELECT project_id FROM project \r\n"
			+ "WHERE ROWNUM = 1 ORDER BY project_id DESC")
    String getLastInsertedProjectId();
	// 프로젝트 생성 시 team에 인원 추가
	@Insert("INSERT INTO team values(#{project_id},#{user_id})")
	int addProjectUser(@Param("project_id") String project_id,
			@Param("user_id") String user_id);
	@Select("select * from company")
	List<Company> getComId();
	
	
	
	// user리스트
	@Select("SELECT *\r\n"
	        + "FROM (\r\n"
	        + "    SELECT rownum cnt,\r\n"
	        + "        u.*, \r\n"
	        + "        d.dname, \r\n"
	        + "        CASE\r\n"
	        + "            WHEN EXISTS (\r\n"
	        + "                SELECT 1\r\n"
	        + "                FROM team t\r\n"
	        + "                JOIN project p ON t.project_id = p.project_id\r\n"
	        + "                WHERE t.user_id = u.user_id\r\n"
	        + "                  AND p.start_date <= SYSDATE\r\n"
	        + "                  AND p.end_date >= SYSDATE\r\n"
	        + "            ) THEN 1\r\n"
	        + "            ELSE 0\r\n"
	        + "        END AS project_status\r\n"
	        + "    FROM\r\n"
	        + "        users u\r\n"
	        + "    JOIN\r\n"
	        + "        department d ON u.deptno = d.deptno\r\n"
	        + "    WHERE\r\n"
	        + "        u.user_id LIKE '%'||#{sch,jdbcType=VARCHAR}||'%' \r\n"
	        + "        OR d.dname LIKE '%'||#{sch,jdbcType=VARCHAR}||'%' \r\n"
	        + "        OR u.company_id LIKE '%'||#{sch,jdbcType=VARCHAR}||'%' \r\n"
	        + "        OR u.user_name LIKE '%'||#{sch,jdbcType=VARCHAR}||'%'\r\n"
	        + "    ORDER BY\r\n"
	        + "        cnt\r\n"  // cnt를 기준으로 정렬
	        + ")\r\n"
	        + "WHERE cnt BETWEEN #{start} AND #{end}")
	List<Users> getUserList(UserSch sch);
	@Select("SELECT COUNT(*)\r\n"
			+ "FROM users u\r\n"
			+ "JOIN department d ON u.deptno = d.deptno\r\n"
			+ "    where u.user_id LIKE '%'||#{sch,jdbcType=VARCHAR}||'%' "
			+ "OR d.dname LIKE '%'||#{sch,jdbcType=VARCHAR}||'%' "
			+ "or u.company_id LIKE '%'||#{sch,jdbcType=VARCHAR}||'%' "
			+ "OR u.user_name LIKE '%'||#{sch,jdbcType=VARCHAR}||'%'")
	int getUserCount(UserSch sch);
	
	@Select("select * from users\r\n"
			+ "where user_id=#{user_id}")
	Users getUser(@Param("user_id") String user_id);
	@Update("update users set\r\n"
			+ "company_id=#{company_id},\r\n"
			+ "deptno=#{deptno},\r\n"
			+ "role_code=#{role_code}\r\n"
			+ "where user_id=#{user_id}")
	int updateUser(Users upt);
	@Delete("delete from users\r\n"
			+ "where user_id=#{user_id}")
	int deleteUser(@Param("user_id") String user_id);
	
	// 프로젝트 생성 시 필요한 사용자 리스트
	@Select("SELECT \n"
			+ "    u.user_id,\n"
			+ "    u.user_name,\n"
			+ "    d.dname,\n"
			+ "    u.DEPTNO\n"
			+ "FROM \n"
			+ "    users u\n"
			+ "JOIN \n"
			+ "    department d \n"
			+ "ON \n"
			+ "    u.deptno = d.deptno\r\n"
			+ "WHERE \r\n"
	        + "    u.user_id <> #{userId}")
	List<Users> getUserProIns(@RequestParam("userId") String my_id);
	
	
	// 로그인한 유저의 활동중인 프로젝트 리스트(메인)
	@Select("SELECT\r\n"
			+ "    p.project_id,\r\n"
			+ "    c.logo,\r\n"
			+ "    p.project_name,\r\n"
			+ "    p.start_date,\r\n"
			+ "    p.end_date,\r\n"
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
			+ "    AND p.end_date >= SYSDATE \r\n"
			+ "GROUP BY\r\n"
			+ "    p.project_id, c.logo, p.project_name,p.start_date,p.end_date\r\n"
			+ "ORDER BY\r\n"
			+ "    p.project_name")
	List<Project> getProjectList(@Param("user_id") String user_id);
	// 로그인한 유저의 완료된 프로젝트(프로필)
	@Select("SELECT\r\n"
			+ "    p.project_id,\r\n"
			+ "    c.logo,\r\n"
			+ "    p.project_name,\r\n"
			+ "    p.start_date,\r\n"
			+ "    p.end_date,\r\n"
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
			+ "    AND p.end_date < SYSDATE \r\n"
			+ "GROUP BY\r\n"
			+ "    p.project_id, c.logo, p.project_name,p.start_date,p.end_date\r\n"
			+ "ORDER BY\r\n"
			+ "    p.project_name")
	List<Project> getComProjectList(@Param("user_id") String user_id);
	
	// 프로젝트 상세정보
	@Select("SELECT * FROM project p\n"
			+ "JOIN company c\n"
			+ "ON p.company_id=c.company_id\n"
			+ "WHERE project_id = #{project_id}")
	Project getProject(@Param("project_id") String project_id);
	// 프로젝트 정보 수정
	@Update("UPDATE PROJECT SET \n"
			+ "project_name=#{project_name},\n"
			+ "etc=#{etc},\n"
			+ "start_date=#{start_date},\n"
			+ "end_date=#{end_date}\n"
			+ "WHERE project_id=#{project_id}")
	int updateProject(Project upt);
	// 프로젝트 삭제
	@Delete("DELETE FROM PROJECT\n"
			+ "WHERE project_id=#{project_id}")
	int deleteProject(@Param("project_id") String project_id);
	
	
	
	
	// 간트(task)캘린더
	@Select("SELECT\r\n"
			+ "    task_id AS id,\r\n"
			+ "    task_name AS title,\r\n"
			+ "    start_date AS \"start\",\r\n"
			+ "    end_date AS \"end\",\r\n"
			+ "    content,\r\n"
			+ "    1 allDay,\r\n"			
			+ "    project_id,\r\n"	
			+ "    '#d8ee95' AS backgroundColor,\r\n"
			+ "    'black' AS textColor \r\n"
			+ "FROM task\r\n"
			+ "WHERE project_id = #{project_id}")
	List<Calendar> getGanttCalList(@Param("project_id")String project_id);
	// 개인 캘린더
	@Select("SELECT \r\n"
			+ "    c.cal_id AS id, \r\n"
			+ "    c.title,\r\n"
			+ "    c.start1 \"start\",\r\n"
			+ "    c.end1 \"end\",\r\n"
			+ "    c.content,\r\n"
			+ "    '#85eee2' AS backgroundColor,\r\n"
			+ "    'black' AS textColor, \r\n"
			+ "    c.urllink AS urlLink, \r\n"
			+ "    c.user_id AS user_id, \r\n"
			+ "    c.entity_type,\r\n"
			+ "    c.allDay,\r\n"
			+ "    u.user_name AS writer \r\n"
			+ "FROM \r\n"
			+ "    calendar c\r\n"
			+ "JOIN \r\n"
			+ "    users u ON c.user_id = u.user_id \r\n"
			+ "WHERE \r\n"
			+ "    entity_type='P' AND c.user_id = #{user_id}")
	List<Calendar> getPCalList(@Param("user_id") String user_id);
	// 팀 캘린더
	@Select("SELECT \r\n"
			+ "    c.cal_id AS id, \r\n"
			+ "    c.title,\r\n"
			+ "    c.start1 \"start\",\r\n"
			+ "    c.end1 \"end\",\r\n"
			+ "    c.content,\r\n"
			+ "    '#c266f4' AS backgroundColor,\r\n"
			+ "    'white' AS textColor, \r\n"
			+ "    c.urllink AS urlLink, \r\n"
			+ "    c.allday AS allDay,\r\n"
			+ "    c.user_id AS user_id, \r\n"
			+ "    c.project_id,\r\n"
			+ "	c.entity_type,\r\n"
			+ "	c.allDay,\r\n"
			+ "	u.user_name AS writer \r\n"
			+ "	FROM\r\n"
			+ "	 calendar c\r\n"
			+ "	JOIN\r\n"
			+ "	users u ON c.user_id = u.user_id\r\n"
			+ "	JOIN\r\n"
			+ "	team t ON t.user_id = u.user_id\r\n"
			+ "	AND t.PROJECT_ID = c.project_id\r\n"
			+ "	WHERE\r\n"
			+ "	entity_type='T'\r\n"
			+ "	AND c.project_id=#{project_id}")
	List<Calendar> getTCalList(@Param("project_id") String project_id);
	
	// 캘린더 등록
	@Insert("INSERT INTO calendar values('CAL_'||TO_CHAR(calendar_seq.nextval, 'FM0000'),"
			+ "#{title},#{start}, #{end}, #{content},NULL,NULL,#{allDay},NULL,#{user_id},#{entity_type},#{project_id})")
	int insertCalendar(Calendar ins);

	// 캘린더 수정
    @Update("UPDATE calendar " +
            "SET title = #{title}, " +
            "    start1 = #{start}, " +
            "    end1 = #{end}, " +
            "    allDay = #{allDay}, " +
            "    content = #{content}, " +
            "    entity_type = #{entity_type} " +
            "WHERE cal_id = #{id} and user_id = #{user_id}")
    int updateCalendar(Calendar upt);

    // 캘린더 삭제
    @Delete("DELETE FROM calendar " +
            "WHERE cal_id = #{id} and user_id = #{user_id}")
    int deleteCalendar(@Param("id") String id,@Param("user_id") String user_id);
	
	
	
	
	
	// 프로필
	@Select("SELECT\r\n"
			+ "* FROM users\r\n"
			+ "WHERE USER_ID=#{user_id}")
	Users getProfile(@Param("user_id")String id);
	
	@Update("UPDATE users \r\n"
			+ "SET\r\n"
			+ "user_name=#{user_name},\r\n"
			+ "email=#{email},\r\n"
			+ "company_id=#{company_id},\r\n"
			+ "image=#{fname}\r\n"
			+ "WHERE user_id=#{user_id}")
	int updateImageProfile(Users upt);
	@Update("UPDATE users \r\n"
			+ "SET\r\n"
			+ "user_name=#{user_name},\r\n"
			+ "email=#{email},\r\n"
			+ "company_id=#{company_id}\r\n"
			+ "WHERE user_id=#{user_id}")
	int updateProfile(Users upt);
	
	@Select("	select count(*) \r\n"
			+ "	from users\r\n"
			+ "	where user_id=#{user_id}\r\n"
			+ "and password = #{password}")
	int checkOldPwd(Users cpw);
	
	@Update("UPDATE USERS\r\n"
			+ "	SET PASSWORD = #{new_password}\r\n"
			+ "	WHERE user_id = #{user_id}")
	int changePassword(Users cpw);
	
	
	
	// 메인 활동중인 프로젝트 수
	@Select("SELECT COUNT(*) AS active_project_count -- 활동 중인 프로젝트 수\n"
			+ "   FROM users u\n"
			+ "   JOIN team tm ON u.user_id = tm.user_id\n"
			+ "   JOIN project p ON tm.project_id = p.project_id\n"
			+ "   WHERE u.user_id = #{user_id}\n"
			+ "   AND p.end_date >= SYSDATE")
	int activeProjectCnt(@RequestParam("user_id") String user_id);
	// 메인 완료된 프로젝트 수
	@Select("SELECT COUNT(*) AS completed_project_count -- 완료된 프로젝트 수\n"
			+ "	FROM users u\n"
			+ "	JOIN team tm ON u.user_id = tm.user_id\n"
			+ "	JOIN project p ON tm.project_id = p.project_id\n"
			+ "	WHERE u.user_id = #{user_id}\n"
			+ "	AND p.end_date < SYSDATE")
	int completeProjectCnt(@RequestParam("user_id") String user_id);
	
	
	
	
}
