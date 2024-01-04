<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/components/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자관리_기관관리</title>

<script type="text/javascript">
	function adminPageMobe(pageId) {
		console.log("page move start!");
		
		var pageCode = pageId;
		
		if (pageCode == 1) {
			location.href = 'adminInfo.do?pageId=' + pageCode;
		} else if (pageCode == 2) {
			location.href = 'gigwan.do?pageId=' + pageCode;
		} else if (pageCode == 3) {
			location.href = 'adminNotice.do';
		} else {
			location.href = 'home.do';
		} 
	}
	
	function checkgigwan_id(gigwan_id) {
	    console.log("checkgigwan_id start!");

	    var gigwan_id = gigwan_id;
   $.ajax({
	        type: 'GET',
	        url: 'gigwanDetail.do',
	        data: { gigwan_id: gigwan_id },
	        success: function(response) {
	            console.log("Ajax success!");

	            var data = $(response);
	            console.log(data);
	            
	            /* $('#content').val(data.find('#content').val()); */
	            $('#gigwan_id').val(data.find('#gigwan_id').val());
	            $('#name').val(data.find('#name').val());
	            $('#address').val(data.find('#address').val());
	           /*  $('#dept').val(data.find('#dept').val()); */
	            $('#tel').val(data.find('#tel').val());
	            $('#info').val(data.find('#info').val());
	           /*  $('#status').val(data.find('#status').val());
	            var test = $('#content').val(data.find('#content').val());
	            console.log(test); */

	            // Show the modal
	            $('#exampleModal').modal('show');
	        },
	        error: function(error) {
	            console.error("Ajax error:", error);
	        }
	    });
	} 

</script>
</head>
<body>
	<!-- 상단바 제목 -->
	<%@ include file="adminHeader.jsp" %>

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
			
						<p>기관관리</p>
		

			</div>
		</div>

		<!-- keyword -->
		<div class="row row-cols-1 admin-content-second-box" style="width: 1200px;">
			<div class="cols admin-content-keyword-first-box">
				<p>검색조건</p>
			</div>
			<hr class="admin-content-hr">
			<div class="cols admin-content-keyword-second-box">
				<p>권한</p>
				<select>
					<option>전체</option>
					<option>권한</option>
					<option>아이디</option>
					<option>성명</option>
				</select>
				<p>아이디</p>
				<input type="text" name="user_id">
				<p>성명</p>
				<input type="text" name="name">
				<button>&nbsp;조회&nbsp;</button>
			</div>
		</div>
		
		<!-- 글번호 Logic -->
		<c:set var="num" value="1"/>
		
		<!-- 기관 리스트 -->
		<div class="row row-cols-1 admin-content-third-box" style="width: 1200px;">
			<table class="table admin-content-third-table" >
				<tr>
					<th colspan="8"
						style="background-color: transparent; border: none; border-top: 2px solid white; text-align: start; font-size: 24px; font-weight: bolder;">
						기관 목록</th>
				</tr>
				<tr>
					<th colspan="2">기관 ID</th>
					<th>기관명</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>정보</th>
					
					
					
				</tr>
				<c:forEach var="GL" items="${gigwanList }">
					<tr>
						<td>${num }</td>
						<c:set var="num" value="${num +1 }"/>	
						
						<td><a href="" onclick="checkgigwan_id('${GL.gigwan_id }')" role="button" data-bs-toggle="modal"
							   data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">
								${GL.gigwan_id }</a></td>
								
						<td>${GL.name }</td>		
						<td>${GL.address }</td>
						<td>${GL.tel }</td>
						<td>${GL.info }</td>
					
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
						<a href="adminInfo.do?currentPage=${page.startPage-page.pageBlock}"
						   class="pageblock page-link">[이전]</a></li>
					</c:if>
					<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						<li class="page-item">
						<a href="adminInfo.do?currentPage=${i}" 
						   class="pageblock page-link ${page.currentPage == i ? 'active':'' }">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${page.endPage < page.totalPage}">
						<li class="page-item">
						<a href="adminInfo.do?currentPage=${page.startPage+page.pageBlock}"
						   class="pageblock page-link">[다음]</a></li>
					</c:if>	
				</ul>
			</nav>
		</div>
			
			<!-- 모달창 -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header admin-modal-header-box">
							<p class="modal-title" id="exampleModalLabel">기관&nbsp;상세</p>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body" id="userDetailModalBody">
							<form action="updateGigwan.do" method="post">
							
								<div class="mb-3 admin-modal-content-box">
									<label for="gigwan_id" class="col-form-label">기관ID</label> 
									<input type="text" class="form-control" name="gigwan_id" id="gigwan_id" value="${gigwan.gigwan_id }">
								</div>
								<div class="mb-3 admin-modal-content-box">
									<label for="name" class="col-form-label">기관명</label> 
									<input type="text" class="form-control" name="name" id="name" value="${gigwan.name }">
								</div>
								<div class="mb-3 admin-modal-content-box">
									<label for="gigiwan" class="col-form-label">주소</label> 
									<input type="text" class="form-control"  name="address" id="address" value="${gigwan.address}" >
								</div>
								<div class="mb-3 admin-modal-content-box">
									<label for="dept" class="col-form-label">전화 번호</label> 
									<input type="text" class="form-control" id="tel" name="tel" value="${gigwan.tel }">
								</div>
								<div class="mb-3 admin-modal-content-box">
									<label for="tel" class="col-form-label">정보</label> 
									<input type="text" style="width: 300px; height: 200px;" class="form-control" id="info" name="info" value="${gigwan.info }">
								</div>
							
						</div>
						<div class="modal-footer admin-modal-btn-box">
							<button type="submit">수정</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	<!-- content end -->
	</div>
</body>
</html>