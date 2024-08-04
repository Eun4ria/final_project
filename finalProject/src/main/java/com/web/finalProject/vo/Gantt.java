package com.web.finalProject.vo;

import java.util.List;

public class Gantt {
	private List<GanttTask> ganttList;
	private List<Users> resource;
	public Gantt() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Gantt(List<GanttTask> ganttList, List<Users> resource) {
		super();
		this.ganttList = ganttList;
		this.resource = resource;
	}
	public List<GanttTask> getGanttList() {
		return ganttList;
	}
	public void setGanttList(List<GanttTask> ganttList) {
		this.ganttList = ganttList;
	}
	public List<Users> getResource() {
		return resource;
	}
	public void setResource(List<Users> resource) {
		this.resource = resource;
	}
	
	
}
