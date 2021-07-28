<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function(){
	$("#pwupdate").hide();
});

function findPw(){
	var member_id = $("input[name=member_id]").val().trim();
	var member_namePw = $("input[name=member_pw]").val().trim();
	
	var pwVal = {
			"member_id" : member_id,
			"member_name" : member_namePw
	}
	
	if(member_namePw == null || member_namePw == ""){
		alert("비밀번호를 입력해주세요.");
	}else{
		$.ajax({
			type: "post",
			url: "findPw.do",
			data: JSON.stringify(pwVal),
			contentType: "application/json",
			dataType: "text",
			success: function(pw){
				if(pw != null || pw != ""){
					alert("비밀번호 확인");
					$("#pwcheck").hide();
					$("#pwupdate").show();
				}else{
					alert("비밀번호가 다릅니다.");
				}
			},
			error: function(){
				alert("통신실패");
			}
		});
	}
		
}

function updatepw() {
	var member_id = $("input[name=member_id]").val().trim();
	var member_namePw = $("input[name=member_pw]").val().trim();
	
	var pwVal = {
			"member_id" : member_id,
			"member_pw" : member_namePw
	}
	
	if(member_namePw == null || member_namePw == ""){
		alert("비밀번호를 입력해주세요.");
	}else{
		$.ajax({
			type: "post",
			url: "updatepwres.do",
			data: JSON.stringify(pwVal),
			contentType: "application/json",
			dataType: "text",
			success: function(res){
				if(res > 0){
					alert("비밀번호가 변경되었습니다.");
					location.href="./mypage.do?member_id=${member_id}";
				}else{
					alert("비밀번호 수정실패");
				}
			},
			error: function(){
				alert("통신실패");
			}
		});
	}
}
function check() {
	var member_id = $("input[name=member_id]").val().trim();
	var member_namePw = $("input[name=member_pw]").val().trim();
	alert(member_id);
	alert(member_namePw);
}

</script>
<body>

	<h2>비밀번호 입력</h2>
	<input type="hidden" name="member_id" value="${member_id }">
	<input type="text" name="member_pw">
	<input type="button" id="pwcheck" value="비밀번호 확인" onclick="findPw()">
	<input type="button" id="pwupdate" value="비밀번호 변경" onclick="updatepw()">
	<input type="button"  value="홈으로 이동" onclick="location.href='./mypage.do?member_id=${member_id}'">

</body>
</html>