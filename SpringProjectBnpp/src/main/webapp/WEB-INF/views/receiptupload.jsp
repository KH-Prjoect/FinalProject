<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>

    <script type="text/javascript">
    
        $(document).ready(function(){
            var tbl = $("#checkboxtest");
             
            // 테이블 헤더에 있는 checkbox 클릭시
            $(":checkbox:first", tbl).click(function(){
                // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
                if( $(this).is(":checked") ){
                    $(":checkbox", tbl).attr("checked", "checked");
                }
                else{
                    $(":checkbox", tbl).removeAttr("checked");
                }
 
                // 모든 체크박스에 change 이벤트 발생시키기               
                $(":checkbox", tbl).trigger("change");
            });
             
            // 헤더에 있는 체크박스외 다른 체크박스 클릭시
            $(":checkbox:not(:first)", tbl).click(function(){
                var allCnt = $(":checkbox:not(:first)", tbl).length;
                var checkedCnt = $(":checkbox:not(:first)", tbl).filter(":checked").length;
                 
                // 전체 체크박스 갯수와 현재 체크된 체크박스 갯수를 비교해서 헤더에 있는 체크박스 체크할지 말지 판단
                if( allCnt==checkedCnt ){
                    $(":checkbox:first", tbl).attr("checked", "checked");
                }
                else{
                    $(":checkbox:first", tbl).removeAttr("checked");
                }
            }).change(function(){
                if( $(this).is(":checked") ){
                    // 체크박스의 부모 > 부모 니까 tr 이 되고 tr 에 selected 라는 class 를 추가한다.
                    $(this).parent().parent().addClass("selected");
                }
                else{
                    $(this).parent().parent().removeClass("selected");
                }
            });
        });
        
        function deletes() {
        	var cnt = $("input[name='ischeck']:checked").length;
        	var member_id = $("input[name='member_id']").val();
            var bill_list = new Array();
            $("input[name='ischeck']:checked").each(function() {
            	bill_list.push($(this).attr('value'));
            });
            if(cnt == 0){
                alert("선택된 목록이 없습니다.");
            } else {
            	$('input[name=bill_list]').attr('value', bill_list);
            }
        }
       function updates() {
       		var cnt = $("input[name='ischeck']:checked").length;
       		var member_id = $("input[name='member_id']").val();
            var bill_list = new Array();
            $("input[name='ischeck']:checked").each(function() {
           	 	bill_list.push($(this).attr('value'));
            });
            if(cnt == 0){
               alert("선택된 목록이 없습니다.");
            } else {
	           	$('input[name=bill_list]').attr('value', bill_list);
            }
       }
        
    </script>

<body>
	
	<h1>영수증 스캔 내역</h1>
	<form method="post">
	
	<input type="hidden" name="member_id" value="${member_id}"/>
	<input type="hidden" name="bill_list" value=""/>
		<table id="checkboxtest" border="1">
			<col width="50"/>
			<col width="300"/>
			<col width="100"/>
			<col width="100"/>
			<col width="200"/>
			<col width="200"/>
			<tr>
				<th><input type="checkbox" /></th>
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
					<c:forEach items="${b_list }" var="dto" varStatus="status">
						<tr>
							<td>
								<input type="checkbox" name="ischeck" value="${dto.bill_num }"/>
							</td>
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
					<input type="submit" value="선택 목록 냉장고로 보내기" onclick="updates()" formaction="foodinsert.do"/>
					<input type="submit" value="선택 목록 삭제" onclick="deletes()" formaction="billdelete.do"/>
				</td>
			</tr>
		</table>
	
	</form>
		
	
	<form action="scan.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_id" value="${dbDto.member_id }">
		<label>파일 : </label>
		<input multiple="multiple" type="file" name="file">
		<input type="submit" value="스캔하기">
	</form>
</body>
</html>