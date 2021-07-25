<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">


<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Additional CSS Files -->
<link rel="stylesheet" href="resources/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="resources/assets/css/templatemo-space-dynamic.css">
<link rel="stylesheet" href="resources/assets/css/animated.css">
<link rel="stylesheet" href="resources/assets/css/owl.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky wow slideInDown"
		data-wow-duration="0.75s" data-wow-delay="0s">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="main.do" class="logo">
							<h4>
								Bona<span>ppetit</span>
							</h4>
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
							<li class="scroll-to-section"><a href="boardList.do">레시피
									공유</a></li>
							<li class="scroll-to-section"><a href="<c:url value='/teacherList.do?category=한식' />">강사</a></li>
							<li class="scroll-to-section"><a href="qnalist.do">고객센터</a></li>
							<c:choose>
								<c:when test="${sessionScope.loginCheck eq true}">
									<c:if test="${empty dbDto.member_img_path }">
										<li class="scroll-to-section" ><img alt="profileimg" src="./resources/img/dummy.png" width="40" height="40">
											<a href="javascript:openWindowPop('imgpopup.jsp','imgupload');">사진변경</a>
										</li>
									</c:if>
									<c:if test="${not empty dbDto.member_img_path }">

									</c:if>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${sessionScope.loginCheck eq true}">
									<c:if test="${not empty dbDto.member_id}">
										<li class="scroll-to-section" ><a href="./mypage.do?member_id=${dbDto.member_id }">${dbDto.member_id }님
										</a></li>
										<li class="scroll-to-section"><div
												class="main-blue-button">
												<a href="logout.do">로그아웃</a>
											</div>
									</c:if>
									<c:if test="${userId ne null}">
										<c:out value="${userId}" />님 로그인 완료!
			 	<li class="scroll-to-section"><div class="main-blue-button">
												<a href="kakaologout.do">로그아웃</a>
											</div>
									</c:if>
									<c:if test="${session != null }">
										<c:out value="${sessionId }" />님 로그인 완료!
										<li class="scroll-to-section"><div
												class="main-blue-button">
												<a href="naverlogout.do">로그아웃</a>
											</div>
									</c:if>
								</c:when>
							<c:otherwise>
									<li class="scroll-to-section"><div
											class="main-blue-button">
											<a href="loginform.do">로그인</a>
										</div></li>
									<li class="scroll-to-section"><div class="main-red-button">
											<a href="signupform.do">회원가입</a>
										</div></li>
							</c:otherwise>
							</c:choose>

						</ul>
						<a class='menu-trigger'> <span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ***** Header Area End ***** -->

</body>
</html>