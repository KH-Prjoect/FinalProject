<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>UPDATE</h1>
	<form action="studentupdateres.do">
		<table border="1">
			<tr>
				<th>ID</th>
				<td><input type="text" name="member_id" value="${dto.member_id }" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="member_pw" value="${dto.member_pw }"/></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="member_name" value="${dto.member_name }"/></td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" name="member_email" value="${dto.member_email }"/></td>
			</tr>
			<tr>
				<th>PHONE</th>
				<td><input type="text" name="member_phone" value="${dto.member_phone }"/></td>
			</tr>
			<tr>
				<th>ADDRESS</th>
				<td><input type="text" name="member_address" value="${dto.member_address }"/></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<input type="submit" value="정보 수정" />
					<input type="button" value="취소" onclick="location.href='./memberselect.do?member_id=${dto.member_id}'">
				</td>
			</tr>

		</table>

	</form>

</body>
</html>