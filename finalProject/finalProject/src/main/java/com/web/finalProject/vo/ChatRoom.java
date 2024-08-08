package com.web.finalProject.vo;

import java.util.Date;

public class ChatRoom {
	private String chatroom_id;
	private String chatroom_name;
	private String owner_id;
	private String project_id;
	private Date created_date;
	private Date updated_date;
	public ChatRoom() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatRoom(String chatroom_id, String chatroom_name, String owner_id, String project_id, Date created_date,
			Date updated_date) {
		super();
		this.chatroom_id = chatroom_id;
		this.chatroom_name = chatroom_name;
		this.owner_id = owner_id;
		this.project_id = project_id;
		this.created_date = created_date;
		this.updated_date = updated_date;
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
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public Date getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(Date updated_date) {
		this.updated_date = updated_date;
	}
	
	
}
