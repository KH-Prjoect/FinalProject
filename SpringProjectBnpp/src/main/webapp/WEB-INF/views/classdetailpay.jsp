<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="1">
		<tr>
			<th>강의 이름</th>
			<td>${dto.class_title }</td>
		</tr>
		<tr>
			<th>강의 소개</th>
			<td>${dto.class_intro }</td>
		</tr>
		<tr>
			<th>강의 가격</th>
			<td>${dto.class_price }</td>
		</tr>
		<tr>
			<th>강의 방법</th>
			<td>${dto.class_how }</td>
		</tr>
		<tr>
			<th>강의 장소</th>
			<td>${dto.class_where }</td>
		</tr>
		<tr>
			<th>필요한 재료</th>
			<td>${dto.class_ingred }</td>
		</tr>
		<tr>
			<th>강의 내용</th>
			<td>${dto.class_content }</td>
		</tr>
		<tr>
			<td>
				<button onclick="">결재</button>
				<button onclick="history.back()">취소</button>
			</td>
		</tr>
	</table>

</body>
</html>