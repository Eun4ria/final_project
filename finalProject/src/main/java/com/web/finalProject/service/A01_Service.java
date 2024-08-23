package com.web.finalProject.service;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.finalProject.mapper.A01_Dao;
import com.web.finalProject.util.Util;
import com.web.finalProject.vo.Calendar;
import com.web.finalProject.vo.Company;
import com.web.finalProject.vo.GanttTask;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.UserSch;
import com.web.finalProject.vo.Users;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;

@Service
public class A01_Service {
   @Autowired(required=false)
   private A01_Dao dao;
   
   public String find_id(Users user) {
      String id = dao.find_id(user);      
      return id==null?"해당 계정 정보 없습니다":id;
   }
   
   
    
    public List<GanttTask> getGantt(String project_id){
       return dao.getGantt(project_id);
    }
    public List<Users> getTeam(String project_id){
       return dao.getTeam(project_id);
    }
    public String insertGantt(GanttTask ins) {
       return dao.insertGantt(ins)>0?"생성 완료":"생성 실패";
    }
    public String updateGantt(GanttTask upt) {
       return dao.updateGantt(upt)>0?"수정 완료":"수정 실패";
    }
    public String deleteGantt(String task_id) {
       return dao.deleteGantt(task_id)>0?"삭제 완료":"삭제 실패";
    }   
    
    
    // 프로젝트 생성
    public String insertProject(Project ins) {
        dao.insertProject(ins);
        // 생성된 project_id를 조회
        String projectId = dao.getLastInsertedProjectId();
        ins.setProject_id(projectId);
        return dao.insertProject(ins)>0?"프로젝트 생성":"프로젝트 생성 실패";
    }
    // 프로젝트 팀원 추가하기 위한 user리스트(드롭박스)
    public List<Users> getUserProIns(String my_id){
       return dao.getUserProIns(my_id);
    }    
    // 프로젝트 PM할당
    public int addProjectPM(String project_id, String user_id) {
        return dao.addProjectUser(project_id, user_id);
    }  
    // 프로젝트에 팀원 추가(team테이블)
    public void addProjectMem(String projectId, List<String> userIds) {
        for (String userId : userIds) {
            dao.addProjectUser(projectId, userId);
        }
    }
    public List<Company> getComId() {
       return dao.getComId();
    }
    
    
    
    
    
    // 프로젝트 생성 후 팀원 추가 위한 전체 user정보 (페이징)
    public List<Users> getUserList(UserSch sch){
       if(sch.getUser_id()==null) sch.setUser_id("");
       if(sch.getUser_name()==null) sch.setUser_name("");
       if(sch.getDname()==null) sch.setDname("");
       if(sch.getCompany_id()==null) sch.setCompany_id("");
      // 1. 총데이터 수(DB)
       int totalCount = dao.getUserCount(sch);
       sch.setCount(totalCount);
      
      // 2. 현재 클릭한 번호 
      if(sch.getCurPage()==0) {
         sch.setCurPage(1); // 초기값 1
      }
      
      // 3. 한페이지에 보일 데이터 건수(화면단 선택으로 요청값)
      if(sch.getPageSize()==0) {
         sch.setPageSize(5); // 초기값 5
      }
      
      // 4. 총페이지수(수치연산/알고리즘 - 총데이터건수/한페이지에 보일 데이터 수)
      sch.setPageCount( (int)(Math.ceil(sch.getCount()/(double)sch.getPageSize())) );
      
      // 마지막 page block에서 next를 클릭하더라도, 더 이상 페이지번호가 증가되지 않게 처리..
      if(sch.getCurPage()>sch.getPageCount()) {
         sch.setCurPage(sch.getPageCount());
      }
      
      // 5. 시작번호/마지막번호 -  마지막번호( 한페이지에 보일 데이터 건수*현재 클릭한 번호)
      //    마지막번호는 마지막데이터건수보다 클 수 없다      
      sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
      
      int imEnd = sch.getPageSize()*sch.getCurPage();
      sch.setEnd(imEnd > sch.getCount()?sch.getCount():imEnd);
      
      // 데이터가 없을 경우 빈 리스트 반환
       if (totalCount == 0) {
           return Collections.emptyList();
       }
      
      // 6. 페이징 블럭 처리..
      //    1) 블럭 크기 설정.-일반적으로 홀수로 정함..
      sch.setBlockSize(5);
      //  2) 블럭 번호 지정
      int blockNum = (int) Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
      //  3) 시작블럭
      sch.setStartBlock((blockNum-1)*sch.getBlockSize()+1);
      //  4) 마지막블럭
      int endBlock = blockNum*sch.getBlockSize();
      sch.setEndBlock( (endBlock>sch.getPageCount())?sch.getPageCount():endBlock );
      
      return dao.getUserList(sch);
   }
    public String updateUser(Users upt) {
       return dao.updateUser(upt)>0?"수정 완료":"수정 실패";
    }
    public String deleteUser(String user_id) {
       return dao.deleteUser(user_id)>0?"삭제 완료":"삭제 실패";
    }
    
    
    // 팀원 상세 정보
    public Users getUser(String user_id){
      return dao.getUser(user_id);
   }
    
    
    
    
    
    
    // main과 profile에서 보일 프로젝트 리스트
    public List<Project> getProjectList(String user_id){
       return dao.getProjectList(user_id);
    }
    public List<Project> getComProjectList(String user_id){
       return dao.getComProjectList(user_id);
    }
    
    
    
    public String find_pwd(Users user) {
      return dao.find_pwd(user)>0?"":"해당 계정 정보 없습니다";
   }
    
    public int updateTempPwd(String tempPwd,String user_id) {
       return dao.updateTempPwd(tempPwd, user_id);
    }
    
    // 임시 비밀번호 메일 발송
    @Autowired(required = false)
   private JavaMailSender sender;

   public String makeTempPwd(Users user) {
      String msg = "임시 비밀번호 메일 발송 성공 \\n"
            + "이메일을 확인하세요";
      // 1. 메일 발송 데이터 전송을 위한 객체 생성
      MimeMessage mmsg = sender.createMimeMessage();
      try {
         String tempPwd = Util.mkTPwd();
         System.out.println("생성된 임시 비밀번호"+tempPwd);         
         mmsg.setSubject("<HPM> "+user.getUser_name()+"님의 임시 비밀번호입니다.");
         mmsg.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
         String content = user.getUser_name()+"님의 임시 비밀번호는 "+tempPwd+" 입니다.\r\n"
               + "빠른 시일 내 비밀번호를 변경해주세요 \r\n"
               + "**비밀번호 권장 변경 주기는 3개월 입니다.**";
         mmsg.setText(content);
         
         // 임시비밀번호 DB업데이트
         int updateCount = dao.updateTempPwd(tempPwd, user.getUser_id());
           if (updateCount <= 0) {
               // 업데이트 실패 시
               msg = "임시 비밀번호 업데이트 실패";
           }
           
         sender.send(mmsg);
      } catch (MessagingException e) {
         System.out.println("메일 전송 에러:"+e.getMessage());
         msg = "메일 전송 에러:"+e.getMessage();
      } catch(Exception e) {
         System.out.println("기타 에러:"+e.getMessage());
         msg = "기타 에러:"+e.getMessage();
      }
      return msg;
   }
    
   
   // 개인 및 팀 캘린더 일정조회
    public List<Calendar> getCalendarList(String sel, String user_id, String project_id) {
        if ("P".equals(sel)) {
            return dao.getPCalList(user_id);
        } else if ("T".equals(sel)) {
            return dao.getTCalList(project_id);
        } else if ("G".equals(sel)) {
           return dao.getGanttCalList(project_id);
        } else {
            return List.of(); // 빈 리스트 반환
        }
    }
    
    // 캘린더 등록
    public String insertCalendar(Calendar ins) {
        return dao.insertCalendar(ins)>0?"등록 완료":"등록 실패";
    }

    // 캘린더 수정
    public String updateCalendar(Calendar upt) {
        return dao.updateCalendar(upt)>0?"수정 완료":"수정 실패";
    }

    // 캘린더 삭제
    public String deleteCalendar(String id, String user_id) {
        return dao.deleteCalendar(id,user_id)>0?"삭제 완료":"삭제 실패";
    }
    
    
    
    
    
    /*
   // 간트 캘린더
   public List<Calendar> getCalList(String project_id){
         return dao.getGanttCalList(project_id);
   }
   */
   /*
   // 간트(task) 캘린더
   public List<Calendar> getGanttCalList(String project_id){
      return dao.getGanttCalList(project_id);
   }
   // 개인 캘린더
   public List<Calendar> getPCalList(String user_id){
      return dao.getPCalList(user_id);
   }
   // 캘린더
   public List<Calendar> getTCalList(String project_id){
      return dao.getTCalList(project_id);
   }
   */
    
   // 프로필
   public Users getProfile(String id) {
      return dao.getProfile(id);
   }
   
   @Value("${user.upload}")
   String path;
   
   public String updateProfileWithFile(MultipartFile file, Users user) {
       String msg = null;

       try {          
           if (file != null && !file.isEmpty()) {
              String fname = file.getOriginalFilename();
              if( fname!=null && !fname.equals("") ) {
               File fup = new File(path,fname);
               file.transferTo(fup);
               user.setFname("/z01_upload/"+fname);
               int result = dao.updateProfile( user);
                 if (result > 0) {
                     msg = "수정 성공";
                 }
            }
               
               
           }
           
       } catch (IOException e) {
           msg = "파일 등록 중 에러 발생: " + e.getMessage();
       } catch (IllegalArgumentException e) {
           msg = e.getMessage();
       } catch (Exception e) {
           msg = "기타 에러 발생: " + e.getMessage();
       }

       return msg;
   }

   
   public int checkOldPwd(Users cpw) {
      return dao.checkOldPwd(cpw);
   }
   public String changePassword(Users cpw) {
      return dao.changePassword(cpw)>0?"수정 성공":"수정 실패";
   }
   
   
   
   
}