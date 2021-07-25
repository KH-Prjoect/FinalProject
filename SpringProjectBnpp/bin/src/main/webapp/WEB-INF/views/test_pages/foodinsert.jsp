<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>INSERT</h1>
	<form action="foodinsertres.do">
		<table border="1">
			<tr>
				<th>식품명</th>
				<td><input type="text" name="food_name"/></td>
			</tr>
			<tr>
				<th>id</th>
				<td><input type="text" name="member_id" value="asd123"/></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<input type="submit" value="식품 등록" />
					<input type="button" value="취소" onclick="location.href='./myfoodlist.do?member_id=asd123'">
				</td>
			</tr>
		</table>

	</form>
</body>