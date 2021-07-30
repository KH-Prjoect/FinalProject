<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!-- false :  현 페이지의 데이터는 세션에 담지 않겠다  -->
<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: #f8f8f8;
	padding: 60px 0;
}

#login-form>div {
	margin: 15px 0;
}
</style>
<title>Home</title>
</head>



<div class="container">
	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-success">
			<div class="panel-heading">
				
				<c:choose>
					<c:when test="${dbDto.member_id eq 'admin' }">
						<p>지금부터 고객과의 실시간 채팅을 시작합니다.</p>
					</c:when>
					<c:otherwise>
							<p>안녕하세요 ! ${dbDto.member_id } 님 !  지금부터 상담사와 채팅을 시작합니다!</p>
					</c:otherwise>
			</c:choose>
			</div>
			
			
			
			<div class="panel-body">
				<form id="login-form" method="post" action="./loginProcess.do">
					<input type="hidden" name="id" value="${dbDto.member_id }">
					<div>
						<!-- <input type="text"  name="id"	class="form-control" > -->
						<%-- <input type="text"  value="${dbDto.member_id }"> --%>
					</div>
					<div>
						<button type="submit" class="form-control btn btn-primary">실시간상담시작</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</html>
