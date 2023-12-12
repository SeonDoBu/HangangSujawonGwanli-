<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/components/header.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function pageMove(id) {
		console.log("실행");
		if (id === 1) {
			location.href = 'info.do';
		} else {
			location.href = 'notice.do';
		}

	}

	function findIdPw() {
		console.log("실행");
	    var width = 500;
	    var height = 400;
	    var left = (window.screen.width / 2) - (width / 2);
	    var top = (window.screen.height / 4);
	    var windowStatus = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
	    const url = 'findId.do'

	    	window.open(url, "hello popup", windowStatus);
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
					<p>
						<a onclick="findIdPw()">ID찾기</a>&nbsp;|&nbsp;<a
							onclick="findIdPw()">PW찾기</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>