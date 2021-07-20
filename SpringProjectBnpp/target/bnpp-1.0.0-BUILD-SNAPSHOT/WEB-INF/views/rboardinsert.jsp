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
	
	<div style="width: 60%; margin: auto;">
	<form method="post" action="insertres.do">
		<input type="text" name="member_id" style="width: 20%;" placeholder="${dto.member_id }"/><br>
		<input type="text" name="br_title" style="width: 40%;" placeholder="제목"/>
		<br><br> 
		<div class="form-group">
			<textarea id="summernote" rows="" cols="5" class="form-control" name="br_content"></textarea>
		</div>

		<input type="submit" value="글 작성" style="float: right;" />
	</form>
</div>
	

	<script>
	$(document).ready(function() {
		  $('#summernote').summernote({
			    placeholder: '내용을 입력하세요',
			    tabsize: 2,
			    height: 500,
			    toolbar: [
			    	['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','video']],
				    ['view', ['fullscreen', 'help']]
			    ],
			    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
					
		  });
		});
	</script>
</body>
</html>