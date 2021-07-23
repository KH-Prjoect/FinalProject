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
			$('.menus li').eq(0).trigger('click');
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

	<div class="main-banner wow fadeIn" >


		<div style="position: relative; left: 4%; z-index: 1; width:100px">
		<nav>
			<ul class="menus" style="list-style: none; ">
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
				<button class="accordion">Section 1</button>
				<div class="panel">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

				<button class="accordion">Section 2</button>
				<div class="panel">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

				<button class="accordion">Section 2</button>
				<div class="panel">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>
				<button class="accordion">Section 2</button>
				<div class="panel">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>
				<button class="accordion">Section 2</button>
				<div class="panel">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

				<button class="accordion">Section 3</button>
				<div class="panel">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>
			</div>
		</div>


		<div class="mypage">


			<h2>1:1 문의게시판</h2>

			<div id="outter">
				<div style="float: right;">
					<select id="cntPerPage" name="sel" onchange="selChange()">
						<option value="5"
							<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
							보기</option>
						<option value="10"
							<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
							보기</option>
						<option value="15"
							<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
							보기</option>
						<option value="20"
							<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
							보기</option>
					</select>
				</div>
				<!-- 옵션선택 끝 -->

				<table border="1">
					<col width="50">
					<col width="500">
					<col width="100">
					<col width="100">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>

					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<th colspan="4">-------------작성된 글이 없습니다------------</th>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="dto">
								<tr>
									<td>${dto.bq_num }</td>
									<td><a href="qnaselect.do?br_num=${dto.bq_num }">${dto.bq_title }</a></td>
									<td>${dto.member_id }</td>
									<td>${dto.bq_regdate }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>

					<tr>
						<td colspan="5" align="right"><input type="button"
							value="글작성" onclick="location.href='qnainsertform.do'" /></td>
				</table>
			</div>

			<div style="display: block; text-align: center;">
				<c:if test="${paging.startPage != 1 }">
					<a
						href="qnaboardList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a
								href="boardList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a
						href="qnaboardList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&keyword=${paging.keyword}">&gt;</a>
				</c:if>
			</div>
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