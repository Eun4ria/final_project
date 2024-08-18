package com.web.finalProject.vo;

import java.util.Date;

public class Taskfile {
	
	private String task_id; // no : 고유 번호
	private String fname;
	private String Etc;
	private Date regdate;
	private Date uptdate;
	public Taskfile() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Taskfile(String task_id, String fname, String etc) {
		super();
		this.task_id = task_id;
		this.fname = fname;
		Etc = etc;
	}

	public Taskfile(String fname, String etc) {
		super();
		this.fname = fname;
		Etc = etc;
	}

	public Taskfile(String task_id, String fname, String etc, Date regdate, Date uptdate) {
		super();
		this.task_id = task_id;
		this.fname = fname;
		Etc = etc;
		this.regdate = regdate;
		this.uptdate = uptdate;
	}
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getEtc() {
		return Etc;
	}
	public void setEtc(String etc) {
		Etc = etc;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUptdate() {
		return uptdate;
	}
	public void setUptdte(Date uptdate) {
		this.uptdate = uptdate;
	}
	
	
	
}
