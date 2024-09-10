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
<table>
  <tr><th>팀원명</th><th>프로필</th><th>역할</th></tr>
  <tr>
    <td>김은수</td><td></td>
    <td><strong>조장</strong> 사용자 로그인 / 회원가입(mail) / 채팅 / 예산 관리 / 차트 / 메인 화면(간략/상세) / To Do List / GitHub 환경 구축 / PPT 제작</td>
  </tr>
  <tr><td>박민경</td><td></td><td></td></tr>
  <tr><td>공통 역할</td><td colspan="2">PMS 분석 / 요구사항 정의서 / 워크플로우 / 설계(화면, DB)</td></tr>
</table>


## 🔧 핵심 기술

1. 김은수
    <details>
      <summary>회원관리-회원가입/로그인</summary>
        <ul>
        <li>회원가입</li>
        ![회원가입](https://github.com/user-attachments/assets/80a6bf6f-b376-41c6-a09f-bb52f45ad720)


        <strong>주요 기능</strong>
         <ol>
          <li>SMTP</li>
        ![이메일](https://github.com/user-attachments/assets/182043f9-ffe4-4dbb-b5aa-81c65b9cc408)
          <li>유효성 검사</li>
          </ol>
        
        <li>로그인</li>
       ![로그인](https://github.com/user-attachments/assets/8d6e7946-b4b8-4a03-a4f9-1c8ec91446c5)

   
        
      </ul>
    </details>
    <details>
      <summary>채팅</summary>
      <p>여기에 토글로 숨길 내용이 들어갑니다. 이 내용은 '섹션 제목'을 클릭하면 표시됩니다.</p>
      <ul>
        <li>웹소켓</li>
        <li>목록 항목 2</li>
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

2. 박민경
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




## 📈 프로젝트 계획

## ✏️ 설계
### 서버 구축

### ERD

## 🛠️ 구현

## ✅ 정리 사항

## 🎥 시연 영상
[시연 영상](https://drive.google.com/file/d/1wTjkPlC-iC6x0MTefSSsiEB60frAyYDn/view?usp=sharing)

## 📁 추가 자료
<a href="https://www.canva.com/design/DAGK8Pmysik/VNLzYHXvjJOISPXzsI6rUw/edit?utm_content=DAGK8Pmysik&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton" target="_blank">PPT 자료</a>
