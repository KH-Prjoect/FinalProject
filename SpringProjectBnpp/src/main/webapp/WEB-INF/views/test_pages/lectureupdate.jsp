<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>UPDATE</h1>
	<form action="lectureupdateres.do">
		<input type="hidden" name="lecture_num" value="${dto.lecture_num }" />
		<table border="1">
			<tr>
				<th>카테고리</th>
				<td>
					<select name="lecture_category">
						<option value="한식">한식</option>
						<option value="중식">중식</option>
						<option value="일식">일식</option>
						<option value="베이커리">베이커리</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>강사이름</th>
				<td>${dto.member_name }</td>
			</tr>
			<tr>
				<th>강의명</th>
				<td><input type="text" name="lecture_name" value="${dto.lecture_name }"/></td>
			</tr>
			<tr>
				<th>강의설명</th>
				<td><textarea cols="60" rows="10" name="lecture_content">${dto.lecture_content }</textarea></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="lecture_price" value="${dto.lecture_price }"/></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<input type="submit" value="강의 수정" />
					<input type="button" value="취소" onclick="location.href='./lectureselect.do?lecture_num=${dto.lecture_num}'">
				</td>
			</tr>

		</table>

	</form>

</body>
</html>