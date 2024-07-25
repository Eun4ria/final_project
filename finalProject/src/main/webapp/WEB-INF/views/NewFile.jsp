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
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

</head>

<body>
<div class="jumbotron text-center">
  <h2>타이틀</h2>

</div>
<script type="text/javascript">
$(document).ready(function() {
    $("#idBtn").click(function() { 
        idFind();
    });
});

function idFind() {
    $.ajax({
        url: "find_id",
        type:"GET",
        data: $("#frm01").serialize(),
        success: function(id) {
            console.log(id);  
            alert(id);       
        },
        error: function(err) {
            console.log(err);
        }
    });
}
	
</script>
<div class="container">
	<form id="frm01" class="form"  method="get">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="아이디" name="user_name"  class="form-control mr-sm-2" />
	    <input placeholder="이메일" name="email" class="form-control mr-sm-2"/>
	    <button class="btn btn-info"  id="idBtn" type="button">Search</button>
 	</nav>
	</form>
    
</div>

</body>
</html>