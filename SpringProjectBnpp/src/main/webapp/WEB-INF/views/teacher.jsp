<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<body>
	<jsp:include page="header.jsp" />
	<div class="main-banner wow fadeIn">
			<div class="row" style="padding-left: 15%">
				<h3>강사</h3>
				<c:forEach items="list" var="dto">
					<div class="col-lg-3 col-sm-4 col-11 offset-sm-0 offset-1">
						<div class="card">
							<img class="card-img-top"
								src="resources/assets/images/portfolio-image4.png" alt="image">
							<div class="card-body">
								<p class="card-text" style="height: 40px;">
									<a href="">강사이름</a>
								</p>
								<p>소개</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>




	<jsp:include page="footer.jsp" />
</body>
</html>