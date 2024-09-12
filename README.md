# <img src="https://github.com/Eun4ria/final_project/blob/main/HPM_logo.png" style="width:300px;"/>

## 🗂️ 목차
1. 📝 개요
2. 🔧 핵심 기술
3. 📈 프로젝트 계획
4. ✏️ 설계
5. 🛠️ 구현
6. ✅ 정리 사항
7. 🎥 시연 영상
8. 📁 추가 자료
<br>

## 📝 개요

### 개발 기간
: 2024.07.17 ~ 2024.08.25
  
### 프로젝트 주제 <HPMs - H Project Management System>
  
 ① <strong>대상</strong> 
 
 : 프로젝트의 일정 관리 및 전반적인 관리를 필요로 하는 모든 회사
  
 ② <strong>용도</strong> 
 
 : 프로젝트의 계획, 실행, 모니터링 및 종료에 이르는 모든 단계를 효율적으로 관리하는 용도
  
 ③ <strong>선정 이유</strong>
    <ol>
      <li>다양한 프로젝트 진행을 통해 효율적인 프로젝트 관리의 중요성을 실감하게 되었고, 이를 통해 직접 관리 시스템을 제작함.</li>
      <li>일정 관리, 산출물 관리, 채팅 기능 등 다양한 기능을 다루기 위해</li>
    </ol>
  
 ④ <strong>프로젝트 목표</strong> 
 
 : 프로젝트 계획, 실행, 모니터링, 통제 및 완료를 효율적으로 관리하는 데 도움을 주는 간트차트, 실시간 채팅, 캘린더 일정 관리 기능을 포함한 PMS(Project Management System) 구현

### 개발환경 및 도구

### 팀원 소개
<table >
  <tr><th>팀원명</th><th>프로필</th><th>역할</th></tr>
  <tr>
    <td>김은수</td><td></td>
    <td>
      <strong>조장</strong>
      <br>
      사용자 로그인 / 회원가입(mail) / 채팅 / 예산 관리 / 차트 / 
      메인 화면(간략/상세) / To Do List / GitHub 환경 구축 / PPT 제작 
    </td>
  </tr>
  <tr><td>박민경</td><td></td><td></td></tr>
  <tr><td>공통 역할</td><td colspan="2">PMS 분석 / 요구사항 정의서 / 워크플로우 / 설계(화면, DB)</td></tr>
</table>


## 🔧 핵심 기술

## 📈 프로젝트 계획

## ✏️ 설계
### 서버 구축

### ERD
 <img src="/images/ERD.png" alt="회원가입" style="width:900px">

## 🛠️ 구현
<h2>◽ 김은수</h2>
<details>
  <summary>회원관리-회원가입/로그인</summary>
  
  <h3>1. 회원가입</h3>
  <img src="/images/회원가입.png" alt="회원가입" style="width:500px">

  <h4>◾주요 기능</h4>
  
  <h4>1) SMTP</h4>
  <p>• 회원가입 시 입력한 이메일로 자동 생성된 아이디가 전송</p>
  <img src="/images/회원가입_이메일.png" alt="이메일" style="width:500px">
  
  <h4>2) 유효성 검사</h4>
  <div>
    <p>1. 이메일 유효성 검사</p>
    (1) 형식 검증<br>
     <img src="/images/유효성_유효하지 않은 이메일.png" style="width:400px">
    <br>
    (2) 중복 검증<br>
     <img src="/images/유효성_이미 사용중.png" style="width:400px">
    <br>
  </div>
  <div>
    <p>2. 비밀번호 유효성 검사</p>
     (1) 길이 검증<br>
     <img src="/images/비번유효성_6자 이상.png" style="width:400px">
    <br>
    (2) 형식 검증 및 정규 표현식 검증<br>
     <img src="/images/비번유효성_문자,숫자,특수문자.png" style="width:400px">
      <br>
    (3) 입력 일치 검증<br>
     <img src="/images/비번유효성_비번일치.png" style="width:400px">
    <br>
    (4) 필수 입력 검증<br>
    <img src="/images/유효성_회원가입빈칸.png" style="width:400px">
  </div>
  <div style="border: 1px solid violet;">
    <h4>*최종 유효성 확인*</h4>
    <img src="/images/유효성_최종확인.png" style="width:400px">
  </div>
  <br>
<h3> 2. 로그인</h3>
  <p>• 회원가입에 입력한 비밀번호와 이메일을 통해 받은 아이디를 이용</p>
  <img src="https://github.com/user-attachments/assets/8d6e7946-b4b8-4a03-a4f9-1c8ec91446c5" alt="로그인" style="width:400px">
<br>
    <h4><유효성 검사></h4>
    (1) 필수 입력 검증<br>
       <img src="/images/유효성_코드_로그인빈칸.png" style="width:500px">
    <br>
    (2) 존재 여부 검증<br>
      <img src="/images/유효성_로그인.png" style="width:400px">
      <br>
  <h4>*로그인 성공*</h4>
    <img src="/images/로그인 성공.png" style="width:400px">
  <br>
</details>
<details>
  <summary>채팅</summary>
  <strong>주요기능</strong>
  <div>
    1. 웹소켓(WebSocket) : 웹 브라우저와 서버 간의 양방향 통신을 실시간으로 가능하게 하는 프로토콜<br>
    2. 로컬스토리지(localstrorage) : 웹 브라우저에서 데이터를 클라이언트 측에 영구적으로 저장할 수 있게 해주는 저장소
  </div>
  <ul>
    <li>채팅 화면</li>
    <p>1) '로그인한 사용자 / 선택한 프로젝트'에 대한 채팅 리스트 화면 확인 가능.</p>
     <img src="https://github.com/user-attachments/assets/d8c0bc1e-8069-4f82-a0b7-c3a8f4aad9b4" style="width:700px">
    <p>2) 팀원 선택시 기존 채팅방 존재 여부에 따라 생성 및 선택이 이루어지고 생성 시 채팅 리스트에 추가</p>
     <img src="https://github.com/user-attachments/assets/414238ba-bb8e-4632-822f-a92b6e67a010" style="width:700px">
    <li>웹소켓</li>
     <img src="https://github.com/user-attachments/assets/6c812dea-fe82-4857-aa42-1e79ca874474" style="width:700px">
    <li>그 외</li>
    <ol>
      <li>다른 채팅방 간의 대화 내용 구분</li>
      <img src="https://github.com/user-attachments/assets/9d08d01c-8d79-4eab-913b-a5e2986bc068" style="width:700px">
      <li>채팅 뒤로 가기(로컬 스토리지 유지)</li>
      <img src="https://github.com/user-attachments/assets/b2a162a9-fd29-4eb6-a2ec-9ea5a6045f85" style="width:700px">
      <li>채팅 나가기(로컬 스토리지 삭제)</li>
       <img src="https://github.com/user-attachments/assets/07f0aa6c-ceab-4bc1-8332-0cc273e583b7" style="width:700px">
    </ol>
  </ul>
</details>
<details>
  <summary>산출물 관리(To Do List)</summary>
  <p>여기에 토글로 숨길 내용이 들어갑니다. 이 내용은 '섹션 제목'을 클릭하면 표시됩니다.</p>
  <ul>
    <li>목록 항목 1</li>
    <li>목록 항목 2</li>
  </ul>
</details>
<details>
  <summary>예산 관리 & 차트</summary>
  <p>여기에 토글로 숨길 내용이 들어갑니다. 이 내용은 '섹션 제목'을 클릭하면 표시됩니다.</p>
  <ul>
    <li>목록 항목 1</li>
    <li>목록 항목 2</li>
  </ul>
</details>
<br>

<h2>◽ 박민경</h2>
    <details>
      <summary>회원관리-아이디 찾기/비밀번호 찾기</summary>
      <p>여기에 토글로 숨길 내용이 들어갑니다. 이 내용은 '섹션 제목'을 클릭하면 표시됩니다.</p>
      <ul>
        <li>목록 항목 1</li>
        <li>목록 항목 2</li>
      </ul>
    </details>
    <details>
      <summary>간트 차트</summary>
      <p>여기에 토글로 숨길 내용이 들어갑니다. 이 내용은 '섹션 제목'을 클릭하면 표시됩니다.</p>
      <ul>
        <li>목록 항목 1</li>
        <li>목록 항목 2</li>
      </ul>
    </details>
    <details>
      <summary>캘린더</summary>
      <p>여기에 토글로 숨길 내용이 들어갑니다. 이 내용은 '섹션 제목'을 클릭하면 표시됩니다.</p>
      <ul>
        <li>목록 항목 1</li>
        <li>목록 항목 2</li>
      </ul>
    </details>
    <details>
      <summary>사용자 관리</summary>
      <p>전체 사용자 조회, 수정, 삭제</p>
      <ul>
        <li>사용자 검색 및 조회</li>
        <img src="https://github.com/user-attachments/assets/c4f9a4f0-50d5-4cdd-bdb0-c0868e9a7ad7" alt="사용자 리스트" style="width:500px"/>
        <li>사용자 목록 페이징</li>
        <img src="https://github.com/user-attachments/assets/e0369f6f-f76a-4a1e-9538-3224503f8804" alt="사용자 페이징" style="width:500px"/>
        <li>사용자 상세정보</li>
        <img src="https://github.com/user-attachments/assets/d72736f0-53a0-45f3-8c8b-bb1fab6c43d6" alt="사용자 상세" style="width:500px"/>
        <li>사용자 정보 수정</li>
        <img src="https://github.com/user-attachments/assets/94e5e5ad-3c64-49b0-bbb3-0ba6c427c3cb" alt="사용자 정보 수정" style="width:900px"/>
        <li>사용자 삭제(탈퇴)</li>
        <img src="https://github.com/user-attachments/assets/5bbd2910-d067-4f63-9f63-5f6e772999ed" alt="사용자 삭제" style="width:700px"/>
      </ul>
    </details>
    <details>
      <summary>다국어 처리</summary>
      <p>여기에 토글로 숨길 내용이 들어갑니다. 이 내용은 '섹션 제목'을 클릭하면 표시됩니다.</p>
      <ul>
        <li>목록 항목 1</li>
        <li>목록 항목 2</li>
      </ul>
    </details>
    <details>
      <summary>마이페이지</summary>
      <p>여기에 토글로 숨길 내용이 들어갑니다. 이 내용은 '섹션 제목'을 클릭하면 표시됩니다.</p>
      <ul>
        <li>목록 항목 1</li>
        <li>목록 항목 2</li>
      </ul>
    </details>


## ✅ 정리 사항

## 🎥 시연 영상
[시연 영상](https://drive.google.com/file/d/1wTjkPlC-iC6x0MTefSSsiEB60frAyYDn/view?usp=sharing)

## 📁 추가 자료
<a href="https://www.canva.com/design/DAGK8Pmysik/VNLzYHXvjJOISPXzsI6rUw/edit?utm_content=DAGK8Pmysik&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton" target="_blank">PPT 자료</a>
