package com.web.finalProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalProject.mapper.A03_Dao;
import com.web.finalProject.vo.Tasks;

@Service
public class A03_Service {
	@Autowired(required=false)
	private A03_Dao dao;
public List<Tasks> getTaskList(Tasks sch){
		
		return dao.getTaskList(sch);
	}
}
