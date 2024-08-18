<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>

   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
   <meta name="author" content="AdminKit">
   <meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<%-- material link --%>
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <link rel="apple-touch-icon" sizes="85x85" href="${path}/material-dashboard-2/assets/img/HPM-icon.png">
     <link rel="icon" sizes="85x85" type="image/png" href="${path}/material-dashboard-2/assets/img/HPM-icon.png">
    <!--     Fonts and icons     
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  -->
  <!-- Nucleo Icons -->
  <link href="${path}/material-dashboard-2/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${path}/material-dashboard-2/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons   -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>

  <!-- Material Icons 
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
 -->
  <!-- CSS Files -->
  
  <link id="pagestyle" href="${path}/material-dashboard-2/assets/css/material-dashboard.css?v=3.0.0" rel="stylesheet" />
   
<%--다시 adminkit --%>

   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link rel="shortcut icon" href="${path}/adminkit-3.1.0/img/icons/icon-48x48.png" />

   <link rel="canonical" href="https://demo-basic.adminkit.io/" />

   <title>HPM-Project Manager System</title>

   <link href="${path}/adminkit-3.1.0/static/css/app.css" rel="stylesheet">
<%--    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
--%>


 <script>
 
function goChat(project_id){
	location.href="chatmemListstart?project_id="+project_id
}
</script>
</head>

<body>

   <div class="wrapper">
<jsp:include page="a00_sideBar.jsp"/>   
   
      <div class="main">
      <jsp:include page="a00_top.jsp"/>   
  <%--       <iframe src="a00_top.jsp">
         
         </iframe>
 본문내용 - not toggle --%>
         <main class="content" id="toggleclose">
            <div class="container-fluid p-0">

               <h1 class="h3 mb-3"><strong>Budget</strong> Management</h1>
     
            <div class="row mb-4">
        <div class="col-lg-12 col-md-6 mb-md-0 mb-4">
          <div class="card">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-lg-6 col-7">
                  <h6>Projects ${project_id}</h6>
                  <p class="text-sm mb-0">
                    <i class="fa fa-check text-info" aria-hidden="true"></i>
                    프로젝트 이름이나 기간 넣기?
                  </p>
                </div>
                
       
    
              </div>
            </div>
            
           <%-- 찐본문 --%>
            <div class="card-body px-0 pb-2" id="mainDiv" >
            <button type="button" id="insertdata">내역 추가하기</button>
              <div class="table-responsive">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th ></th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 " >Budget Id</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">Budget Name</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Amount</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">User Id</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2" hidden>parent Id</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2" hidden>Regist Date</th>
                    </tr>
                  </thead>
                    <c:forEach var="bud" items="${BudList}">
                    <tr ondblclick="BudPage('${bud.budget_id}')">
                      <td >
                      <div class="align-middle text-center" style="border:none">                      
                            <h6 class="ml-5 text-center">${bud.cnt }</h6>
                        </div>                   
                      </td>
                      <td style="text-align: left" >
                      <c:forEach begin="3" end="${bud.level}">  &nbsp;&nbsp; ->
						 </c:forEach> 
                      <div class="align-middle text-center" style="border:none">                      
                            <h6 class="ml-5 text-center">${bud.budget_id }</h6>
                        </div>                   
                      </td>
                      
                      <td >
                       
                      <div class="align-middle text-center" style="border:none">
                            <h6 class="ml-5 text-center">${bud.budget_name }</h6>
                          </div>                      
                      </td>
                      <td >
                      <div class="align-middle text-center" style="border:none">
                            <h6 class="ml-5 text-center">${bud.amount }</h6>
                          </div>                      
                      </td>
                      <td >
                      <div class="align-middle text-center" style="border:none">
                            <h6 class="ml-5 text-center">${bud.user_id }</h6>
                          </div>                      
                      </td>
                      <td >
                      <div class="align-middle text-center" style="border:none" hidden>
                            <h6 class="ml-5 text-center">${bud.parent_id }</h6>
                          </div>                      
                      </td>
                       <td >
                      <div class="align-middle text-center" style="border:none" hidden>
                            <h6 class="ml-5 text-center">${bud.regdate }</h6>
                          </div>                      
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        
                     
               </div>

               <div class="row">
               
                  
                  
                  
                  
                  <div class="col-sm-11 col-lg-6 col-md-6 col-xl-6" >
                        
                    </div>
               </div>
               

            </div>
         </main>
            
           
          </div>

         
        </div>
        <div class="row align-items-center mb-5">
          
         
        </div>
  

   <script src="${path}/adminkit-3.1.0/static/js/app.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        $("#toggleopen").hide();

        window.taskPage = function(task_id) { // 프로젝트 리스트에서 해당 프로젝트의 행을 클릭했을 때 실행되는 함수
            alert("토글 가즈아" + task_id );

            // 토글 열기/닫기
            $("#toggleopen").toggleClass("show");

        }

        $("#closeBtn").click(function(){
            $("#toggleopen").removeClass("show");
        });
        
        $("#insertdata").click(function(){
            alert("등록하기")
        });
    });
</script>
  
<script>
var vm = Vue.createApp({
	name:"App",
	data(){
		return {sta:{tstatus:"N"},
				pri:{priority:'N'}	
		}
				
		};
	};
});
</script>

   
 <!-- SCRIPTS -->
    <script src="${path}/jobboard-master/js/jquery.min.js"></script>
    <script src="${path}/jobboard-master/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/jobboard-master/js/isotope.pkgd.min.js"></script>
    <script src="${path}/jobboard-master/js/stickyfill.min.js"></script>
    <script src="${path}/jobboard-master/js/jquery.fancybox.min.js"></script>
    <script src="${path}/jobboard-master/js/jquery.easing.1.3.js"></script>
    
    <script src="${path}/jobboard-master/js/jquery.waypoints.min.js"></script>
    <script src="${path}/jobboard-master/js/jquery.animateNumber.min.js"></script>
    <script src="${path}/jobboard-master/js/owl.carousel.min.js"></script>
    <script src="${path}/jobboard-master/js/quill.min.js"></script>
    
    
    <script src="${path}/jobboard-master/js/bootstrap-select.min.js"></script>
    
    <script src="${path}/jobboard-master/js/custom.js"></script>
   
</body>

</html>