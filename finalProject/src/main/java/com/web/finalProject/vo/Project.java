package com.web.finalProject.vo;

public class Project {
   private String project_name;
   private String project_id;
   private String etc;
   private String start_date;
   private String end_date;
   private String create_date;
   private boolean pstatus;
   private String company_id;
   private String user_name;
   private String user_id;
   private String image;
   
   public String getImage() {
      return image;
   }
   public void setImage(String image) {
      this.image = image;
   }
   private int amount; 
   public String getUser_name() {
      return user_name;
   }
   public void setUser_name(String user_name) {
      this.user_name = user_name;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public int getAmount() {
      return amount;
   }
   public void setAmount(int amount) {
      this.amount = amount;
   }
   public String getProject_name() {
      return project_name;
   }
   public void setProject_name(String project_name) {
      this.project_name = project_name;
   }
   public String getProject_id() {
      return project_id;
   }
   public void setProject_id(String project_id) {
      this.project_id = project_id;
   }
   public String getEtc() {
      return etc;
   }
   public void setEtc(String etc) {
      this.etc = etc;
   }
   public String getStart_date() {
      return start_date;
   }
   public void setStart_date(String start_date) {
      this.start_date = start_date;
   }
   public String getEnd_date() {
      return end_date;
   }
   public void setEnd_date(String end_date) {
      this.end_date = end_date;
   }
   public String getCreate_date() {
      return create_date;
   }
   public void setCreate_date(String create_date) {
      this.create_date = create_date;
   }
   public boolean isPstatus() {
      return pstatus;
   }
   public void setPstatus(boolean pstatus) {
      this.pstatus = pstatus;
   }
   public String getCompany_id() {
      return company_id;
   }
   public void setCompany_id(String company_id) {
      this.company_id = company_id;
   }
}
