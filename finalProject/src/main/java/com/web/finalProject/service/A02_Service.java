package com.web.finalProject.service;


import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.finalProject.mapper.A02_Dao;
import com.web.finalProject.util.Util;
import com.web.finalProject.vo.Budget;
import com.web.finalProject.vo.BudgetSch;
import com.web.finalProject.vo.Chat;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.RegMember;
import com.web.finalProject.vo.Taskfile;
import com.web.finalProject.vo.Tasks;
import com.web.finalProject.vo.Users;

import jakarta.mail.Message.RecipientType;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@Service
public class A02_Service {
	@Autowired(required=false)
	private A02_Dao dao;
	@Autowired(required=false)
	private JavaMailSender sender;
	
	// 로그인
   public int loginCk(Users user) {
      return dao.loginCk(user); 
   } 
   public Users login(Users user) {
      return dao.login(user);
   }

	// 회원가입
	// 등록하고 메일이 같이 발송되게
	// email 가지고 오고 사원정보(user_id) 비밀번호(password)
	// email -유효성 -> 사원정보 가지고 온거를 
//	public String insertUser(Users ins) {
//		String msg=null;
//		msg = dao.insertUser(ins)>0?"등록 성공":"등록 실패";
//		// email을 통한 사원정보가지고 오기
//		// 메일발송
//		
//		
//		
//		return msg;
//	}
	  public String insertUser(Users ins) {
	        String msg = null;

	        int result = dao.insertUser(ins);
	        if (result > 0) {
	            msg = "등록 성공";
	            sendEmail(ins.getEmail(), ins.getUser_id());
	        } else {
	            msg = "등록 실패";
	        }

	        return msg;
	    }
	 private void sendEmail(String email, String userId) {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(email);
	        message.setSubject("HPM 회원 가입이 완료되었습니다.");
	        message.setText("귀하의 사용자 ID는 " + userId + " 입니다.");
	        sender.send(message);
	    }
// 이메일 유효성 체크
	public int emailCk(String email) {
		return dao.emailCk(email); 
	}
	

	
// 메일 발송
	public String makeEmpMail(RegMember email) {
		String msg ="사원 등록 및 메일 발송 성공";
		//1.메일 발송 데이터 전송을 위한 객체 생성
		MimeMessage mmsg = sender.createMimeMessage();
		
		//2. 메일 발송 객체에 요청값으로 받은 데이터 할당(MailVo==> MimeMessage)
		
		try {
			//1.제목
			mmsg.setSubject(email.getEmpno()+"입사하신 것을 환영합니다!");
			//2.수신자
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(email.getEmail()));
			//3.발신자
			//4.내용
			String content = "입사하신 것을 환영합니다.\r\n"
					+ "사번은 "+email.getEmpno()+"임시비번은"+Util.mkTPwd()+"입니다.\r\n"
							+ "이 계정과 비번으로 들어오셔서 인증하고 개인번호를 수정해주세요";
					
			mmsg.setText(content);
		// 3. 발송처리
			sender.send(mmsg);
			
		}catch(MessagingException e) {
			System.out.println("메일 전송 에러:"+e.getMessage());
			msg = "기타 에러:"+e.getMessage();
		}catch(Exception e) {
			System.out.println("기타 에러:"+e.getMessage());
			msg ="기타 에러"+e.getMessage();
		}
		return msg;
	}
	
// 프로젝트 리스트
	public List<Project> getProjectList(String user_id){
    	return dao.getProjectList(user_id);
    }



	//채팅
		//채팅-멤버 리스트
			public List<Users> getmemList(Users sch){
				if(sch.getProject_id()==null) sch.setProject_id("");
				if(sch.getUser_id()==null) sch.setUser_id("");
				return dao.getMemList(sch);
			}
//			public Chat chat(Chat chat) {
//				return dao.chat(chat);
//			}
		// 채팅방 유무 확인 
			 public int chatroomCk(Chat ch) {
				 int cnt = dao.chatroomCk(ch);
				 
			      return cnt; 
			   } 
			 // 채팅방 아이디, 이름 가져오기
			 public Chat getchatRoomId(Chat get) {
				 return dao.getchatRoomId(get); 
			 } 
			
		//채팅 등록
			public String insertchatroom(Chat ins) {
				
				return dao.insertchatroom(ins)>0?"생성 완료":"생성 실패";
			}
		//채팅 등록
			public String insertchatroom1(Chat ins1) {
				
				return dao.insertchatroom1(ins1)>0?"생성 완료":"생성 실패";
			}
			
		//채팅 리스트
			public List<Chat> getchatList(Chat chsch){
				return dao.getchatList(chsch);
			}
			
		
// 업무(to do) : 멤버
		public List<Tasks> getTaskList(Tasks sch){
			return dao.getTaskList(sch);
		}	
// 업무(to do) : PM
		public List<Tasks> getAllTaskList(Tasks sch){
			return dao.getAllTaskList(sch);
		}	
			
// ToDo detail -상세
		public Tasks getTaskDetail(String task_id){
			return dao.getTaskDetail(task_id);
		}	
		
		@Value("${user.upload2}")
		String path;
// ToDo update -> 수정 + //산출물 관리
		public String updatetask(Tasks upt) {
			String msg = null;
			msg = dao.updatetask(upt)>0? "수정성공":"수정실패";
			
			//파일 업로드 
			if(upt.getReports()!=null && upt.getReports().length>0) {
				try {
					// 파일 업로드
					int fcnt=0;
					for(MultipartFile mp:upt.getReports() ) { //다중파일
						String fnm = mp.getOriginalFilename();
						if( fnm!=null && !fnm.equals("") ) {
							System.out.println("파일 이름: " + fnm);
							File fup = new File(path,fnm);
							mp.transferTo(fup);
							//fcnt++;
							// 파일정보 등록.
							fcnt+=dao.taskfileinsert(
									new Taskfile(upt.getTask_id(), fnm, upt.getTask_id()+"관련 파일 등록") );
						}
					}
					msg+="\n 파일 "+fcnt+"건 등록 성공";
				} catch (IllegalStateException e) {
					msg+="\n 파일 등록 에러 발생:"+e.getMessage();
					
				} catch (IOException e) {
					msg+="\n 파일 등록 에러 발생"+e.getMessage();
				} catch(Exception e) {
					msg+="\n 파일 등록 기타 에러 발생"+e.getMessage();
				}				
				
			}
			System.out.println("메시지:"+msg);
			
			return msg;
		}
//파일 이름
		public List<Taskfile> getfilename(String task_id) {
			return dao.getfilename(task_id);
		}
		
		
// ToDo delete -> 삭제
		public String deletetask(String del) {
			return dao.deletetask(del)>0? "삭제성공":"삭제실패";
		}

// 예산 관리
	public List<Budget> getBudgetList(BudgetSch sch){
		if(sch.getProject_id()==null) sch.setProject_id("");
		// 1. 총데이터 수 (DB)
			sch.setCount(dao.getBudgetCount(sch));
		// 2. 현재 클릭한 번호(화면단 요청값) - 초기값 1(첫번째 페이지)
			if(sch.getCurPage()==0) {
				sch.setCurPage(1);
			}
		// 3. 한 페이지에 보일 데이터 건수(화면단 선택으로 요청값) - 초기값5(첫번째 페이지)
		if(sch.getPageSize()==0) {
			sch.setPageSize(7);
		}	
		// 4. 총페이지수(수치 연산/알고리즘 - 총데이터 건수/한페이지에 보일 데이터 수)
		sch.setPageCount((int)( Math.ceil(sch.getCount()/(double)sch.getPageSize())));	
		//마지막 page block에서 next를 클릭하더라고 더이상 페이지 번호가 증가되지 않게
			if(sch.getCurPage()>sch.getPageCount()) {
				sch.setCurPage(sch.getPageCount());
			}	
		/* 5. 데이터 값: 시작번호/마지막번호 - 마지막 (한페이지에 보일 데이터 건수*현재 클릭한 번호) */
			sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
			int imEnd = sch.getPageSize()*sch.getCurPage();
			sch.setEnd((imEnd)>sch.getCount()?sch.getCount():imEnd);
			
	// 6. 페이징 블럭 처리 
			// 1) 블럭 크기 설정 
			sch.setBlockSize(5);
			// 2) 블럭 번호 지정  -  1~5 ==> 1,  6~10 ==> 2,  11~15 ==> 3
			int blockNum = (int) Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
			// 3) 시작 블럭
			sch.setStartBlock((blockNum-1)*sch.getBlockSize()+1);
			// 4) 마지막 블럭
			int endBlock = blockNum*sch.getBlockSize();
			sch.setEndBlock((endBlock)>sch.getPageCount()?sch.getPageCount():endBlock);
			
		
		return dao.getBudgetList(sch);
	}
// 부모요소 선택
	public List<Budget> getparentList(BudgetSch sch){
		return dao.getparentList(sch);
	}
	// budget 등록 
	public String budgetInsert(Budget ins) {
		
			return dao.budgetInsert(ins)>0?"등록 완료":"등록 실패";
		
	}
	// 예산 상세 
	public List<Budget> getBudgetById(String budget_id) {
        return dao.findBudgetId(budget_id);
    }
	
	// budget 수정
	public String budgetUpdate(Budget upt) {
		
		return dao.budgetUpdate(upt)>0?"수정 완료":"수정 실패";
	}
	// budget 삭제
	public String deleteBudget(Budget del) {
		return dao.deleteBudget(del)>0? "삭제 성공":"삭제 실패";
	}
	// 자식 확인
	public boolean countchild(Budget del) {
		return dao.countchild(del.getBudget_id()) > 0;
	}
	// budget 자식 삭제
	public String deleteChild(Budget del) {
		return dao.deleteChild(del)>0? "삭제 성공":"삭제 실패";
	}
	
	
//차트 
	//level=2 선택
	public List<Budget> getBudgetparentchartList(String project_id){
		return dao.getBudgetparentchartList(project_id);
	}
	//level=2 선택
	public List<Budget> getchartAmount(Budget sch){
		return dao.getchartAmount(sch);
	}
	
	
	
	
	

	    
}