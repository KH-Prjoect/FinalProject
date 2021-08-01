<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	function test(){
		var p1 = $('#password1').val();
		var p2 = $('#password2').val();
		
		if(p1 != p2){
			$("#pw_msg").text("비밀번호를 다시 입력해주세요");
			return false;
		}else if($("#id1").val() == $("#password1").val()){
			alert("아이디와 비밀번호는 달라야 합니다!");
			$("#id1").focus();
			$("#password1").val() = "";
			return false;
		}else if(p1 == p2){
			$("#pw_msg").text("비밀번호가 일치합니다");
			document.getElementById('name1').scrollIntoView();
			$("input[name=pwDoubleCheck]").val('1');
		}
		
	}
	
	function idCheck(){
		
		var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
		
		if($.trim($("input[name=member_id]").val())== "" || $("input[name=member_id]").val() == null){
			alert("공백은 사용이 불가능합니다.");
			return false;
		}else if(!getCheck.test($("#id1").val())){
			alert("ID는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");
			$("#id1").val(""); 
			$("#id1").focus();
			return false;
		}
		
		var checkId = $("input[name=member_id]").val();
		$.ajax({
			type:"POST",
			url:"idCheck.do",
			async : false,
			data : {checkID : checkId},
			success : function(data){
				if(data == "false") {
					alert("중복된 아이디 입니다.");
					$("#id_msg").text("중복된 아이디 입니다.");
				} else {
					alert("사용가능한 아이디 입니다.");
					$("#id_msg").text("사용가능한 아이디 입니다.");
					$("input[name=idDoubleCheck]").val('1');
				}
			},
			error: function(){
				alert("error");
			}
		});
	}
	
	//영역 숨기기할 때 tr외부나 내부에 div 안먹히니깐 tr에 id줘서 해결하기
	function setDisplay(value){
		if(value=="M"){
			tInt.style.display='none';
			tCat.style.display='none';
			tCer.style.display='none';
			tCar.style.display='none';
		}else{
			tInt.style.display='';
			tCat.style.display='';
			tCer.style.display='';
			tCar.style.display='';
		}
	}
	
	function isValid(inputVal){
		if (inputVal == null || inputVal.trim() == "") {
			alert("* 표시는 필수입력 항목입니다!");
			return true;
		} else {
			return false;
		}
	}
	
	// focus는 모든 태그에 적용 안됨(textarea는 되는데 input은 안됨), scrollIntoView()이건 거의 모든 태그 가능함
	function confirm(){
		
		var member_emailValid = $("input[name=member_email]").val();
		
		//이메일 유효성 검사 먼저
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(exptext.test(member_emailValid)==false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
			alert("입력하신 메일의 형식이 올바르지 않습니다. 다시 입력해주세요.");
			document.getElementById('email1').scrollIntoView();
			return false;
		}
		
		if($("input[name=idDoubleCheck]").val()=='0'){
			alert("아이디 중복확인 해주세요.");
			document.getElementById('id1').scrollIntoView();

		}else if($("input[name=pwDoubleCheck]").val()=='0'){
			alert("비밀번호 확인을 해주세요!");
			
		}else if(isValid($('input[name=member_id]').val())){
			alert("아이디를 입력해주세요!");
			document.getElementById('id1').scrollIntoView();
			
		}else if(isValid($('input[name=member_pw]').val())){
			alert("비밀번호를 입력해주세요!");
			document.getElementById('password1').scrollIntoView();
			
		}else if(isValid($('input[name=member_name]').val())){
			alert("이름을 입력해주세요!");
			document.getElementById('name1').scrollIntoView();
			
		}else if(isValid(member_emailValid)){
			alert("이메일을 입력해주세요!");
			document.getElementById('email1').scrollIntoView();
			
		}else if(isValid($('input[name=member_phone_1]').val())){
			alert("전화번호를 입력해주세요!");
			document.getElementById('phone1').scrollIntoView();
			
		}else if(isValid($('input[name=checkAd]').val())){
			alert("주소를 선택해주세요!");
			document.getElementById('postcode').scrollIntoView();
			
		}else{
			alert("회원가입 버튼 클릭");
		
			$('input[name=member_address]').val($('#roadAddress').val()
											  + ','
					  						  + $('#jibunAddress').val()
					  						  + ','
					  						  + $('#detailAddress').val()
					  						  + ','
										  	  + $('#extraAddress').val());
			//위에랑 기능은 같음
			/* var totalAddress = $('#roadAddress').val() + $('#jibunAddress').val() + $('#detailAddress').val() + $('#extraAddress').val();
			//alert("totalAddress = " + totalAddress);
			$('input[name=member_address]').attr('value',totalAddress); */
			
			var member_phone = $('input[name=member_phone_1]').val() + "-"
			+ $('input[name=member_phone_2]').val() + "-"
			+ $('input[name=member_phone_3]').val();
			$('input[name=member_phone]').attr('value', member_phone);
												  
			//alert("최종 input[name=member_address] = " + $("input[name=member_address]").val());
			$("form[name=signupform]").submit();
		}
	}
	
	
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function DaumPostCode(){
		 new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("roadAddress").value = roadAddr;
	                document.getElementById("jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }

	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	}
</script>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="main-banner wow fadeIn">
	<div style="position:relative; left:20%;">
	<h1>회원가입</h1>
	
	<form name="signupform" action="signupres.do">
		<table>
			<tr>
				<th>* ID</th>
				<td><input type="text" id="id1" name="member_id" ><input type="button" onclick="idCheck();" value="중복확인"> ID는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.
					<br/>
					<span id="id_msg"></span>
					<input type="hidden" name="idDoubleCheck" value="0">
				</td>
			</tr>
			<tr>
				<th>* PW</th>
				<td><input type="text" id="password1" name="member_pw" ></td>
			</tr>
			<tr>
				<th>* PW확인</th>
				<td><input type="password" id="password2" name="member_pw_conform" ><input type="button" onclick="test();" value="비밀번호확인">
				<br>
				<span id="pw_msg"></span>
				<input type="hidden" name="pwDoubleCheck" value="0">
				</td>
			</tr>
			<tr>
				<th>* NAME</th>
				<td><input type="text" id="name1" name="member_name" ></td>
			</tr>
			<tr>
				<th>* EMAIL</th>
				<td><input type="text" id="email1" name="member_email" placeholder="example@example.com"></td>
			</tr>
			<tr>
				<th>* PHONE</th>
				<td>
					<input type="hidden" name="member_phone" value="" >
					<input class="general_signup_phone" id="phone1" type="text" name="member_phone_1" maxlength="3" size="3" >
					-
					<input class="general_signup_phone" type="text" name="member_phone_2" maxlength="4" size="3" >
					-
					<input class="general_signup_phone" type="text" name="member_phone_3" maxlength="4" size="3" >		
				</td>
			</tr>
			<tr>
				<th>* ADDRESS</th>
				<td>
					<input type="text" id="postcode" placeholder="우편번호">
					<input type="button" value="주소 검색" onclick="DaumPostCode()">
					<br>
					<input type="text" name="checkAd" id="roadAddress" placeholder="도로명주소">
					<input type="text" id="jibunAddress" placeholder="지번주소">
					<br>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="detailAddress" placeholder="상세주소">
					<input type="text" id="extraAddress" placeholder="참고항목">
					<input type="hidden" id="address1" name="member_address" >
				</td>
			</tr>
			<tr>
				<th>강사가입시 체크</th>
				<td><input type="radio" id="tr1" name="member_role" value="T" onclick="setDisplay(this.value)"><label>강사가입</label>
				    <input type="radio" id="tr2" name="member_role" value="M" onclick="setDisplay(this.value)" checked><label>강사가입안함</label>
					</td>
			</tr>
			<tr id="tInt" style="display: none;">
				<th>강사소개</th>
				<td>
					<textarea rows="10" cols="20" name="member_intro"></textarea>
				</td>
			</tr>
			<tr id="tCat" style="display: none;">
				<th>강사 분야</th>
				<td><input type="radio" name="member_category" value="한식">한식
					<input type="radio" name="member_category" value="중식">중식
					<input type="radio" name="member_category" value="양식">양식
					<input type="radio" name="member_category" value="일식">일식
					<input type="radio" name="member_category" value="기타">기타
				</td>
			</tr>
			<tr id="tCer" style="display: none;">
				<th>강사 자격증</th>
				<td><textarea rows="10" cols="20" name="member_certi"></textarea></td>
			</tr>
			<tr id="tCar" style="display: none;">
				<th>강사 경력</th>
				<td><textarea rows="10" cols="20" name="member_career"></textarea></td>
			</tr>
			<tr>
				<td>
					<!-- required속성이나 type을 email또는 tel쓰고 싶으면 type이 submit인게 있어야함 -->
					<input type="button" value="회원가입" onclick="confirm()">
					<input type="button" value="취소" onclick="location.href='home.do'">
				</td>
			</tr>
		</table>
	</form>
	</div>
	</div>
	
<jsp:include page="footer.jsp" />
	
</body>

</html>