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
 $('#ModalModify').modal('hide');
 var msg="${msg}"
 if(msg != "") {
     alert(msg); // 알림 메시지 표시

     if (msg=="등록 완료") {
        $(".close").click();
        window.location.href = 'budgetFrm';
     }
 }
 
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
     <%-- 등록 모달 --%>       
              <button class="btn btn-primary" data-toggle="modal" data-target="#ModalCenter" style="margin-left:1rem;"
           type="button">Regist Budget</button>
              <div class="table-responsive">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th ></th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 " >Budget Id</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">Budget Name</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Amount</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">User Id</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2" >parent Id</th>
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
                      <div class="align-middle text-center" style="border:none" >
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
  <%-- modal --%>       
  <div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalLongTitle">Regist Budget</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>     
      <div class="modal-body">
      <form id="modalFrm" class="form"  method="post" action="budgetinsert">
      <input type="text" name="user_id" value="${sessionScope.user_id }"/>
      <input type="text" name="project_id" value="${sessionScope.project_id }"/>
        <div class="row">
         <div class="col">    
         <span>Budget Name</span>              
           <input type="text" class="form-control" name="budget_name">
         </div>
        </div>
         <div class="row">
         <div class="col">    
         <span>Amount</span>              
           <input type="number" class="form-control" name="amount">
         </div>
        </div>
         <div class="row">
         <div class="col">    
         <span>Parent Id</span>              
          <select class="form-control" name="parent_id">
            <option value="">Select Parent Id</option>
            <c:forEach var="parent" items="${BudParent}">
                <option value="${parent.budget_id}">${parent.budget_name}</option>
            </c:forEach>
        </select>
           
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>Extra Comment</span>
            <textarea name="etc" rows="3" cols="10" class="form-control"></textarea>
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>Use Date</span>
           <input type="date" class="form-control" name="usedate">
         </div>
        </div>
        
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" id="regBtn" class="btn btn-primary">regist</button>        
      </div>   
       </form> 
      </div>
      
    </div>
  </div>
</div>  

<%-- 모달 수정 --%> 
<div class="modal fade" id="ModalModify" tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalLongTitle">Modify Budget</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>     
      <div class="modal-body">
      <form id="modaluptFrm" class="form"  method="post" action="uptbudget">
      <input type="text" name="user_id" value="${sessionScope.user_id }" readonly/>
      <input type="text" name="project_id" value="${sessionScope.project_id }" readonly/>
        <div class="row">
         <div class="col">    
         <span>Budget Id</span>              
           <input type="text" class="form-control" name="budget_id" value="${uptlist.budget_id}" readonly >
         </div>
        </div>
        <div class="row">
         <div class="col">    
         <span>Budget Name</span>              
           <input type="text" class="form-control" name="budget_name" value="${uptlist.budget_name}" >
         </div>
        </div>
         <div class="row">
         <div class="col">    
         <span>Amount</span>              
           <input type="number" class="form-control" name="amount" value="${uptlist.amount}">
         </div>
        </div>
         <div class="row">
         <div class="col">    
         <span>Parent Id</span>              
          <select class="form-control" name="parent_id">
            <option value="">Select Parent Id</option>
            <c:forEach var="parent" items="${BudParent}">
                <option value="${parent.budget_id}">${uptlist.budget_name}</option>
            </c:forEach>
        </select>
           
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>Extra Comment</span>
            <textarea name="etc" rows="3" cols="10" class="form-control"></textarea>
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>Use Date</span>
           <input type="date" class="form-control" name="usedate">
         </div>
        </div>
        
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="uptBtn" class="btn btn-primary">Update</button>        
        <button type="button" id="delBtn" class="btn btn-primary">Delete</button>        
      </div>   
       </form> 
      </div>
      
    </div>
  </div>
</div> 
           
          </div>

         
        </div>
        <div class="row align-items-center mb-5">
          
         
        </div>
  

   <script src="${path}/adminkit-3.1.0/static/js/app.js"></script>

<script type="text/javascript">
function BudPage(budget_id) {
// 수정 모달 열기
$('#ModalModify').modal('show');
}
$("#uptBtn").click(function() {
	if (confirm("수정하시겠습니까?")) {
		$("#modaluptFrm").attr("action", "uptbudget");
		$("#modaluptFrm").submit();
	}
})
$("#delBtn").click(function() {
	if (confirm("삭제하시겠습니까?")) { 
		location.href = "delbudget?budget_id="+ $("[name=budget_id]").val()
	}
})
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