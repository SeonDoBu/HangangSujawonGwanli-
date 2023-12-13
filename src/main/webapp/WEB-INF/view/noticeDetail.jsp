<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/components/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<script type="text/javascript">
	function pageMove() {
		console.log("실행");
		location.href = 'notice.do';
	}
</script>
</head>
<body>
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
			<div class="row row-cols-1 notcieDetail-second-box">
				<table class="table notcieDetail-second-table">
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text"></td>
						<th>작성일자</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3"><input type="text"></td>
					</tr>
				</table>
			</div>
			<div class="row row-cols-1 notcieDetail-third-box">
				<table class="table notcieDetail-third-table">
					<tr>
						<td>어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구</td>
					</tr>
				</table>
			</div>
			<div class="row row-cols-1 notcieDetail-fourth-box">
				<button onclick="pageMove()">&nbsp;&nbsp;목록으로&nbsp;&nbsp;</button>
			</div>
		</div>
	</div>
</body>
</html>