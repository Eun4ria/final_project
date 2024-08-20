package com.web.finalProject.vo;



public class Budget {
	private int level;
	private int cnt;
	private int count;
	
	private String budget_id;    
    private String budget_name;  
    private int amount;      
    private String regdate;       
    private String usedate;  
    private String uptdate;
    private String project_id;  
    private String parent_id;    
    private int levels;
    private String etc;
    private String user_id;
	public Budget() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Budget(int level, int cnt, int count, String budget_id, String budget_name, int amount, String regdate,
			String usedate, String project_id, String parent_id, int levels, String etc, String user_id) {
		super();
		this.level = level;
		this.cnt = cnt;
		this.count = count;
		this.budget_id = budget_id;
		this.budget_name = budget_name;
		this.amount = amount;
		this.regdate = regdate;
		this.usedate = usedate;
		this.project_id = project_id;
		this.parent_id = parent_id;
		this.levels = levels;
		this.etc = etc;
		this.user_id = user_id;
	}

	public Budget(int level, int cnt, String budget_id, String budget_name, int amount, String regdate, String usedate,
			String project_id, String parent_id, int levels, String user_id) {
		super();
		this.level = level;
		this.cnt = cnt;
		this.budget_id = budget_id;
		this.budget_name = budget_name;
		this.amount = amount;
		this.regdate = regdate;
		this.usedate = usedate;
		this.project_id = project_id;
		this.parent_id = parent_id;
		this.levels = levels;
		this.user_id = user_id;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getBudget_id() {
		return budget_id;
	}
	public void setBudget_id(String budget_id) {
		this.budget_id = budget_id;
	}
	public String getBudget_name() {
		return budget_name;
	}
	public void setBudget_name(String budget_name) {
		this.budget_name = budget_name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getUsedate() {
		return usedate;
	}
	public void setUsedate(String usedate) {
		this.usedate = usedate;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public int getLevels() {
		return levels;
	}
	public void setLevels(int levels) {
		this.levels = levels;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getUptdate() {
		return uptdate;
	}

	public void setUptdate(String uptdate) {
		this.uptdate = uptdate;
	}
	
	

    
}
