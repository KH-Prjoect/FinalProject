<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>내 냉장고</h1>
	<table border="1">
		<col width="100"/>
		<col width="100"/>
		<col width="200"/>
		<tr>
			<th>ID</th>
			<th>식품명</th>
			<th>유통기한</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<th>---------------------등록된 식품이 없습니다----------------------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.member_id }</td>
						<td><a href="./foodselect.do?food_num=${dto.food_num }">${dto.food_name }</a></td>
						<td>
							<c:choose>
								<c:when test="${empty dto.food_life}">유통기한 미설정</c:when>
								<c:otherwise>${dto.food_life }</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="식품등록" onclick="location.href='./foodinsert.do'"/>
			</td>
		</tr>
	</table>
</body>
</html>