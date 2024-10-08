package com.web.finalProject.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Tasks {
	
	private int cnt;  // 페이지 순서?
	private int level;  // 자식 요소 레벨
	private int no;  // 고유번호 => task_id
	private int refno;  // 부모번호 => parent_id
	
	private String task_id;
    private String task_name; //subject
    @JsonFormat(pattern = "dd-MM-yyyy")
    private Date start_date;
    private Date end_date;
    private String priority;
    private String parent_id;  // 부모 작업이 없을 수도 있으므로 String로 선언
    private String content;
    private int progress;
    private String backgroundcolor;
    private String textcolor;
    private String tstatus;
    private String user_id;
    private String project_id;
    
    private String endDateFormatted;
    private String startDateFormatted;
    
    //파일 업로드
    private MultipartFile[] reports;
	private List<String> fnames;
    
	public Tasks() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Tasks(String task_id, String task_name, Date start_date, Date end_date, String priority, String parent_id,
			String content, int progress, String backgroundcolor, String textcolor, String tstatus, String user_id,
			String project_id) {
		super();
		this.task_id = task_id;
		this.task_name = task_name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.priority = priority;
		this.parent_id = parent_id;
		this.content = content;
		this.progress = progress;
		this.backgroundcolor = backgroundcolor;
		this.textcolor = textcolor;
		this.tstatus = tstatus;
		this.user_id = user_id;
		this.project_id = project_id;
	}
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public String getBackgroundcolor() {
		return backgroundcolor;
	}
	public void setBackgroundcolor(String backgroundcolor) {
		this.backgroundcolor = backgroundcolor;
	}
	public String getTextcolor() {
		return textcolor;
	}
	public void setTextcolor(String textcolor) {
		this.textcolor = textcolor;
	}
	public String getTstatus() {
		return tstatus;
	}
	public void setTstatus(String tstatus) {
		this.tstatus = tstatus;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getEndDateFormatted() {
		return endDateFormatted;
	}
	public void setEndDateFormatted(String endDateFormatted) {
		this.endDateFormatted = endDateFormatted;
	}
	public String getStartDateFormatted() {
		return startDateFormatted;
	}
	public void setStartDateFormatted(String startDateFormatted) {
		this.startDateFormatted = startDateFormatted;
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
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	public MultipartFile[] getReports() {
		return reports;
	}
	public void setReports(MultipartFile[] reports) {
		this.reports = reports;
	}
	public List<String> getFnames() {
		return fnames;
	}
	public void setFnames(List<String> fnames) {
		this.fnames = fnames;
	}
	
	
	
    
}
