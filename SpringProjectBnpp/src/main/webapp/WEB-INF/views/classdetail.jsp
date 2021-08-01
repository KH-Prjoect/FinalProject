<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.kh.bnpp.model.biz.MemberBiz"%>
<%@page import="com.kh.bnpp.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>

	<jsp:include page="header.jsp" />

	<div class="main-banner wow fadeIn">
	
<div style="position:relative; left:15%;">

		<input type="hidden" name="member_id" value="${dbDto.member_id }" />
		<input type="hidden" name="class_num" value="${dto.class_num }" />
		<table class="table table-bordered w-auto">
			<tr>
				<th>강의 이름</th>
				<td>${dto.class_title }</td>	
			</tr>
			<tr>
				<th>강의 소개</th>
				<td>${dto.class_intro }</td>
			</tr>
			<tr>
				<th>강의 가격</th>
				<td>${dto.class_price }</td>
			</tr>
			<tr>
				<th>강의 방법</th>
				<td>${dto.class_how }</td>
			</tr>
			<tr>
				<th>강의 장소</th>
				<td>${dto.class_where }</td>
			</tr>
			<tr>
				<th>필요한 재료</th>
				<td>${dto.class_ingred }</td>
			</tr>
			<tr>
				<th>강의 내용</th>
				<td>${dto.class_content }</td>
			</tr>
			<!-- 동영상  -->
			
			<tr>
				<td>
					<input type="button" value="영상 다운로드" />
					<button onclick="history.back()">취소</button>
				</td>
			</tr>
		</table>
	
	</div>
	</div>
	
<jsp:include page="footer.jsp" />

</body>
</html>