package com.web.finalProject.vo;

import java.util.Date;

public class ChatRoom {
	private String chatroom_id;
	private String chatroom_name;
	private String owner_id;
	private String user_id;
	private String ban_status;
	private Date ban_date;
	private Date uptdate;
	private String project_id;
	public ChatRoom() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatRoom(String chatroom_id, String chatroom_name, String owner_id, String user_id, String ban_status,
			Date ban_date, Date uptdate, String project_id) {
		super();
		this.chatroom_id = chatroom_id;
		this.chatroom_name = chatroom_name;
		this.owner_id = owner_id;
		this.user_id = user_id;
		this.ban_status = ban_status;
		this.ban_date = ban_date;
		this.uptdate = uptdate;
		this.project_id = project_id;
	}
	public String getChatroom_id() {
		return chatroom_id;
	}
	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}
	public String getChatroom_name() {
		return chatroom_name;
	}
	public void setChatroom_name(String chatroom_name) {
		this.chatroom_name = chatroom_name;
	}
	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBan_status() {
		return ban_status;
	}
	public void setBan_status(String ban_status) {
		this.ban_status = ban_status;
	}
	public Date getBan_date() {
		return ban_date;
	}
	public void setBan_date(Date ban_date) {
		this.ban_date = ban_date;
	}
	public Date getUptdate() {
		return uptdate;
	}
	public void setUptdate(Date uptdate) {
		this.uptdate = uptdate;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	
	
	
}
