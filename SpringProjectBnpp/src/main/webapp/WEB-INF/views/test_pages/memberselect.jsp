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
			<th>ID</th>
			<td>${dto.member_id }</td>
		</tr>
		<tr>
			<th>PW</th>
			<td>${dto.member_pw }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${dto.member_name }</td>
		</tr>
		<tr>
			<th>EMAIL</th>
			<td>${dto.member_email }</td>
		</tr>
		<tr>
			<th>PHONE</th>
			<td>${dto.member_phone }</td>
		</tr>
		<tr>
			<th>ADDR</th>
			<td>${dto.member_address }</td>
		</tr>
		<tr>
			<th>CATEGORY</th>
			<td>${dto.member_category }</td>
		</tr>
		<tr>
			<th>CERTI</th>
			<td>${dto.member_certi }</td>
		</tr>
		<tr>
			<th>CAREER</th>
			<td>${dto.member_career }</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="수정(학생)" onclick="location.href='./studentupdate.do?member_id=${dto.member_id}'"/>
				<input type="button" value="수정(강사)" onclick="location.href='./teacherupdate.do?member_id=${dto.member_id}'"/>
				<input type="button" value="탈퇴" onclick="location.href='./memberdelete.do?member_id=${dto.member_id}'"/>
				<input type="button" value="목록" onclick="location.href='./memberlist.do'">
			</td>
		</tr>

	</table>
</body>
</html>