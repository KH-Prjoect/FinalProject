<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>강의목록</h1>
	<table border="1">
		<col width="50"/>
		<col width="100"/>
		<col width="500"/>
		<col width="100"/>
		<tr>
			<th>카테고리</th>
			<th>강사</th>
			<th>강의명</th>
			<th>가격</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<th>---------------------등록된 강의가 없습니다----------------------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.lecture_category }</td>
						<td>${dto.member_name }</td>
						<td><a href="./lectureselect.do?lecture_num=${dto.lecture_num }">${dto.lecture_name }</a></td>
						<td>${dto.lecture_price }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="강의등록" onclick="location.href='./lectureinsert.do'"/>
			</td>
		</tr>
	</table>
</body>
</html>