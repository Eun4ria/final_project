package com.web.finalProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalProject.mapper.A01_Dao;

@Service
public class A01_Service {
	@Autowired(required=false)
	private A01_Dao dao;
	
}
