package com.web.finalProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.web.finalProject.vo.Board;

@Mapper
public interface A02_BoardDao2 {
	
	@Select("select * from board")
	List<Board> getBoardList(Board sch);
	
}
