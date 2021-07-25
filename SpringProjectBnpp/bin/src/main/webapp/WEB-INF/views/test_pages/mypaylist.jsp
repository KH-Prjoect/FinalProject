<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>내 결제내역</h1>
	<table border="1">
		<col width="100"/>
		<col width="100"/>
		<col width="200"/>
		<tr>
			<th>ID</th>
			<th>강의명</th>
			<th>카테고리</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<th>---------------------결제한 강의가 없습니다----------------------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.member_id }</td>
						<td>${dto.lecture_name }</td>
						<td>${dto.lecture_category }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>