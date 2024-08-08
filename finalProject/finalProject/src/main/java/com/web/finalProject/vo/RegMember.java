package com.web.finalProject.vo;

public class RegMember {
	private String empno;
	private String email;
	public RegMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RegMember(String empno, String email) {
		super();
		this.empno = empno;
		this.email = email;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
