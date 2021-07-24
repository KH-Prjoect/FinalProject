<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>회원목록</h1>
	<table border="1">
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<col width="100"/>
		<tr>
			<th>ID</th>
			<th>등급</th>
			<th>이름</th>
			<th>날짜</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<th>---------------------회원이 없습니다----------------------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.member_id}</td>
						<td>${dto.member_role }</td>
						<td><a href="./memberselect.do?member_id=${dto.member_id }">${dto.member_name}</a></td>
						<td>${dto.member_regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	</table>
</body>
</html>