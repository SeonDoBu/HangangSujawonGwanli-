<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/components/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자공지사항_신규등록</title>
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

	<!-- content -->
	
	<div class="container notcieDetail-container">
		<form action="AdNoticeInsert1.do" method="post">
		<div class="row row-cols-1 notcieDetail-content-box">
			<div class="row row-cols-2 notcieDetail-first-box">
				<div class="cols notcieDetail-first-image-box">
					<img alt="..." src="/images/info_icon1.png">
				</div>
				<div class="cols notcieDetail-first-title-box">
					<p>공지사항</p>
				</div>
			</div>
		
			<div class="row row-cols-1 notcieDetail-second-box">
			<%-- 	<input type="hidden" name="created_date" value="${noticeFindOne.created_date}">  --%>
			
				<table class="table notcieDetail-second-table">
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" name="title" ></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="user_id" ></td>
						<th>작성일자</th>
						<!-- Data pattern 변환 -->
						
						<td><input type="text" name="created_date" >  </td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3"><input type="text" name="file_name" ></td>
					</tr>
				</table>
			</div>
			<div class="row row-cols-1 notcieDetail-third-box">
				<table class="table notcieDetail-third-table">
					<tr>
						<td><textarea type="text" rows="25" cols="110"  name="content"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="row row-cols-1 notcieDetail-fourth-box">
			
				<button type="submit" style="margin-left: 20px; margin-right: 20px;"> 등록</button>
			
			</div>
			
		</div>
		</form>
	</div>
	
</body>
</html>