<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h2 {
	text-align: center;
}

table {
	width: 100%;
}

#outter {
	display: block;
	width: 60%;
	margin: auto;
}

.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

.accordion:hover {
	background-color: #ccc;
}

.panel {
	padding: 0 18px;
	display: none;
	background-color: white;
	overflow: hidden;
}
</style>
<body>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.menus li').click(function() {
				$('.menus li').find('a').removeClass('active');
				$(this).find('a').addClass('active');
				$('.mypage').hide();
				var i = $(this).index();
				$('.mypage').eq(i).show();
			});
			$('.menus li').eq(1).trigger('click');
		});
	</script>
	<script>
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href = "boardList.do?nowPage=${paging.nowPage}&cntPerPage="
					+ sel
		}
	</script>

	<jsp:include page="header.jsp" />

	<div class="main-banner wow fadeIn">


		<div style="position: relative; left: 4%; z-index: 1; width: 100px">
			<nav>
				<ul class="menus" style="list-style: none;">
					고객센터 메뉴
					<li><a class="menu">FAQ</a></li>
					<li><a class="menu">1:1문의</a></li>
				</ul>
			</nav>
		</div>
		<div class="mypage"
			style="width: 900px; position: relative; left: 20%;">

			<h2>자주묻는질문</h2>

			<div>
				<button class="accordion">보나베띠는 어떤 서비스인가요?</button>
				<div class="panel">
					<p>언제 어디서나 나만의 요리를 가르치고, 배우고 싶은 요리를 편리하게 선택하고, 내집 내직장 가까운 곳에서
						쿠킹클래스가 열리는, 천만가지 즐거운 요리경험을 제공하는 쿠킹클래스 공유 플랫폼 서비스입니다.</p>
				</div>

				<button class="accordion">서비스 가능지역이 궁금해요</button>
				<div class="panel">
					<p>PC사용과 인터넷연결이 가능한 환경에서 이용 가능한 서비스입니다.</p>
				</div>

				<button class="accordion">회원가입은 어떻게 하나요?</button>
				<div class="panel">
					<p>보나베띠 서비스는 누구나 무료로 이용이 가능합니다. SNS 계정(네이버,카카오)이나 이메일로 쉽고 간단하게
						회원가입을 할 수 있습니다.</p>
				</div>
				<button class="accordion">부가가치세가 포함이 되어 있나요?</button>
				<div class="panel">
					<p>네. VAT(부가가치세)는 서비스에 부과되는 필수세금입니다. 클래스 비용에 포함이 되어있습니다.</p>
				</div>
				<button class="accordion">예약확정 여부는 어떻게 확인 할수 있나요?</button>
				<div class="panel">
					<p>신청한 클래스 예약 확정 여부는 '마이페이지>예약클래스'에서 실시간 확인하실수 있습니다.</p>
				</div>

				<button class="accordion">클래스를 개설하고 싶어요. 어떻게 해야하나요?</button>
				<div class="panel">
					<p>선생님으로 승인되시면, 바로 클래스를 개설 할 수 있습니다. 마이페이지에서 클래스정보 작성, 승인이 완료되면
						바로 수강생 모집이 시작됩니다. 선생님은 '마이페이지'에서 모집 현황을 확인할 수 있습니다.</p>
				</div>
			</div>
		</div>


		<div class="mypage">
				<div style="width: 75%; margin: auto;">
				<h2>1:1 문의게시판</h2>
				<table border="1">
					<tr>
						<th>작성자</th>
						<td>${qdto.member_id }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${qdto.bq_title }</td>
					</tr>
					<tr>
						<th></th>
						<td><div id="summernote" class="form-control"
								style="width: 600px; height: 100%;">${qdto.bq_content }</div></td>
					</tr>

					<tr>
						<c:if test="${dbDto.member_id == qdto.member_id }">

							<td align="right"><input type="button"
								value="수정"
								onclick="location.href='qnaupdateform.do?bq_num=${qdto.bq_num}'" />
						</c:if>
						<c:if test="${dbDto.member_id == 'admin' }">

							<td colspan="2" align="right"><input type="button"
								value="답변"
								onclick="location.href='answerinsertform.do?bq_num=${qdto.bq_num}'" />
								<input type="button"
											value="삭제" onclick="location.href='qnadelete.do?bq_num=${qdto.bq_num}'" />
						</c:if>
						
						<td>
						<input type="button" value="목록"
							onclick="location.href='qnalist.do?'"></td>
					</tr>

				</table>

				<hr />
			</div>
		</div>





	<jsp:include page="footer.jsp" />

	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>
</body>
</html>