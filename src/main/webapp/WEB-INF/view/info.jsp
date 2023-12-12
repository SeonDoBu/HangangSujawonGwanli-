<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/infoCss.css">
<script type="text/javascript">
	function pageMove() {
		console.log("실행");
		location.href = 'home';
	}
</script>
</head>
<body>
	<div class="container info-container">
		<div class="row row-cols-1 info-content-box">
			<div class="row row-cols-2 info-first-box">
				<div class="cols info-first-image-box">
					<img alt="..." src="/images/info_icon1.png">
				</div>
				<div class="cols info-first-title-box">
					<p>기관&nbsp;소개</p>
				</div>
			</div>
			<div class="col info-second-box">
				<p>•&nbsp;한강홍수통제소</p>
				<p>어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구</p>
			</div>
			<hr class="info-hr-custom">
			<div class="col info-third-box">
				<p>•&nbsp;수자원관리&nbsp;종합&nbsp;폴랫폼</p>
				<p>어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구</p>
			</div>
			<div class="col info-fourth-box">
				<button onclick="pageMove()">&nbsp;&nbsp;메인으로&nbsp;&nbsp;</button>
			</div>
		</div>
	</div>
</body>
</html>