<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		  $( "#datepicker" ).datepicker({
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		    yearSuffix: '년'
		  });
		});
</script>

<body>

	<h1>UPDATE</h1>
	<form action="foodlifeupdateres.do">
		<input type="hidden" name="food_num" value="${dto.food_num }" />
		<table border="1">
			<tr>
				<th>ID</th>
				<td>${dto.member_id }</td>
			</tr>
			<tr>
				<th>식품명</th>
				<td>${dto.food_name }</td>
			</tr>
			<tr>
				<th>유통기한</th>
				<td><input type="text" name="food_life" id="datepicker" /></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<input type="submit" value="유통기한 수정" />
					<input type="button" value="취소" onclick="location.href='./foodselect.do?food_num=${dto.food_num}'">
				</td>
			</tr>

		</table>

	</form>

</body>
</html>