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
  <tr><td>박민경</td><td></td>
    <td>비밀번호 찾기(mail) / 아이디 찾기 / 프로젝트 일정 관리(Gantt Chart) / 전체 일정 관리(Calendar) /
      사용자 관리 / 프로젝트 관리 / 마이페이지(file upload) / 다국어 처리 / 고정IP 구축 / DB 환경 구축</td>
  </tr>
  <tr><td>공통 역할</td><td colspan="2">PMS 분석 / 요구사항 정의서 / 워크플로우 / 설계(화면, DB)</td></tr>
</table>


## 🔧 핵심 기술
 <img src="https://github.com/user-attachments/assets/ae2120cb-19df-4b01-9b4b-12e34e2c44f8" alt="핵심기술1" style="width:700px">
 <img src="https://github.com/user-attachments/assets/8bc8ecf9-7f6f-45e3-8de3-91b89f2fe49f" alt="핵심기술2" style="width:700px">

## 📈 프로젝트 계획

## ✏️ 설계
### 서버 구축

### ERD
 <img src="/images/ERD.png" alt="회원가입" style="width:900px">

## 🛠️ 구현
<h2>◽ 김은수</h2>
<details>
  <summary>회원관리-회원가입(SMTP)/로그인</summary>
  <h3>1. 회원가입</h3>
  <img src="/images/회원가입.png" alt="회원가입" style="width:500px"> <br>
  <h4>◾주요 기능</h4>
  <h4>1) SMTP</h4>
  <p>• 회원가입 시 입력한 이메일로 자동 생성된 아이디가 전송</p>
  <img src="https://github.com/user-attachments/assets/d1eca0bd-e090-41cc-881f-bc182dc328e7" alt="이메일" style="width:700px"> <br>
  <h4>2) 유효성 검사</h4>
  <div>
    <p>1. 이메일 유효성 검사</p>
    (1) 형식 검증<br>
     <img src="/images/유효성_유효하지 않은 이메일.png" style="width:400px"> <br>
    (2) 중복 검증<br>
     <img src="/images/유효성_이미 사용중.png" style="width:400px"> <br>
  </div>
  <div>
    <p>2. 비밀번호 유효성 검사</p>
     (1) 길이 검증<br>
     <img src="/images/비번유효성_6자 이상.png" style="width:400px"> <br>
    (2) 형식 검증 및 정규 표현식 검증<br>
     <img src="/images/비번유효성_문자,숫자,특수문자.png" style="width:400px"> <br>
    (3) 입력 일치 검증<br>
     <img src="/images/비번유효성_비번일치.png" style="width:400px"> <br>
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
  <summary>산출물 관리(To Do List) & 파일 업로드</summary>
  <h3>To Do List 화면</h3>
  <p>: PM이 간트차트에서 생성한 업무(TASK) 목록 확인 화면</p>
  <img src="https://github.com/user-attachments/assets/a94ec7a4-ce07-44da-9c9e-a674272a2b30" style="width:700px">
  <img src="https://github.com/user-attachments/assets/f5bf03eb-e701-4082-a7aa-2f6b52ea0c5a" style="width:700px">
  <ul>
    <li>Task 수정</li>
     <p> <권한에 따른 업무 수정 범위> </p>
    <img src="https://github.com/user-attachments/assets/2237db9f-9772-44ab-b61a-fc67cf202cd9" style="width:700px"><br>
    <li><h3><파일업로드></파일업로드></h3></li>
    <img src="https://github.com/user-attachments/assets/9f7868e8-5a6b-43d5-9a16-f81443083fac" style="width:700px">
    <p ><h4>+ 코드</h4></p>
    <img src="https://github.com/user-attachments/assets/0d4d11ab-ce12-47a2-9705-3e7f5fa3d3ec" style="width:500px">
    <img src="https://github.com/user-attachments/assets/4ebab2a3-bd32-493e-b5cf-4df631e96943" style="width:700px">
    </ul>
</details>
<details>
  <summary>예산 관리(계층구조&페이징)</summary>
  <h3><주요 기능></h3>
    <h3>1) 계층구조</h3>
    <p>: 예산 등록 시 최상위 or 상위/하위 요소를 지정하며, 상위 요소에 따라 하위 요소가 들여쓰기로 구분</p>
    (1) 요소 지정 <br>
    <img src="https://github.com/user-attachments/assets/660d9db7-73eb-434a-9017-99086082738d" style="width:700px"><br><br>
    (2) 들여쓰기 확인 <br>
    <img src="https://github.com/user-attachments/assets/adf1e042-0c75-4c30-873d-282e8a555e04" style="width:700px"><br><br>
    <h3>2) 페이징</h3>
    <p>: 데이터를 7개씩 분할하여 한 화면에 표시하고, 사용자가 쉽게 탐색할 수 있도록 이전/다음 버튼을 제공</p>
    <img src="https://github.com/user-attachments/assets/59ce7acd-8dc0-44e8-a8f7-44f451ccdf4f" style="width:700px"><br><br>
</details>
<details>
  <summary>차트</summary>
  <p>: 예산 상위요소 카테고리를 차트에 적용</p>
  <img src="https://github.com/user-attachments/assets/ab8f5c43-d523-40ec-85e9-2e64ef54fa10" style="width:700px">
  <img src="https://github.com/user-attachments/assets/29adb42b-2416-4d37-8a42-053c2bc38e93" style="width:700px"> 
</details>
<br>
<h2>◽ 박민경</h2>
    <details>
      <summary>회원관리-비밀번호 찾기/아이디 찾기</summary>      
      <h3>1. 비밀번호 찾기</h3>
      <img src="https://github.com/user-attachments/assets/d8b8fff8-457f-4a5f-b0fd-e30039b6478b" alt="비밀번호 찾기 초기화면" style="width:500px">
      <ul>
        <li>필수 입력 검증</li>
        <img src="https://github.com/user-attachments/assets/650417ed-50b0-4408-a517-599202157d0e" alt="필수 입력 검증" style="width:500px">
        <li>이메일 형식 검증</li>
        <img src="https://github.com/user-attachments/assets/ae73ae5c-c8f6-464b-bba0-8e26bd6623ac" alt="이메일 형식 검증" style="width:500px">
        <li>데이터 유효성 검증</li>
        <img src="https://github.com/user-attachments/assets/e4830037-ea5e-4a3a-a7e6-655943819105" alt="데이터 유효성 검증" style="width:500px">
        <h4>임시 비밀번호 메일 발송</h4>
        <p>유효한 사용자 정보 입력하였을 경우 임시 비밀번호 생성 및 SMTP를 이용한 임시 비밀번호 메일 발송</p>
        <img src="https://github.com/user-attachments/assets/541a633a-b34f-4d86-8444-9121fe9ad7fb" alt="임시 비밀번호 확인" style="width:900px">
      </ul>
      <h3>2. 아이디 찾기</h3>
      <img src="https://github.com/user-attachments/assets/542563bd-8881-4e28-9cf3-1acf5c877ab1" alt="아이디 찾기 초기화면" style="width:500px">
      <ul>
        <li>필수 입력 검증</li>
        <img src="https://github.com/user-attachments/assets/2d2576e2-fe27-4206-a49e-4c02e87faf23" alt="필수 입력 검증" style="width:500px">
        <li>이메일 형식 검증</li>
        <img src="https://github.com/user-attachments/assets/aaedf903-75c1-4ed0-9c09-aa111a1398eb" alt="이메일 형식 검증" style="width:500px">
        <li>데이터 유효성 검증</li>
        <img src="https://github.com/user-attachments/assets/3a2e6f57-531f-4f7c-844e-a545188fecba" alt="데이터 유효성 검증" style="width:500px">
        <h4>아이디 찾기 결과</h4>
        <p>유효한 사용자 정보를 입력하였을 경우 ID 확인</p>
        <img src="https://github.com/user-attachments/assets/b6453a0d-8b50-43c2-b34e-904e84ea49a6" alt="아이디 확인" style="width:500px">
      </ul>
    </details>
    <details>
      <summary>업무 관리-간트 차트</summary>
      <p>해당 프로젝트의 전체 업무를 관리합니다.</p>
      <img src="https://github.com/user-attachments/assets/04c67b82-6104-4bdd-9eb2-186a5d36137f" alt="간트 차트" style="width:900px">
      <img src="https://github.com/user-attachments/assets/e0928897-4556-48b5-afe3-cff683fac100" alt="간트 조회 코드" style="width:500px">
      <br><br>
      <ul>
        <li>업무 생성(PM권한)</li>
        <img src="https://github.com/user-attachments/assets/ff750939-6fb2-4ba6-9262-28c6a58350f9" alt="업무 생성 버튼" style="width:500px">
        <p>➕버튼 클릭 시 생성 팝업창이 열립니다. 업무 정보를 입력/선택 후 저장 버튼 클릭 시 생성됩니다.</p>
        <p>(업무할당자 selectbox에는 해당 프로젝트의 팀원목록이 출력됩니다.)</p>
        <img src="https://github.com/user-attachments/assets/97d13416-446c-44d2-b4bc-9b1422350a4a" alt="생성 팝업" style="width:400px">
        <li>업무 수정(PM권한)</li> 
        <p>직접 입력하여 업무를 수정합니다.</p>
        <img src="https://github.com/user-attachments/assets/d499e3bb-f91a-4d83-9a83-058ee0f536a7" alt="간트 입력 수정" style="width:600px">
        <br><br>
        <p>드래그 앤 드랍/리사이즈하여 업무 기간을 수정합니다.</p>
        <img src="https://github.com/user-attachments/assets/07f69606-c393-4539-bd75-90c3007322b7" alt="간트 기간 수정" style="width:500px">
        <li>업무 삭제(PM권한)</li>
        <p>삭제 버튼 클릭 시 업무가 삭제됩니다.</p>
        <img src="https://github.com/user-attachments/assets/cd44f524-2312-40bf-98c9-aed06a787d2c" alt="간트 업무 삭제" style="width:600px">
      </ul>
    </details>
    <details>
      <summary>일정 관리-풀캘린더</summary>
      <p>개인/팀/프로젝트 일정을 관리합니다.</p>
      <img src="https://github.com/user-attachments/assets/deebe551-b1a8-4dfb-8dfd-16fa4cd37739" alt="풀캘린더 초기화면" style="width:900px">
      <br><br>
      <p>선택한 보기방식(상단 체크박스)에 따라 일정 확인이 가능합니다.</p>
      <img src="https://github.com/user-attachments/assets/630f768f-6550-40ef-84c3-da3540f9191a" alt="풀캘린더 보기방식 체크" style="width:900px">
      <ul>
        <li>일정 등록(개인/팀 일정)</li>
        <p>개인 일정 : 본인 - 확인/수정/삭제</p>
        <p>팀 일정 : 팀원 - 확인, 작성자 - 수정/삭제</p>
        <p>작성자, 팀 아이디(팀 일정 선택 시)는 세션값으로 자동입력됩니다.</p>
        <img src="https://github.com/user-attachments/assets/1ca06b55-5ad0-4218-9990-8c3af2d2bf45" alt="팀 일정 등록" style="width:900px">
        <li>일정 상세</li>
        <p>일정바 클릭 시 팝업창에 표시됩니다.</p>
        <img src="https://github.com/user-attachments/assets/2938aeae-47fb-4386-93b2-af05f35703ba" alt="일정 상세" style="width:400px">
        <li>일정 수정</li>
        <p>수정/삭제 가능한 일정의 경우 아래 버튼이 활성화됩니다.</p>
        <img src="https://github.com/user-attachments/assets/6060e066-137e-4770-9998-09f9ba457842" alt="수정/삭제 버튼" style="width:600px">
        <br><br>
        <p>직접 입력, 드래그 앤 드랍, 리사이즈하여 일정을 수정합니다.</p>
        <img src="https://github.com/user-attachments/assets/58dc5847-134a-4a60-a474-6387e7427f41" alt="일정 수정" style="width:900px">
        <li>일정 삭제</li>
        <p>삭제 버튼 클릭 시 일정이 삭제됩니다.</p>
        <img src="https://github.com/user-attachments/assets/b8508369-80b6-40e9-b502-6ca1c97c7233" alt="일정 삭제제" style="width:600px">
      </ul>
    </details>
    <details>
      <summary>사용자 관리</summary>
      <p>전체 사용자를 관리합니다(PM권한한)</p>
      <ul>
        <li>사용자 검색 및 조회</li>
        <p>전체 사용자 리스트를 출력합니다.</p>
        <img src="https://github.com/user-attachments/assets/a427efb7-e4f1-4b91-bbf6-9e5c102a633e" alt="사용자 리스트" style="width:1000px"/>
        <p>검색어 입력 시, 검색어가 포함된 사용자가 출력됩니다.</p>
        <img src="https://github.com/user-attachments/assets/bd02d0ca-49a4-492a-944d-d64dc41520b7" alt="사용자 검색" style="width:500px"/>
        <li>사용자 목록 페이징</li>
        <p>페이지 버튼 클릭 시 해당 페이지의 사용자 리스트가 출력됩니다.</p>
        <img src="https://github.com/user-attachments/assets/e0369f6f-f76a-4a1e-9538-3224503f8804" alt="사용자 페이징" style="width:500px"/>
        <li>사용자 상세정보</li>
        <p>사용자 클릭 시, 사용자 정보가 팝업창에 표시됩니다.</p>
        <img src="https://github.com/user-attachments/assets/d72736f0-53a0-45f3-8c8b-bb1fab6c43d6" alt="사용자 상세" style="width:500px"/>
        <li>사용자 정보 수정</li>
        <p>수정할 정보 입력/선택 후 수정버튼 클릭 시 수정됩니다.(활성화된 필드만 수정 가능)</p>
        <img src="https://github.com/user-attachments/assets/94e5e5ad-3c64-49b0-bbb3-0ba6c427c3cb" alt="사용자 정보 수정" style="width:900px"/>
        <li>사용자 삭제(탈퇴)</li>
        <p>삭제버튼 클릭 시 해당 사용자가 삭제(탈퇴)처리됩니다.</p>
        <img src="https://github.com/user-attachments/assets/5bbd2910-d067-4f63-9f63-5f6e772999ed" alt="사용자 삭제" style="width:700px"/>
      </ul>
    </details>
    <details>
      <summary>마이페이지</summary>
      <p>프로필 정보를 관리합니다.</p>
      <img src="https://github.com/user-attachments/assets/67a09578-5188-4599-91af-8941391f2c33" alt="프로필" style="width:900px"/>
      <ul>
        <li>프로필 수정(이미지 업로드, 정보 수정)</li>
        <p>업로드할 이미지 파일을 선택하고, 수정할 정보 입력 후 변경버튼 클릭 시 프로필 정보를 변경합니다.(활성화된 필드만 수정 가능)</p>
        <img src="https://github.com/user-attachments/assets/e50e5229-8aaf-4458-95c4-8cd3a6313b28" alt="프로필" style="width:900px"/>
        <li>프로젝트 목록</li>
        <p>진행중인 프로젝트, 완료된 프로젝트를 확인하고, 클릭 시 대시보드로 이동합니다.</p>
        <img src="https://github.com/user-attachments/assets/c2c63464-9f82-4411-9370-7d04f8866a4e" alt="프로필 프로젝트 목록" style="width:600px"/>
      </ul>
    </details>
    <details>
      <summary>다국어 처리</summary>
      <p>영어, 한국어, 페르시안어로 언어 변경이 가능합니다.</p>
      <p>기본 언어-영어</p>
      <img src="https://github.com/user-attachments/assets/d5fd980d-cb02-448d-824d-ccf32b9ab930" alt="프로필 프로젝트 목록" style="width:600px"/>
    </details>


## ✅ 정리 사항
#### 1. 일정 관리
• 일일 점검과 주 점검을 통해 체계적인 일정 관리 <br>
<img src="https://github.com/user-attachments/assets/8d730dc3-e9a9-4834-b4c3-d5df4f6b9bed" alt="일정 관리" style="width:700px"/><br>
#### 2. 회의록
• 회의록 작성을 통한 프로젝트 관리 <br>
<img src="https://github.com/user-attachments/assets/358fa139-2cda-425b-a8f1-f75fb713e2bc" alt="회의록" style="width:350px"/> <br>
#### 3. 단위 테스트 & 통합 테스트 
• 팀원 간 단위테스트 진행을 통해 유효성 및 오류 확인 <br>
<img src="https://github.com/user-attachments/assets/ab05a850-d07b-47d2-9eb9-76ff3b468d51" alt="단위 테스트" style="width:700px"/> <br><br>
• 다른 팀과 통합테스트 진행을 통한 시스템 통합성과 유지 보수 <br>
<img src="https://github.com/user-attachments/assets/56fa6fdf-bbba-4ee7-8fe0-ee358478cf97" alt="통합 테스트" style="width:700px"/> <br>

[[정리 사항 전체 내용]](https://www.canva.com/design/DAGRRRqjKwE/UpCV2BROEsLqjPyxiFWNIw/edit?utm_content=DAGRRRqjKwE&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)
<br>
## 🎥 시연 영상
[[시연 영상]](https://drive.google.com/file/d/1wTjkPlC-iC6x0MTefSSsiEB60frAyYDn/view?usp=sharing)

## 📁 추가 자료
[[발표 PPT]](https://www.canva.com/design/DAGK8Pmysik/VNLzYHXvjJOISPXzsI6rUw/edit?utm_content=DAGK8Pmysik&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)
