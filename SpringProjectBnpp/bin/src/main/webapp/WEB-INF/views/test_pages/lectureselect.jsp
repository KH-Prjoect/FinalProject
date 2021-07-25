<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<th>카테고리</th>
			<td>${dto.lecture_category }</td>
		</tr>
		<tr>
			<th>강사이름</th>
			<td>${dto.member_name }</td>
		</tr>
		<tr>
			<th>강의명</th>
			<td>${dto.lecture_name }</td>
		</tr>
		<tr>
			<th>강의설명</th>
			<td><textarea cols="60" rows="10" readonly="readonly">${dto.lecture_content }</textarea></td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${dto.lecture_price }</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="수정" onclick="location.href='./lectureupdate.do?lecture_num=${dto.lecture_num}'"/>
				<input type="button" value="삭제" onclick="location.href='./lecturedelete.do?lecture_num=${dto.lecture_num}'"/>
				<input type="button" value="목록" onclick="location.href='./lecturelist.do'">
			</td>
		</tr>

	</table>
</body>
</html>