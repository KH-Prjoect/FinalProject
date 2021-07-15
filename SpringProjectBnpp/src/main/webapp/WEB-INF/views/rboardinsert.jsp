<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>

	<h1>INSERT</h1>

	<form action="insertres.do" method="post">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="member_id" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="br_title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="summernote" name="br_content"></textarea></td>
				<!-- summernote 사용을 위해 table => div로 전환할것 -->
			</tr>
			
			<tr>
				<td colspan="2" align="right"><input type="submit" value="글작성">
					<input type="button" value="취소" onclick="location.href='list.do?'" />
				</td>
			</tr>
		</table>
	</form>

	<script>
		$(document).ready(function() {
			$('#summernote').summernote();
		});
	</script>
</body>
</html>