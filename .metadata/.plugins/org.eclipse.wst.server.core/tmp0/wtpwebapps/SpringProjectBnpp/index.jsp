<%@page import="com.kh.bnpp.biz.MemberBizImpl"%>
<%@page import="com.kh.bnpp.biz.MemberBiz"%>
<%@page import="com.kh.bnpp.dto.MemberDto"%>
<%@page import="com.kh.bnpp.clova.Clova_temp_url"%>
<%@page import="com.kh.bnpp.clova.Clova_temp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.bnpp.dto.BillDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
mypaylist.do
	<a href="paytest.do">paytest</a>
	<a href="mypaylist.do?member_id=asd123">mypaytest</a>
	<a href="lecturelist.do">lecture</a>
	<a href="myfoodlist.do?member_id=asd123">냉장고test</a>
	<a href="memberlist.do">member</a>
	<a href="mypage.do?member_id=asd123">mypage-학생</a>
	<a href="mypage.do?member_id=12">mypage-강사</a>

	
	
	<!--  
		String pathSet = request.getSession().getServletContext().getRealPath("/resources/img/receipt1.jpg");

		List<String> list = Clova_temp.OCR(pathSet);
	-->
	
</body>
</html>