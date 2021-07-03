<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
</script>
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
			<td colspan="2" align="center">${dto.br_reccount }<input
				type="button" value="추천" onclick="" /></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="button" value="수정"
				onclick="location.href='updateform.do?br_num=${dto.br_num}'" /> <input
				type="button" value="삭제"
				onclick="location.href='delete.do?br_num=${dto.br_num}'" /> <input
				type="button" value="목록" onclick="location.href='list.do?'" /></td>
		</tr>
	</table>


	<h1>REPLY</h1>
		<form method="post" action="replylist.do">
		<input type="hidden" name="br_num" value="${dto.br_num }" />
		<button type="submit">댓글</button>
		</form>
	<c:forEach items="${replylist}" var="reply">
		<li>
			<div>
				<p>작성자 : ${reply.reply_member_id} /
					<fmt:formatDate value="${reply.reply_regdate}" pattern="yyyy-MM-dd" />
				<p>${reply.reply_content }</p>
			</div>
		</li>
	</c:forEach>
	<div>

		<form method="post" action="replyinsert.do">
			<input type="hidden" name="br_num" value="${dto.br_num }" />
			<p>
				<label>작성자</label> <input type="text" name="reply_member_id">
			</p>
			<p>
				<textarea rows="5" cols="50" name="reply_content"></textarea>
			</p>
			<p>
				<button type="submit">댓글 작성</button>
			</p>
		</form>

	</div>


</body>
</html>