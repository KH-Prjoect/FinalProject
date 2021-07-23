<%@page import="com.kh.bnpp.model.dao.MemberDaoImpl"%>
<%@page import="com.kh.bnpp.model.dao.MemberDao"%>
<%@page import="com.kh.bnpp.model.biz.MemberBizImpl"%>
<%@page import="com.kh.bnpp.model.biz.MemberBiz"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.kh.bnpp.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>
<body>

	<a href="paytest.do">paytest</a>
	<a href="mypaylist.do?member_id=asd123">mypaytest</a>
	<a href="lecturelist.do">lecture</a>
	<a href="myfoodlist.do?member_id=asd123">냉장고test</a>
	<a href="memberlist.do">member</a>
	<a href="mypage.do?member_id=asd123">mypage-학생</a>
	<a href="mypage.do?member_id=12">mypage-강사</a>
	
	<a href="home.do">home</a>
	<a href="main.do">main</a>
	<a href="boardList.do">recipeboard</a>
	<a href="recipe.do">randomrecipe</a>
	<br>
	<br>
	<br>
	<br>

	<c:choose>
		<c:when test="${sessionScope.loginCheck eq true}">
			 <c:if test="${not empty dbDto.member_id}">
				${dbDto.member_id }님 로그인완료
			 	<a href="logout.do">로그아웃</a>
			 </c:if>
			 <c:if test="${userId ne null}">
			 	<c:out value="${userId}"/>님 로그인 완료!
			 	<a href="kakaologout.do">로그아웃</a>
			 </c:if>
			 <c:if test="${session != null }">
			 	<c:out value="${sessionId }"/>님 로그인 완료!
			 	<a href="naverlogout.do">로그아웃</a>
			 </c:if>
		</c:when>
		<c:otherwise>
			<a href="signupform.do">회원가입</a>
			<a href="loginform.do">로그인</a>
		</c:otherwise>
	</c:choose>

	<a href="home.do">home</a>  <br>
	<a href="chatlogin.do">Chatlogin</a> <br>
	<a href="machine.do">machine</a>

</body>
</html>