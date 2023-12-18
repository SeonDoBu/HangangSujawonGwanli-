<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/components/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자시스템_공지사항</title>
<script type="text/javascript">
	function adminPageMobe(pageId) {
		console.log("page move start!");
		
		var pageCode = pageId;
		
		if (pageCode == 1) {
			location.href = 'adminInfo.do?pageId=' + pageCode;
		} else if (pageCode == 2) {
			location.href = 'adminInfo.do?pageId=' + pageCode;
		} else if (pageCode == 3) {
			location.href = 'adminNotice.do';
		} else {
			location.href = 'home.do';
		} 
	}
</script>

</head>
<body>
	<!-- 상단바 제목 -->
	<div class="admin-topbar-box">
		<div class="row row-col-2 admin-topbar-text-box">
			<div class="cols admin-topbar-text-first">
				<p>관리자시스템</p>
			</div>
			<div class="cols admin-topbar-text-second">
				<p>관리자&nbsp;&nbsp;|&nbsp;&nbsp;로그아웃</p>
			</div>
		</div>
	</div>

	<!-- Sidebar -->
	<div class="admin-sidebar-box">
		<div class="cols admin-sidebar-btn-box">
			<a class="btn" data-bs-toggle="collapse" href="#collapseExample"
				role="button" aria-expanded="false" aria-controls="collapseExample">
				사용자관리</a>
			<div class="collapse admin-sidebar-content-box" id="collapseExample">
				<div class="card card-body admin-sidebar-card-box">
					<a class="btn" onclick="adminPageMobe(1)">사용자관리</a>
                    <a class="btn" onclick="adminPageMobe(2)">기관관리</a>
				</div>
			</div>
		</div>
		<div class="cols admin-sidebar-btn-box">
			<a class="btn" data-bs-toggle="collapse" href="#collapseExample2"
				role="button" aria-expanded="false" aria-controls="collapseExample2">
				운영관리</a>
			<div class="collapse admin-sidebar-content-box" id="collapseExample2">
				<div class="card card-body admin-sidebar-card-box">
					<a class="btn" onclick="adminPageMobe(3)">공지사항</a>
				</div>
			</div>
		</div>
		<div class="cols admin-sidebar-btn-box">
			<a class="btn" data-bs-toggle="collapse" href="#collapseExample3"
				role="button" aria-expanded="false" aria-controls="collapseExample3">
				시스템관리</a>
			<div class="collapse admin-sidebar-content-box" id="collapseExample3">
				<div class="card card-body admin-sidebar-card-box">
					<a class="btn">접속통계</a> 
					<a class="btn">접속이력</a> 
					<a class="btn">로그인이력</a>
				</div>
			</div>
		</div>
	</div>

	<!-- content -->
	<div class="cols admin-content-box">
		<div class="row row-cols-2 admin-content-first-box">
			<div class="cols admin-content-first-image-box">
				<img alt="..." src="/images/admin_icon5.png">
			</div>
			<div class="cols admin-content-first-title-box">
				<p>공지사항</p>					
			</div>
		</div>

		<!-- keyword -->
		<div class="row row-cols-1 admin-content-second-box">
			<div class="cols admin-content-keyword-first-box">
				<p>검색조건</p>
			</div>
			<hr class="admin-content-hr">
			<div class="cols admin-content-keyword-second-box">
				<p>조건</p>
				<select>
					<option>전체</option>
					<option>제목</option>
					<option>제목+내용</option>
				</select>
				<input type="text" name="" placeholder="검색어를 입력하세요."
					   style="width: 400px; margin-left:-10px;">
				<button style="margin-left: 276px;">&nbsp;조회&nbsp;</button>
			</div>
		</div>
		
		<!-- 글번호 Logic -->
		<c:set var="num" value="${page.total-page.start+1 }"/>
		
		<!-- 사용자 리스트 -->
		<div class="row row-cols-1 admin-content-third-box">
			<table class="table admin-content-third-table">
				<tr>
					<th colspan="6"
						style="background-color: transparent; border: none; border-top: 2px solid white; text-align: start; font-size: 24px; font-weight: bolder;">
						공지사항목록</th>	
					<th style="background-color: transparent; border: none; border-top: 2px solid white; text-align: end; font-size: 24px; font-weight: bolder;">
					<button>&nbsp;신규등록&nbsp;</button></th>						
				</tr>
				<tr>
					<th colspan="2">제목</th>
					<th>등록일</th>
					<th>조회수</th>
					<th>등록자</th>
					<th colspan="2">첨부파일</th>
				</tr>
				<c:forEach var="notices" items="${noticeAllList }">
					<tr>
						<td>${num }</td>
						<c:set var="num" value="${num -1 }"/>	
						<td>${notices.title }</td>
						<td>
							<fmt:formatDate value="${notices.created_date }" type="date"
										    pattern="YYYY-MM-dd hh:mm:ss"/>						
						</td>
						<td>${notices.readcount }</td>
						<td>${notices.user_id }</td>
						<td colspan="2">-</td>
					</tr>
				</c:forEach>				
			</table>		
			<!-- 페이징 처리 구간 -->
			<div class="row row-cols-1 admin-paging-box">			
				<nav aria-label="Page navigation example admin-paging-nav-box"
					 style="display: flex; justify-content: center;">
					<ul class="pagination">	
						<c:if test="${page.startPage > page.pageBlock}">
							<li class="page-item">
							<a href="adminNotice.do?currentPage=${page.startPage-page.pageBlock}"
							   class="pageblock page-link">[이전]</a></li>
						</c:if>
						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							<li class="page-item">
							<a href="adminNotice.do?currentPage=${i}" 
							   class="pageblock page-link ${page.currentPage == i ? 'active':'' }">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${page.endPage < page.totalPage}">
							<li class="page-item">
							<a href="adminNotice.do?currentPage=${page.startPage+page.pageBlock}"
							   class="pageblock page-link">[다음]</a></li>
						</c:if>	
					</ul>
				</nav>
			</div>
		</div>		
	<!-- content end -->
	</div>
</body>
</html>