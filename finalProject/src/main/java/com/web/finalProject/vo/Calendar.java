package com.web.finalProject.vo;

public class Calendar {
	private String id;
	private String title;
	private String user;
	private String start;
	private String end;
	private String content;
	private String backgroundColor;
	private String textColor;
	private String urlLink;
	
	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Calendar(String id, String title, String user, String start, String end, String content,
			String backgroundColor, String textColor, String urlLink) {
		super();
		this.id = id;
		this.title = title;
		this.user = user;
		this.start = start;
		this.end = end;
		this.content = content;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.urlLink = urlLink;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getUrlLink() {
		return urlLink;
	}

	public void setUrlLink(String urlLink) {
		this.urlLink = urlLink;
	}
	
	
}
