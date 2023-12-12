<%@ page language="Java" contentType="text/html; charset=UTF-8"
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
<link rel="stylesheet" type="text/css" href="/css/mainCss.css">

<script type="text/javascript">
	function pageMove(id) {
		console.log("실행");
		if (id === 1) {
			location.href = 'info';
		} else {
			location.href = 'notice';
		}

	}
</script>
</head>
<body>
	<div class="container main-container">
		<div class="row row-cols-2 main-content-container">
			<div class="row row-cols-1 main-first-box">
				<div class="col main-first-title-box">
					<p></p>
				</div>

				<div class="col main-first-md-title-box">
					<p>
						한강&nbsp;수자원관리<br>종합플랫폼
					</p>
				</div>
				<div class="col main-first-end-btn-box">
					<button onclick="pageMove(1)">&nbsp;&nbsp;기관소개&nbsp;&nbsp;</button>
					<button onclick="pageMove(2)">&nbsp;&nbsp;공지사항&nbsp;&nbsp;</button>
				</div>
			</div>
			<div class="row row-cols-1 main-second-box">
				<div class="col main-second-title-box">
					<p>
						로그인&nbsp;&nbsp;&nbsp;<span>회원가입</span>
					</p>
				</div>
				<div class="col main-second-md-title-box">
					<p>권한선택</p>
				</div>
				<div class="row row-col-3 main-second-select-box">
					<div class="col main-second-select-first">
						<img alt="" src="/images/admin_icon4.png">
					</div>
					<div class="col main-second-select-second">
						<img alt="" src="/images/admin_icon4.png">
					</div>
					<div class="col main-second-select-third">
						<img alt="" src="/images/admin_icon4.png">
					</div>
				</div>
				<div class="col main-second-id-box">
					<p>ID</p>
					<input type="text" name="">
				</div>
				<div class="col main-second-pw-box">
					<p>PASSWORD</p>
					<input type="password" name="">
				</div>
				<div class="col main-second-login-btn-box">
					<button type="submit">L&nbsp;O&nbsp;G&nbsp;I&nbsp;N</button>
				</div>
				<div class="col main-second-id-pw-search-box">
					<p>ID찾기&nbsp;|&nbsp;PW찾기</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>