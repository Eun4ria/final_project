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
  <script src="https://unpkg.com/feather-icons"></script>

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

function ajaxFun(url){
	   $.ajax({
	      type:"post",
	      url:url,
	      data:$("#modaluptFrm").serialize(),
	      success:function(msg){
	    	  alert(msg)
	         
		            location.href = 'budgetFrm';
		         
	      },
	      error:function(err){
	         console.log(err)
	      }
	   })
	}

 
function goChat(project_id){
	location.href="chatmemListstart?project_id="+project_id
}

function BudPage(budget_id){
	$.ajax({
		type:"post",
		url:"getBudgetID",
		data:{budget_id:budget_id},
		success:function(data){
			var BudgetId = data[0].budget_id;
			console.log(BudgetId+"의 정보"); 
			console.log(data)
			console.log(data[0].budget_id)
            $("[name=budget_id]").val(BudgetId);
            $("[name=user_id]").val(data[0].user_id);
            $("[name=budget_name]").val(data[0].budget_name);
            $("[name=amount]").val(data[0].amount);	        
            $("[name=parent_id]").val(data[0].parent_id);	        
            $("[name=etc]").val(data[0].etc);	        
          //  $("[name=usedate]").val(data[0].usedate);	  
          //  $("[name=uptdate]").val(data[0].uptdate);	  
         //   $("#childparent").text(BudgetId);
        // Convert the date-time to YYYY-MM-DDTHH:mm format
// Convert the date-time to YYYY-MM-DD format
/*function formatDateToYYYYMMDD(dateString) {
    if (!dateString) return '';
    const date = new Date(dateString);
    const year = date.getFullYear();
    const month = ('0' + (date.getMonth() + 1)).slice(-2); // Months are zero-based
    const day = ('0' + date.getDate()).slice(-2);
    return `${year}-${month}-${day}`;
}

// Set values in the input fields
$("[name=usedate]").val(formatDateToYYYYMMDD(data[0].usedate));
$("[name=uptdate]").val(formatDateToYYYYMMDD(data[0].uptdate));

*/
//Convert the date-time to YYYY-MM-DDTHH:mm format
function formatDateTimeToYYYYMMDDTHHMM(dateString) {
    if (!dateString) return '';
    const date = new Date(dateString);
    const year = date.getFullYear();
    const month = ('0' + (date.getMonth() + 1)).slice(-2); // Months are zero-based
    const day = ('0' + date.getDate()).slice(-2);
    const hours = ('0' + date.getHours()).slice(-2);
    const minutes = ('0' + date.getMinutes()).slice(-2);
    return `${year}-${month}-${day}T${hours}:${minutes}`;
}

// Set values in the input fields
$("[name=usedate]").val(formatDateTimeToYYYYMMDDTHHMM(data[0].usedate));



            
            //모달 띄우기
            $('#ModalModify').modal('show');

		},
		error:function(err){
			console.log(err)
		}
	})
}
function FormReset(){
	$("#modalFrm")[0].reset()
	// 팝업창 content 비움
	//$("[name=content]").val("");
}

</script>
</head>

<body>


   <div class="wrapper">
<jsp:include page="a00_sideBar.jsp"/>   
<c:if test="${sessionScope.role_code != 'B'}">
    <script>
        alert("권한이 없습니다.");
        location.href = 'main';
    </script>
</c:if>
<c:if test="${sessionScope.project_id == null || sessionScope.project_id == ''}">
    <script>
        alert("프로젝트를 선택하세요.");
        location.href = 'main';
    </script>
</c:if>

      <div class="main">
      <jsp:include page="a00_top.jsp"/>   
  <%--       <iframe src="a00_top.jsp">
         
         </iframe>
 본문내용 - not toggle --%>
         <main class="content" id="toggleclose">
            <div class="container-fluid p-0">

               <h1 class="h3 mb-3"><strong>Budget</strong> Management</h1>
     
            <div class="row ">
        <div class="col-lg-12 col-md-6 mb-md-0 ">
          <div class="card">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-lg-6 col-7">
                  <h6>Projects ${project_id}</h6>
                  <p class="text-sm mb-0">
                    <i class="fa fa-check text-info" aria-hidden="true"></i>
                     <%-- 프로젝트 이름이나 기간 넣기?--%>
                  </p>
                </div>
                <form id="curPageFrm" class="form" method="post">
			
<%--현재 어느 페이지를 눌렀는지 --%>
			<input type="hidden" name="curPage" value="${sch.curPage }">
			
		</form>
       
    
              </div>
            </div>
            
           <%-- 찐본문 --%>
            <div class="card-body px-0 pb-2" id="mainDiv" >
        
              <button class="btn btn-primary" data-toggle="modal" data-target="#ModalCenter" style="margin-left:1rem;" type="button" onclick="FormReset()">Regist Budget</button>
              <div class="table-responsive">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th ></th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">Budget Name</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Amount</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">User Id</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2" >Regist Date</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2" >Update Date</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2" >Use Date</th>
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
                      <div class="align-middle text-left" style="border:none">   
                     <c:forEach begin="2" end="${bud.level}">
	                    <span>&nbsp;&nbsp;</span> <!-- 들여쓰기 간격 -->
	                </c:forEach>
	                   
	                   <c:if test="${bud.level == 2}">
	                    &nbsp;- <!-- FontAwesome 화살표 -->
	               	 </c:if> 
	                   <c:if test="${bud.level > 2}">
	                    &nbsp;<i data-feather="corner-down-right" style="padding-bottom:0.3rem"></i> <!-- FontAwesome 화살표 -->
	               	 </c:if> 
						                  
                            <span class="ml-5 text-center">${bud.budget_name }</span>
                        </div>                   
                      </td>
                      
                      <td >
                      <div class="align-middle text-center" style="border:none">
                            <h6 class="ml-5 text-center"><fmt:formatNumber value="${bud.amount}" type="number"/></h6>
                          </div>                      
                      </td>
                      <td >
                      <div class="align-middle text-center" style="border:none">
                            <h6 class="ml-5 text-center">${bud.user_id }</h6>
                          </div>                      
                      </td>
                       <td >
                      <div class="align-middle text-center" style="border:none">
                            <h6 class="ml-5 text-center">${bud.regdate }</h6>
                          </div>                      
                      </td>
                      <td >
                      <div class="align-middle text-center" style="border:none">
                            <h6 class="ml-5 text-center">${bud.uptdate }</h6>
                          </div>                      
                      </td>
                      <td >
                      
                      <div class="align-middle text-center" style="border:none">
                            <h6 class="ml-5 text-center">${bud.usedate }</h6>
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
         
         <ul class="pagination justify-content-center mb-5" >
						<li class="page-item" ><a class="page-link" href="javascript:goPageCnt(${sch.startBlock-1})" style="width:5rem;">Previous</a></li>
						<c:forEach var="pCnt" begin="${sch.startBlock }" end="${sch.endBlock }">
						<li class="page-item ${sch.curPage==pCnt?'active':'' }">
							<a class="page-link" href="javascript:goPageCnt(${pCnt})">${pCnt}</a></li>
						</c:forEach>
						<li class="page-item"><a class="page-link" href="javascript:goPageCnt(${sch.endBlock+1})"  style="width:5rem;">Next</a></li>
					</ul>
					<script type="text/javascript">
						function goPageCnt(pCnt){
							$("[name=curPage]").val(pCnt) //클릭한 것을 현재 페이지 번호로 전송
							$("#curPageFrm").submit()
						}
					</script>
         
  <%-- modal 등록--%>       
  <div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalLongTitle">Regist Budget</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
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
           <input type="number" class="form-control" name="amount" required>
         </div>
        </div>
         <div class="row">
         <div class="col">    
         <span>Parent Id</span>              
          <select class="form-control" name="parent_id" id="parent_id">
            <option value="N">Select Parent Id</option>
            <c:forEach var="parent" items="${BudParent}">
                <option value="${parent.budget_id}">${parent.budget_name}</option>
            </c:forEach>
       	 </select>
           
         </div>
        </div>
        
        <div class="row" id="usedate_row" style="display: none;">
         <div class="col">
         <span>Used Date</span>
           <input type="datetime-local" class="form-control" name="usedate" value="">
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>Extra Comment</span>
            <input name="etc" class="form-control">
         </div>
        </div>
        
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
        <button type="button" id="regBtn" class="btn btn-primary">regist</button>        
      </div>   
       </form> 
  
      </div>
      
    </div>
  </div>
</div>  

<%-- 모달 수정 --%> 
<div class="modal fade" id="ModalModify" tabindex="-1" role="dialog" aria-labelledby="ModalModify" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalModiTitle">Modify Budget</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="bodixBtn">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>     
      <div class="modal-body">
      <form id="modaluptFrm" class="form"  method="post" >
      등록자 - <input type="text" name="user_id" value=""  style="width:5rem" readonly/>&nbsp;&nbsp;
      프로젝트 - <input type="text" name="project_id" value="${sessionScope.project_id }"  style="width:5rem" readonly/>&nbsp;&nbsp;
      수정자 - <input type="text" name="uptuser" value="${sessionScope.user_id }"  style="width:5rem" readonly/>
      
        <div class="row" style="padding-top:1rem;">
         <div class="col">    
         <span>Budget Id</span>              
           <input type="text" class="form-control" name="budget_id" value="" readonly >
         </div>
        </div>
        <div class="row">
         <div class="col">    
         <span>Budget Name</span>              
           <input type="text" class="form-control" name="budget_name" value="" >
         </div>
        </div>
         <div class="row">
         <div class="col">    
         <span>Amount</span>              
           <input type="number" class="form-control" name="amount" value="">
         </div>
        </div>
         <div class="row">
         <div class="col">    
         <span>Parent Id</span>              
          <select class="form-control" name="parent_id">
            <c:forEach var="parent" items="${BudParent}">
                <option value="${parent.budget_id}">${parent.budget_name}</option>
            </c:forEach>
        </select>
           
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>Extra Comment</span>
            <input name="etc" class="form-control">
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>Use Date</span>
         <input type="datetime-local" class="form-control" name="usedate" value="">
         </div>
        </div>
        
         
     
        
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="modiclose">Close</button>
        <button type="button" id="uptBtn" class="btn btn-primary">Update</button>        
        <button type="button" id="delBtn" class="btn btn-danger">Delete</button>        
      </div>   
       </form> 
       <script>
       $("#regBtn").click(function() {
    		if (confirm("등록하시겠습니까?")) {
				$("#modalFrm").submit();
    		}
    	})
       $("#uptBtn").click(function() {
    		if (confirm("수정하시겠습니까?")) {
    			ajaxFun("uptbudget")
    		}
    	})
    	$("#delBtn").click(function() {
    		if (confirm("삭제하시겠습니까?")) { 
    			
    			ajaxFun("delbudget")
    		}
    	})
       </script>
      </div>
      
    </div>
   
  </div>
   
</div> 
<div>
     
    </div>
           
          </div>

         
        </div>
        <div class="row align-items-center mb-5">
         
         
        </div>
  

   <script src="${path}/adminkit-3.1.0/static/js/app.js"></script>

<script type="text/javascript">

 $("#modiclose").click(function() {
      $("#ModalModify").modal('hide');
    });

    // 모달 바디 닫기 버튼 클릭 시 모달 닫기
    $("#bodixBtn").click(function() {
      $("#ModalModify").modal('hide');
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
 <script>
    document.addEventListener('DOMContentLoaded', function() {
        var parentSelect = document.getElementById('parent_id');
        var usedateRow = document.getElementById('usedate_row');
        var modal = document.getElementById('ModalCenter'); // 모달의 ID에 맞게 수정

        parentSelect.addEventListener('change', function() {
            var selectedValue = this.value;

            if (selectedValue) { // 값이 있을 때
                usedateRow.style.display = 'block';
            } else { // 값이 null이거나 빈 문자열일 때
                usedateRow.style.display = 'none';
            }
        });

        // 모달이 닫힐 때 선택 상태와 display 리셋
        modal.addEventListener('hidden.bs.modal', function () {
            parentSelect.value = ''; // 선택 상태 초기화
            usedateRow.style.display = 'none'; // Used Date 숨김
        });
    });
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
   
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