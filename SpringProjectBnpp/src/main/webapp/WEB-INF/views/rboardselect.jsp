<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>DETAIL</h1>

	<table border="1">
		<tr>
			<th>작성자</th>
			<td>${dto.member_id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.br_title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.br_content }</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">${dto.br_reccount } <input type="button" value="추천" onclick=""/></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="수정" onclick="location.href='updateform.do?br_num=${dto.br_num}'"/>
				<input type="button" value="삭제" onclick="location.href='delete.do?br_num=${dto.br_num}'"/>
				<input type="button" value="목록" onclick="location.href='list.do?'"/>
			</td>
		</tr>
	</table>

</body>
</html>