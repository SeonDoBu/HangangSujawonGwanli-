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
						<a role="button" onclick="loginLink()">로그인</a>&nbsp;&nbsp;&nbsp;<span>
						<a role="button" onclick="signupLink()">회원가입</a></span>
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
					<input type="text" name="user_id">
				</div>
				<div class="col main-second-pw-box">
					<p>PASSWORD</p>
					<input type="password" name="password">
				</div>
				<div class="col main-second-login-btn-box">
					<button type="submit" onclick="successLogin()">L&nbsp;O&nbsp;G&nbsp;I&nbsp;N</button>
				</div>
				<div class="col main-second-id-pw-search-box">
					<p>
						<a role="button" data-bs-toggle="modal"
						   data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">ID찾기</a>&nbsp;|&nbsp; 
						<a role="button" data-bs-toggle="modal"
						   data-bs-target="#exampleModal2" data-bs-whatever="@getbootstrap">PW찾기</a>
					</p>
				</div>
			</div>
			
			<!-- ID 모달창 -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header admin-modal-header-box">
							<p class="modal-title" id="exampleModalLabel">ID&nbsp;찾기</p>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="#">
								<div class="mb-3 admin-modal-content-box">
									<label for="authId" class="col-form-label">권한</label> 
									<select class="form-select" id="authId" name="auth">
										<option>권한1</option>
										<option>권한2</option>
										<option>관리자</option>
									</select>
								</div>
								<div class="mb-3 admin-modal-content-box">
									<label for="nameId" class="col-form-label">성명</label> 
									<input type="text" class="form-control" id="nameId" name="name">
								</div>
								<div class="mb-3 admin-modal-content-box">
									<label for="emailId" class="col-form-label">EMAIL</label> 
									<input type="text" class="form-control" id="emailId" name="email">
								</div>
							</form>
						</div>
						<div class="modal-footer admin-modal-btn-box">
							<button type="submit">확인</button>
							<button type="button" data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>

			<!-- PW 모달창 -->
			<div class="modal fade" id="exampleModal2" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header admin-modal-header-box">
							<p class="modal-title" id="exampleModalLabel">PW&nbsp;찾기</p>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="#">
								<div class="mb-3 admin-modal-content-box">
									<label for="authPw" class="col-form-label">권한</label> 
									<select class="form-select" id="authPw" name="auth">
										<option>권한1</option>
										<option>권한2</option>
										<option>관리자</option>
									</select>
								</div>
								<div class="mb-3 admin-modal-content-box">
									<label for="user_id" class="col-form-label">ID</label> 
									<input type="text" class="form-control" id="user_id" name="user_id">
								</div>
								<div class="mb-3 admin-modal-content-box">
									<label for="namePw" class="col-form-label">성명</label> <input
										type="text" class="form-control" id="namePw" name="name">
								</div>
								<div class="mb-3 admin-modal-content-box">
									<label for="emailPw" class="col-form-label">EMAIL</label> <input
										type="text" class="form-control" id="emailPw" name="email">
								</div>
							</form>
						</div>
						<div class="modal-footer admin-modal-btn-box">
							<button type="submit">확인</button>
							<button type="button" data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>							
		</div>
	</div>
</body>
</html>