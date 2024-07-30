package com.web.finalProject.vo;

public class Users {
	private String user_id;
	private String user_name;
	private String email;
	private String password;
	private int deptno;
	private String company_id;
	private String role_code;
	private String name;
	private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Users(String user_id, String user_name, String email, String password, int deptno, String company_id,
			String role_code) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.email = email;
		this.password = password;
		this.deptno = deptno;
		this.company_id = company_id;
		this.role_code = role_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public String getRole_code() {
		return role_code;
	}
	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}
	
}
