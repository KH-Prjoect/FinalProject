<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>영수증 스캔 내역</h1>
	<table border="1">
		<col width="300"/>
		<col width="100"/>
		<col width="100"/>
		<col width="200"/>
		<col width="200"/>
		<tr>
			<th>식품명</th>
			<th>가격</th>
			<th>개수</th>
			<th>총액</th>
			<th>스캔한 날짜</th>
		</tr>
		<c:choose>
			<c:when test="${empty b_list}">
				<tr>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${b_list }" var="dto">
					<tr>
						<td>${dto.bill_name }</td>
						<td>${dto.bill_price }</td>
						<td>${dto.bill_quantity }</td>
						<td>${dto.bill_total }</td>
						<td>${dto.bill_date }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="8" align="right">
				<input type="button" value="선택 목록 냉장고로 보내기" onclick="location.href=''"/>
				<input type="button" value="선택 목록 삭제" onclick="location.href=''"/>
			</td>
		</tr>
	</table>
	<form action="scan.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_id" value="${dbDto.member_id }">
		<label>파일 : </label>
		<input multiple="multiple" type="file" name="file">
		<input type="submit" value="스캔하기">
	</form>
</body>
</html>