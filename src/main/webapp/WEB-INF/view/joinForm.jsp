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
		location.href = 'join.do';
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
						<a onclick="loginLink()">로그인</a>&nbsp;&nbsp;&nbsp; <span><a
							onclick="signupLink()">회원가입</a></span>
					</p>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>권한</p>
					</div>
					<div class="col main-join-auth-second">
						<select>
							<option>권한1</option>
							<option>권한2</option>
							<option>관리자</option>
						</select>
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>ID</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="text" name="">
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>PW</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="password" name="">
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>PW재확인</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="password" name="">
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>성명</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="text" name="">
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>EMAIL</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="email" name="">
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>TEL</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="text" name="">
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>기관명</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="text" name="">
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>소속부서</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="text" name="">
					</div>
				</div>
				<div class="col main-second-join-btn-box">
					<button type="submit">회원가입</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>