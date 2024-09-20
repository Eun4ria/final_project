package com.web.finalProject.vo;

public class Userfile {
	private String user_id;
	private String image;
	private String etc;
	public Userfile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Userfile(String user_id, String image, String etc) {
		super();
		this.user_id = user_id;
		this.image = image;
		this.etc = etc;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
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

	
	
	
}
