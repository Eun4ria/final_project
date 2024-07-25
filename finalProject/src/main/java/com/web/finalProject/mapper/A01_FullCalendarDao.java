package com.web.finalProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.finalProject.vo.Calendar;

@Mapper
public interface A01_FullCalendarDao {

	@Select("select id, title, writer, start1 \"start\", end1 \"end\", content, backgroundColor,\r\n"
			+ "		textColor, allDay, urlLink\r\n"
			+ "from calendar2")
	List<Calendar> getCalendarList();
	
	@Insert("INSERT INTO calendar2 values(cal_seq2.nextval,\r\n"
			+ "	#{title},#{writer},#{start},#{end},\r\n"
			+ "	#{content},#{backgroundColor},#{textColor},#{allDay},\r\n"
			+ "	#{urlLink})")
	int insertCalendar(Calendar ins);
	@Update("UPDATE CALENDAR2 \r\n"
			+ "SET title = #{title},\r\n"
			+ "    start1=#{start},\r\n"
			+ "    end1=#{end},\r\n"
			+ "    writer=#{writer},\r\n"
			+ "    content=#{content},\r\n"
			+ "    backgroundColor=#{backgroundColor},\r\n"
			+ "    textColor=#{textColor},\r\n"
			+ "    allDay = #{allDay},\r\n"
			+ "    urlLink=#{urlLink}\r\n"
			+ "WHERE id = #{id}")
	int updateCalendar(Calendar upt);
	
	@Delete("DELETE FROM calendar2\r\n"
			+ "WHERE id = #{id}")
	int deleteCalendar(@Param("id") int id);	

	
	// service ==> controller url mapping   calList  insertCalendar
	
}
