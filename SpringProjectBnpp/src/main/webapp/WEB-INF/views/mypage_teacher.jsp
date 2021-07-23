<%@page import="com.kh.bnpp.sms.SMS"%>
<%@page import="com.kh.bnpp.model.dto.MemberDto"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.kh.bnpp.model.biz.FoodBizImpl"%>
<%@page import="com.kh.bnpp.model.biz.LectureBizImpl"%>
<%@page import="com.kh.bnpp.model.biz.PayBizImpl"%>
<%@page import="com.kh.bnpp.model.dto.FoodDto"%>
<%@page import="com.kh.bnpp.model.biz.FoodBiz"%>
<%@page import="com.kh.bnpp.model.biz.LectureBiz"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.bnpp.model.dto.LectureDto"%>
<%@page import="com.kh.bnpp.model.biz.PayBiz"%>
<%@page import="com.kh.bnpp.model.dto.PayDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지(강사)</title>
<link href="resources/css/mypage.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	$(function() {
		$('.mymenus li').click(function() {
			$('.mymenus li').find('a').removeClass('active');
			$(this).find('a').addClass('active');
			$('.mypage').hide();
			var i = $(this).index();
			$('.mypage').eq(i).show();
		});
		$('.mymenus li').eq(0).trigger('click');
	});
	
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
		

	function check() {
		var member_phone = $('input[name=member_phone_1]').val() + "-"
				+ $('input[name=member_phone_2]').val() + "-"
				+ $('input[name=member_phone_3]').val();
		$('input[name=member_phone]').attr('value', member_phone);
		var member_addr = $('input[name=member_addr_1]').val() + ","
				+ $('input[name=member_addr_2]').val();
		$('input[name=member_address]').attr('value', member_addr);
	}
	
	function address() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var roadAddr = data.roadAddress;
						var extraRoadAddr = '';
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById('addr_1').value = roadAddr;
						document.getElementById('addr_1').value = data.jibunAddress;
						if (data.autoRoadAddress) {
							document.getElementById('addr_1').value = roadAddr;
						} else if (data.autoJibunAddress) {
							document.getElementById('addr_1').value = data.jibunAddress;
						} else {
						}
					}
				}).open();
	}
	
	
</script>
</head>
<body>
	
	<div class="mypage-body">
	
		<div id="mypage_nav">
			<nav>
				<ul class="mymenus">
					<li><a class="mymenu">나의 강의 목록</a></li>
					<li><a class="mymenu">나의 냉장고</a></li>
					<li><a class="mymenu">회원정보수정</a></li>
					<li><a class="mymenu">회원탈퇴</a></li>
					<li><a class="mymenu">화상 채팅방 개설</a></li>
				</ul>
			</nav>
		</div>
		
		<div class="mypage">
			<h3>나의 강의 목록</h3>
			<br>
			<div class="mypage_lecture">
				<div>
					<c:choose>
						<c:when test="${empty l_list }">
							<span>----------등록된 강의가 없습니다----------</span>
						</c:when>
						<c:otherwise>
							<ul>
								<c:forEach items="${l_list }" var="dto">
									<li class="lecture_list">
										<div class="lecture_img_div">
											<!-- 사진 넣을곳 -->
										</div>
										<div class="lecture_info">
											<span class="lecture_info_num">${dto.lecture_num }</span>
											<span class="lecture_info_name">${dto.lecture_name }</span>
											<span class="lecture_info_category">${dto.lecture_category }</span>
											<span class="lecture_info_money">${dto.lecture_price }원</span>
											<span class="lecture_info_teacher">${dto.member_name }</span>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class="mypage">
			<h2>나의 냉장고</h2>
			<br>
			<div class="mypage_food">
					<form action="foodlifeupdateres.do" method="post">
					<input type="hidden" name="member_id" value="${m_dto.member_id }">
					<table border="1">
						<col width="100"/>
						<col width="200"/>
						<tr>
							<th>식품명</th>
							<th>유통기한</th>
						</tr>
						<c:choose>
							<c:when test="${empty f_list}">
								<tr>
									<th>---------------------등록된 식품이 없습니다----------------------</th>
								</tr>
							</c:when>
							<c:otherwise>
								<%
									int i = 0;
								%>
								<c:forEach items="${f_list }" var="dto">
										<tr>
											<td><input type="text" name="food_list[<%=i%>].food_name" value="${dto.food_name }" /></td>
											<td>
												<input type="hidden" name="food_list[<%=i%>].food_num" value="${dto.food_num }"/>
												<c:choose>
													<c:when test="${empty dto.food_life}">
														<input type="text" name="food_list[<%=i%>].food_life" id="datepicker" value="미설정" />
													</c:when>
													<c:otherwise>
														<input type="text" name="food_list[<%=i%>].food_life" id="datepicker" value="${dto.food_life }" />
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									<%
										i++;
									%>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<tr>
							<td colspan="4" align="right">
								<input type="submit" value="수정사항 적용" />
								<input type="button" value="영수증 스캔" onclick=""/>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		
		<div class="mypage">
			<h2>회원 정보수정</h2>
			<br>
			<div class="join_table">
				<form action="studentupdateres.do"> 
					<div id="general_signup_idpw">
							<div class="general_signup_row">
								<h4 class="general_signup_title">아이디</h4>
								<div class="general_signup_id">
									<span class="general_signup_span">
										<input class="general_signup_text" name="member_id" value="${m_dto.member_id }" readonly="readonly" />
									</span>
								</div>
							</div>
							<div class="general_signup_row">
								<h4 class="general_signup_title">비밀번호</h4>
								<div class="general_signup_pw">
									<span class="general_signup_span">
										<input class="general_signup_text" type="password" name="member_pw" value="${m_dto.member_pw }">
									</span>
								</div>
							</div>
							<div class="general_signup_row">
								<h4 class="general_signup_title">비밀번호 확인</h4>
								<div class="general_signup_pw">
									<span class="general_signup_span">
										<input class="general_signup_text" type="password" name="member_pw_chk" value="${m_dto.member_pw }">
									</span>
								</div>
								<font id="chkNotice" size="2"></font>
							</div>
						</div>
						<div id="general_signup_info">
							<div class="general_signup_row">
								<h4 class="general_signup_title">이름</h4>
								<div class="general_signup_name">
									<span class="general_signup_span">
										<input class="general_signup_text" type="text" name="member_name" value="${m_dto.member_name }" readonly="readonly">
									</span>
								</div>
							</div>
						</div>
						
						<%
						MemberDto m_dto = (MemberDto)request.getAttribute("m_dto");
						String[] email = m_dto.getMember_email().split("@");
						String email_name = email[0];
						String email_addr = email[1];
						%>
						<div class="general_signup_row">
							<h4 class="general_signup_title">이메일</h4>
							<div class="general_signup_email">
								<span class="general_signup_span">
									<input type="text" id="general_signup_email" name="member_email" maxlength="30" value="${m_dto.member_email }">
								</span>
							</div>
						</div>
							
						<%
							String[] phone_num = m_dto.getMember_phone().split("-");
						%>
						<div class="general_signup_row">
							<h4 class="general_signup_title">휴대폰</h4>
							<div class="general_signup_moblie_phone">
								<span class="general_signup_span">
									<input type="hidden" name="member_phone" value="">
									<input class="general_signup_phone" type="text" name="member_phone_1" maxlength="3" size="3" value="<%=phone_num[0]%>">
									-
									<input class="general_signup_phone" type="text" name="member_phone_2" maxlength="4" size="3" value="<%=phone_num[1]%>">
									-
									<input class="general_signup_phone" type="text" name="member_phone_3" maxlength="4" size="3" value="<%=phone_num[2]%>">
								</span>
							</div>
						</div>
						
						<%
							String[] addr = m_dto.getMember_address().split(",");
						%>
						<div class="general_signup_row">
							<h4 class="general_signup_title">주소</h4>
							<div class="general_signup_home_addr">
								<span class="general_signup_span_home_addr">
									<input type="hidden" name="member_address" value="">
									<input class="general_signup_addr" type="text" id="postcode" placeholder="우편번호" readonly="readonly">
									<input type="button" onclick="address();" value="우편번호 찾기">
									<br>
									<input class="general_signup_addr" type="text" name="member_addr_1" id="addr_1" placeholder="기본주소" value="<%=addr[0]%>" readonly="readonly">
									<input class="general_signup_addr" type="text" name="member_addr_2" id="addr_2" placeholder="상세주소" value="<%=addr[1]%>" required="required">
								</span>
							</div>
						</div>	
						
						<div id="general_signup_btn">
							<input type="submit" value="회원정보수정" class="btn btn-outline-secondary" style="font-weight: bold" onclick="check();" />
						</div>
				</form>
			</div>
		</div>
		<div class="mypage">
			<form action="memberdelete.do" method="post">
				<h3>회원탈퇴</h3>
				<div id="general_signup_idpw">
					<div class="general_signup_row">
						<h4 class="general_signup_title">아이디</h4>
						<div class="general_signup_id">
							<span class="general_signup_span">
								<input class="general_signup_text" type="text" value="<%=m_dto.getMember_id()%>" readonly="readonly" />
							</span>
						</div>
					</div>
					<div class="general_signup_row">
						<h4 class="general_signup_title">비밀번호</h4>
						<div class="general_signup_pw">
							<span class="general_signup_span">
								<input class="general_signup_text" type="password" name="member_password" ">
							</span>
						</div>
					</div>
					<div class="general_signup_row">
						<h4 class="general_signup_title">비밀번호 확인</h4>
						<div class="general_signup_pw">
							<span class="general_signup_span">
								<input class="general_signup_text" type="password" name="member_password_chk" ">
							</span>
						</div>
					</div>
				</div>
				<div id="general_signup_btn">
					<button type="submit" class="btn btn-outline-secondary" style="font-weight: bold">회원 탈퇴</button>
				</div>
			</form>
		</div>
		
		<div class="mypage">
			<h3>화상 채팅방 개설</h3>
			
		</div>
		
	</div>
	
</body>
</html>