<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!-- false :  현 페이지의 데이터는 세션에 담지 않겠다  -->
<html>
<head>
<title>실시간 상담 채팅방</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript">
 $(function(){

function goChat(){
    window.open('','chat',  "width=400,height=300,top=100,left=100", );
    
});

/* 
$(document).ready(function(){
	  $("#buttonclick").on("click", function(){
	    window.open("", "popup_window", "width=500, height=300, scrollbars=no");
	    $("#login-form").submit();
	  });
	});
 */
</script>

<style>
body {
	background: #f8f8f8;
	padding: 60px 0;
}

#login-form>div {
	margin: 15px 0;
}

#mainbody{
	padding-top:70px;
	padding-bottom:100px;
}
</style>



</head>




<body>
	<jsp:include page="header.jsp" />
	
	
	<div class="main-banner wow fadeIn">
<div id="mainbody">
<div class="container">
	<div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-2 col-md-1  ms-5">
		<div class="panel panel-success">
			<div class="panel-heading">
				
				<c:choose>
				<c:when  test="${empty dbDto.member_id }">
				로그인을 먼저 해주세요 
				 <br><br>
				 
				 <button class="btn btn-info" onclick="location.href='./main.do'" > 메인 화면으로 되돌아가기 </button>
				</c:when>
					<c:when test="${dbDto.member_id eq 'admin' }">
						<p>지금부터 고객과의 실시간 채팅을 시작합니다.</p>
						<div class="panel-body" style="padding-left: 30%">
				<form id="login-form" method="post" action="./loginProcess.do" target="chat">
					<input type="hidden" name="id" value="${dbDto.member_id }">
					<div>
					<%-- 	  <input type="text"  name="id"	class="form-control" > --%>
						<%-- <input type="text"  value="${dbDto.member_id }"> --%>
					</div>
					<div>
						<button type="submit" class="form-control btn btn-primary" onclick="goChat();">실시간상담시작</button>
					</div>
				</form>
			</div>
					</c:when>
					<c:otherwise>
							<p>안녕하세요.   <span class="fs-3">${dbDto.member_id } </span>님! 
							  <br>지금부터 상담사와 채팅을 시작합니다!</p>
							  <div class="panel-body" style="padding-left: 30%">
				<form id="login-form" method="post" action="./loginProcess.do" target="chat">
					<input type="hidden" name="id" value="${dbDto.member_id }">
					<div>
					<%-- 	  <input type="text"  name="id"	class="form-control" > --%>
						<%-- <input type="text"  value="${dbDto.member_id }"> --%>
					</div>
					<div>
						<button type="submit" class="form-control btn btn-primary" id="buttonclick"  onclick="goChat();">실시간상담시작</button>
					</div>
				</form>
			</div>
					</c:otherwise>
			</c:choose>		
			</div>
			
			
			
		</div>
	</div>
</div>
</div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
