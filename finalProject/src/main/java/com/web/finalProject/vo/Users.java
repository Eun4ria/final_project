package com.web.finalProject.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Users {
	
	private String project_id;
	private String owner_id;
	
	private String user_id;
	private String user_name;
	private String email;
	private String password;
	private int deptno;
	private String company_id;
	private String role_code;
	private String name;
	private String id;
	private String text;
	private String key;
	private String image;
	private String label;
	private String new_password;
<<<<<<< HEAD
	private String etc;
=======
	private String dname;
	private boolean project_status;
	private int cnt;
>>>>>>> branch 'main-middle' of https://github.com/Eun4ria/final_project.git
	
<<<<<<< HEAD
	
	private MultipartFile[] reports;
	private List<String> images;
	
	
	
	
	
	

=======
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public boolean isProject_status() {
		return project_status;
	}
	public void setProject_status(boolean project_status) {
		this.project_status = project_status;
	}
	public String getNew_password() {
		return new_password;
	}
	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}
>>>>>>> branch 'main-middle' of https://github.com/Eun4ria/final_project.git
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	
	public MultipartFile[] getReports() {
		return reports;
	}
	public void setReports(MultipartFile[] reports) {
		this.reports = reports;
	}
	public List<String> getImages() {
		return images;
	}
	public void setImages(List<String> images) {
		this.images = images;
	}
	public String getNew_password() {
		return new_password;
	}
	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
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
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	
	
}