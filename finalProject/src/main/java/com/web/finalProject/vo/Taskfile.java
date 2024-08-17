package com.web.finalProject.vo;

import java.util.Date;

public class Taskfile {
	
	private int task_id; // no : 고유 번호
	private String fname;
	private String Etc;
	private Date regdte;
	private Date uptdte;
	public Taskfile() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Taskfile(String fname, String etc) {
		super();
		this.fname = fname;
		Etc = etc;
	}

	public Taskfile(int task_id, String fname, String etc, Date regdte, Date uptdte) {
		super();
		this.task_id = task_id;
		this.fname = fname;
		Etc = etc;
		this.regdte = regdte;
		this.uptdte = uptdte;
	}
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
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
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	public Date getUptdte() {
		return uptdte;
	}
	public void setUptdte(Date uptdte) {
		this.uptdte = uptdte;
	}
	
	
	
}
