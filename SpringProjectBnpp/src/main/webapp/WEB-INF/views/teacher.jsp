<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function alt(){
		alert("강의등록page로~");
	}

</script>
</head>
<body>

	<h1>${category} 카테고리</h1>

	<c:if test="${dbDto.member_role == 'T' }"><button type="button" onclick="alt()">강의등록</button></c:if>

	<table border="1">
		<col width="50">
		<col width="100">
		<c:choose>
			<c:when test="${empty list }">
				<tr><th colspan="2">---------등록된 강사가 없습니다---------</th></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<c:if test="${empty dto.member_img_path || dto.member_img_path eq null }"><td><img alt="teacherImg" src="resources/upload/img/dummy.png" width="100" height="100"></td></c:if>
						<c:if test="${not empty dto.member_img_name }"><td><img alt="teacherImg" src="resources/upload/img/${dto.member_img_name }" width="100" height="100"></td></c:if>
						<td>${dto.member_name }</td>
						<td>${dto.member_intro }</td>
					</tr>
					<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

</body>
</html>