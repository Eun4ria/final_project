package com.web.finalProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.web.finalProject.vo.Tasks;

@Mapper
public interface A03_Dao {
	@Select("SELECT * FROM task\r\n"
			+ "WHERE user_id = #{user_id}\r\n"
			+ "AND project_id = #{project_id}")
	List<Tasks> getTaskList(Tasks sch);
}
