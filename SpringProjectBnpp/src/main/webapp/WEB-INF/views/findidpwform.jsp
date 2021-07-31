<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	
	
	$(function(){
		$("#idChk").hide();
		$("#pwChk").hide();
	});
	
	
	function findId(){
		
		var member_nameId=$("input[name=member_nameId]").val().trim();
		var member_email=$("input[name=member_email]").val().trim();
		
		//이메일 유효성 검사 먼저
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(exptext.test(member_email)==false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
			alert("입력하신 메일의 형식이 올바르지 않습니다. 다시 입력해주세요.");
			document.getElementById('idPw').scrollIntoView();
			return false;
		}
		
		var idVal = {
				"member_name" : member_nameId,
				"member_email" : member_email
		};
		
		if(member_nameId == null || member_nameId == "" || member_email == null || member_email == ""){
			alert("이름과 이메일을 모두 입력해주세요!!");
		}else{
			$.ajax({
				type: "GET",
				url: "findId.do",
				data: idVal,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8;",
				dataType:"text",
				success: function(id){
					alert("통신성공");
					if(id != null && id != ""){
						$("#idChk").show();
						$("#idChk").html("아이디는 [ " + id + " ] 입니다.");
					} else {
						$("#idChk").show();
						$("#idChk").html("존재하지 않는 아이디 입니다.");
					}
				},
				error: function(){
					alert("통신실패");
				}
			});
		};
		
	}
	
	function findPw(){
		var member_id = $("input[name=member_id]").val().trim();
		var member_emailPw = $("input[name=member_emailPw]").val().trim();
		
		//이메일 유효성 검사 먼저
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(exptext.test(member_emailPw)==false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
			alert("입력하신 메일의 형식이 올바르지 않습니다. 다시 입력해주세요.");
			document.getElementById('idPw').scrollIntoView();
			return false;
		}
		
		var pwVal = {
				"member_id" : member_id,
				"member_email" : member_emailPw
		}
		
		if(member_id == null || member_id == "" || member_emailPw == null || member_emailPw == ""){
			alert("아이디와 이메일을 모두 입력해주세요!!");
		}else{
			$.ajax({
				type: "post",
				url: "findPw.do",
				data: JSON.stringify(pwVal),
				contentType: "application/json",
				dataType: "json",
				success: function(msg){
					alert("통신성공");
					if(msg.check == true){
						$("#pwChk").show();
						$("#pwChk").html("이메일로 전송된 임시비밀번호로 로그인 해주세요.");
					}else{
						$("#pwChk").show();
						$("#pwChk").html("아이디와 이메일을 다시 확인해주세요.");
					}
				},
				error: function(){
					alert("통신실패");
				}
			});
		}
			
		
	}

</script>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="main-banner wow fadeIn" >
	<div style="position:relative; left:30%;">

	<h1>아이디/비밀번호 찾기</h1>

	<br>
	<br>
	
	<hr>
	<h2>ID찾기</h2>
	
	<table>
		<tr>
			<th>이름</th>
			<td><input type="text" name="member_nameId" placeholder="이름을 입력해주세요"></td>
		</tr>
		<tr>
			<th>Email</th>
			<td><input type="text" id="idPw" name="member_email" placeholder="Email을 입력해주세요"></td>
		</tr>
		<tr>
			<td colspan="2" id="idChk"></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="찾기" onclick="findId()">
			</td>
		</tr>
	</table>
	<hr>
	
	<br>
	<br>
	
	<hr>
	<h2>PW찾기</h2>
	
	<table>
		<tr>
			<th>ID</th>
			<td><input type="text" name="member_id" placeholder="아이디를 입력해주세요"></td>
		</tr>
		<tr>
			<th>email</th>
			<td><input type="text" id="emailPw" name="member_emailPw" placeholder="이메일을 입력해주세요"></td>
		</tr>
		<tr>
			<td colspan="2" id="pwChk"></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="찾기" onclick="findPw()">
			</td>
		</tr>
	</table>
	
	<br>
	<br>
	
	<input type="button" value="홈으로" onclick="location.href='toindex.do'">

</div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>