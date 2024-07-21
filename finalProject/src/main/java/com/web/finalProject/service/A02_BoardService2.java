package com.web.finalProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalProject.mapper.A02_BoardDao2;
import com.web.finalProject.vo.Board;

@Service
public class A02_BoardService2 {
	@Autowired(required=false)
	private A02_BoardDao2 dao;
	
	public List<Board> getBoardList(Board sch){
		return dao.getBoardList(sch);
	}
	
}
