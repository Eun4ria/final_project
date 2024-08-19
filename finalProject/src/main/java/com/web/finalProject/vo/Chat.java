package com.web.finalProject.vo;

import java.util.Date;

public class Chat {
	
	private int cnt;
	private int level;
	
	private String user_id;
	private String user_name;
	private String email;
	// user_id
	// project_id
	// owner_id
	
    private String chatroom_id;
    private String chatroom_name;
    private String owner_id;
    private String chatmem_id;
    private String ban_status;
    private Date ban_date;
    private Date uptdate;
    private String project_id;
	/**
	 * 
	 */
	public Chat() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param cnt
	 * @param level
	 * @param user_id
	 * @param user_name
	 * @param email
	 * @param chatroom_id
	 * @param chatroom_name
	 * @param owner_id
	 * @param chatmem_id
	 * @param ban_status
	 * @param ban_Date
	 * @param uptDate
	 * @param project_id
	 */
	public Chat(int cnt, int level, String user_id, String user_name, String email, String chatroom_id,
			String chatroom_name, String owner_id, String chatmem_id, String ban_status, Date ban_date, Date uptdate,
			String project_id) {
		super();
		this.cnt = cnt;
		this.level = level;
		this.user_id = user_id;
		this.user_name = user_name;
		this.email = email;
		this.chatroom_id = chatroom_id;
		this.chatroom_name = chatroom_name;
		this.owner_id = owner_id;
		this.chatmem_id = chatmem_id;
		this.ban_status = ban_status;
		this.ban_date = ban_date;
		this.uptdate = uptdate;
		this.project_id = project_id;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
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
	public String getChatmem_id() {
		return chatmem_id;
	}
	public void setChatmem_id(String chatmem_id) {
		this.chatmem_id = chatmem_id;
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