<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/components/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자시스템_공지사항</title>
<script type="text/javascript">
/* function submitfuc(index) {
	if(index == 1){
		document.submitform.action = 'updateadNoti.do';	
	}
	if(index == 2){
		document.submitform.action = "adminNotice.do";
		
	}
	
	document.submitform.submit();
} */


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
function pageMove() {
		location.href="adminNotice.do";
	
}


function checkUser_id(user_id) {
    console.log("checkUser_id start!");

    var userId = user_id;

    $.ajax({
        type: 'GET',
        url: 'userDetail.do',
        data: { userId: userId },
        success: function(response) {
            console.log("Ajax success!");

            var data = $(response);
            console.log(data);
            
            $('#content').val(data.find('#content').val());
            $('#user_id').val(data.find('#user_id').val());
            $('#name').val(data.find('#name').val());
            $('#gigiwan').val(data.find('#gigiwan').val());
            $('#dept').val(data.find('#dept').val());
            $('#tel').val(data.find('#tel').val());
            $('#email').val(data.find('#email').val());
            $('#status').val(data.find('#status').val());
            var test = $('#content').val(data.find('#content').val());
            console.log(test);

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
	
	<div class="container notcieDetail-container">
		<div class="row row-cols-1 notcieDetail-content-box">
			<div class="row row-cols-2 notcieDetail-first-box">
				<div class="cols notcieDetail-first-image-box">
					<img alt="..." src="/images/info_icon1.png">
				</div>
				<div class="cols notcieDetail-first-title-box">
					<p>공지사항</p>
				</div>
			</div>
		<form action="updateadNoti.do" method="post">
			<div class="row row-cols-1 notcieDetail-second-box">
			<%-- 	<input type="hidden" name="created_date" value="${noticeFindOne.created_date}">  --%>
				<input type="hidden" name="notice_id" value="${noticeFindOne.notice_id}">
				<table class="table notcieDetail-second-table">
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" name="title" value="${noticeFindOne.title }"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="user_id" value="${noticeFindOne.user_id }"></td>
						<th>작성일자</th>
						<!-- Data pattern 변환 -->
						 <fmt:formatDate var="created_date"   value="${noticeFindOne.created_date}" pattern="yyyy-MM-dd" />
						<td><input type="text" name="created_date" value="${noticeFindOne.created_date}">  </td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3"><input type="text" name="file_name" value="${noticeFindOne.file_name }"></td>
					</tr>
				</table>
			</div>
			<div class="row row-cols-1 notcieDetail-third-box">
				<table class="table notcieDetail-third-table">
					<tr>
						<td><input type="text" name="content" value="${noticeFindOne.content }"></td>
					</tr>
				</table>
			</div>
			<div class="row row-cols-1 notcieDetail-fourth-box">
				<button onclick="pageMove()">&nbsp;&nbsp;목록으로&nbsp;&nbsp;</button>
				
				<button type="submit" style="margin-left: 20px; margin-right: 20px;"> 수정</button>

				<button type="button"> 삭제</button>
			
			</div>
			</form>
		</div>
		
	</div>
	
</body>
</html>