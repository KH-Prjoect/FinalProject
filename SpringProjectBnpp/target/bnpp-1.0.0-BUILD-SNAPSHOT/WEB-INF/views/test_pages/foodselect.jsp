<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>SELECT</h1>
	<table border=1>
		<tr>
			<th>식품명</th>
			<td>${dto.food_name }</td>
		</tr>
		<tr>
			<th>유통기한</th>
			<td>
				<c:choose>
					<c:when test="${empty dto.food_life}">유통기한 미설정</c:when>
					<c:otherwise>${dto.food_life }</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="유통기한 기입/수정" onclick="location.href='./foodlifeupdate.do?food_num=${dto.food_num}'"/>
				<input type="button" value="식품 삭제" onclick="location.href='./fooddelete.do?food_num=${dto.food_num}'"/>
				<input type="button" value="내 식품 목록" onclick="location.href='./myfoodlist.do?member_id=asd123'">
			</td>
		</tr>

	</table>
</body>
</html>