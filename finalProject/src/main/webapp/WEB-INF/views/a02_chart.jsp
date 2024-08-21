<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link rel="preconnect" href="https://fonts.gstatic.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
   <meta name="author" content="AdminKit">
   <meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link rel="icon" sizes="85x85" type="image/png" href="${path}/material-dashboard-2/assets/img/HPM-icon.png">

   <link rel="canonical" href="https://demo-basic.adminkit.io/pages-profile.html" />

   <title>HPM-Project Manager System</title>

   <link href="${path}/adminkit-3.1.0/static/css/app.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
   <script src="${path}/a00_com/jquery.min.js"></script>
   <script src="${path}/a00_com/popper.min.js"></script>
   <script src="${path}/a00_com/bootstrap.min.js"></script>
   <script src="${path}/a00_com/jquery-ui.js"></script>
   <script src="${path}/a00_com/dist/index.global.js"></script>

</head>
   
<body>

   <div class="wrapper">
   <jsp:include page="a00_sideBar.jsp"/> 
 <c:if test="${sessionScope.project_id == null || sessionScope.project_id == ''}">
    <script>
        alert("프로젝트를 선택하세요.");
        location.href = 'main';
    </script>
</c:if>

      <div class="main">         
        <jsp:include page="a00_top.jsp"/>

         <main class="content">
            <div class="container-fluid p-0">

               <div class="mb-3">
                  <h1 class="h3 d-inline align-middle"><strong>Chart</strong></h1>
                  <a class="badge bg-dark text-white ms-2"> ${sessionScope.project_id  } </a>
               </div>
               <div class="row">
                  
                  
<%-- pie 차트 --%>
                  <div class="col-12 col-lg-6">
                     <div class="card">
                        <div class="card-header">
                           <h5 class="card-title">Main Category</h5>
                           <h6 class="card-subtitle text-muted">Major Category Budget Allocation Status</h6>
                        </div>
                        <div class="card-body" ><span>[ Unit : 1 million(M) ]</span>
                           <div class="chart ">
                              <canvas id="chartjs-pie"></canvas>
                           </div>
                        </div>
                     </div>
                  </div>
                  
                
<%-- bar chart --%>
                  <div class="col-12 col-lg-6">
                     <div class="card">
                        <div class="card-header">
                           <h5 class="card-title">Subcategory</h5>
                           <h6 class="card-subtitle text-muted">Budget Utilization Status by Major Category"</h6>
                        </div>
                        <div class="card-body">
                         <span>[ Unit : 1 million(M) ]</span>
                           <div class="chart "">
                              <canvas id="chartjs-bar"></canvas>
                           </div>
                        </div>
                     </div>
                  </div>
                  
 
                  
               </div>

            </div>
         </main>

         
      </div>
   </div>

   <script src="${path}/adminkit-3.1.0/static/js/app.js"></script>

   
   <script>
      document.addEventListener("DOMContentLoaded", function() {

    	  //부모요소
    	  var labels = JSON.parse('${budgetNames}');
          var data = JSON.parse('${amounts}');
          
         // Bar chart
         new Chart(document.getElementById("chartjs-bar"), {
            type: "bar",
            data: {
               labels: labels,
               datasets: [{
                  label: "Main Category",
                  backgroundColor: window.theme.primary,
                  borderColor: window.theme.primary,
                  hoverBackgroundColor: window.theme.primary,
                  hoverBorderColor: window.theme.primary,
                  data: data,
                  barPercentage: .9, //바 너비
                  categoryPercentage: .7 //카테고리 너비
               }, {
                  label: "subcategory",
                  backgroundColor: "#dee2e6",
                  borderColor: "#dee2e6",
                  hoverBackgroundColor: "#dee2e6",
                  hoverBorderColor: "#dee2e6",
                  data: [90, 75, 100, 50, 120],
                  barPercentage: .75,
                  categoryPercentage: .7
               }]
            },
            options: {
                maintainAspectRatio: false,
                plugins: {
                   legend: {
                      display: false
                   }
                },
                scales: {
                   y: {
                      ticks: {
                         callback: function(value) {
                            // 값 변환 없이 'M'만 추가
                            return value + 'M';
                         }
                      },
                      grid: {
                         display: false
                      },
                      stacked: false
                   },
                   x: {
                      stacked: false,
                      grid: {
                         color: "transparent"
                      }
                   }
                }
             }
          });
       });
    </script>

   <script>
      document.addEventListener("DOMContentLoaded", function() {

    	  var labels = JSON.parse('${budgetNames}');
          var data = JSON.parse('${amounts}');

          
          console.log("labels =>"+labels)
          console.log("data => "+data)
          
       // 미리 지정된 색상 배열
          var predefinedColors = [
              window.theme.primary,
              "#003366",
              "skyblue",
              "lightpink",
              "lightgrey",
              "purple",
              "coral"
              
          ];

          // labels 배열 길이만큼 색상을 반복하여 할당
          var backgroundColors = [];
          for (var i = 0; i < labels.length; i++) {
              backgroundColors.push(predefinedColors[i % predefinedColors.length]);
          }
    	  
         // Pie chart
         new Chart(document.getElementById("chartjs-pie"), {
            type: "pie",
            data: {
               labels: labels,
               datasets: [{
                  data: data,
                  backgroundColor: backgroundColors,
                  borderColor: "transparent"
               }]
            },
            options: {
               maintainAspectRatio: false,
               legend: {
                  display: true
               }
            }
         });
      });
   </script>
 
 
   

</body>

</html>