<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/components/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한강수자원관리플랫폼</title>

<script type="text/javascript">
	function pageMove(id) {
		console.log("실행");
		if (id === 1) {
			location.href = 'info.do';
		} else {
			location.href = 'notice.do';
		}

	}

	function findIdPw(findId) {
		console.log("실행");
	    var width = 500;
	    var height = 380;
	    var left = (window.screen.width / 2) - (width / 2);
	    var top = (window.screen.height / 4);
	    var windowStatus = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
	    const idUrl = 'findId.do'
	    const pwUrl = 'findPw.do'
	    
		if (findId === 1) {
	    	window.open(idUrl, "hello popup", windowStatus);
		} else {
	    	window.open(pwUrl, "hello popup", windowStatus);
		}

	}
	
    function loginLink() {
        console.log("로그인 클릭됨");
		location.href = 'home.do';

    }

    function signupLink() {
        console.log("회원가입 클릭됨");
		location.href = 'joinForm.do';
    }
    
    function successLogin() {
        console.log("로그인 성공!");
		location.href = 'adminInfo.do';		
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
						<a onclick="loginLink()">로그인</a>&nbsp;&nbsp;&nbsp;<span><a
							onclick="signupLink()">회원가입</a></span>
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
					<button type="submit" onclick="successLogin()">L&nbsp;O&nbsp;G&nbsp;I&nbsp;N</button>
				</div>
				<div class="col main-second-id-pw-search-box">
					<p>
						<a onclick="findIdPw(1)">ID찾기</a>&nbsp;|&nbsp; <a
							onclick="findIdPw(2)">PW찾기</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>