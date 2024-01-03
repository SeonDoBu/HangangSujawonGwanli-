<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/components/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한강수자원관리플랫폼</title>
<style type="text/css">
	.input-label {
		font-size: 24px;
		font-weight: bolder;
		color: black;
		margin-bottom: 0px;
		margin-top: 4px;
	}
	
	.input-box {
		width: 320px;
		height: 46px !important;
		border: 2px solid #8C8C8C;
   	 	margin-left: 0px;
	}
</style>

<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function () {
		// 에러 메시지가 존재할 경우 alert창으로 표시
		var errorMsg = "<c:out value='${errorMsg}'/>";
		if(errorMsg != null && errorMsg != undefined && errorMsg != "") {
			alert(errorMsg);
		}
	});
	
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
    
    function loginCheck() {
    	var id = document.getElementById('login_id');
    	var pw = document.getElementById('password');
    	
    	// 아이디를 입력하지 않은 경우
    	if(id.value === "") {
    		alert("아이디를 입력해주세요.");
    		id.focus();
    		return false;
    	}
    	
    	// 비밀번호를 입력하지 않은 경우
    	if(pw.value === "") {
    		alert("비밀번호를 입력해주세요.");
    		pw.focus();
    		return false;
    	}
    	
    	// 모두 입력된 경우
		return true;
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
			
			<div class="row row-cols-1 main-second-box" style="height: 910px;">
				<div class="col main-second-title-box">
					<p>
						<a role="button" onclick="loginLink()">로그인</a>&nbsp;&nbsp;&nbsp;<span>
						<a role="button" onclick="signupLink()">회원가입</a></span>
					</p>
				</div>
				
				<!-- 로그인 -->
				<form method="post" action="loginCheck.do">
					<input type="hidden" name="errorMsg" id="errorMsg" value="${errorMsg}">
					<div class="my-4 row justify-content-center">
						<label class="input-label col-sm-3 text-end">권한</label>
						<div class="col-sm-8">
							<select name="small_code" class="input-box form-select">
								<option value="1">실시간수문관리</option>
								<option value="2">수자원시설물관리</option>
								<option value="3">관리자</option>
							</select>
						</div>
					</div>
					<div class="my-4 row justify-content-center">
						<label class="input-label col-sm-3 text-end">ID</label>
						<div class="col-sm-8">
							<input type="text" class="input-box form-control" name="user_id" id="login_id">
						</div>
					</div>
					<div class="my-4 row justify-content-center">
						<label class="input-label col-sm-3 text-end">PW</label>
						<div class="col-sm-8">
							<input type="password" class="input-box form-control" name="password" id="password">
						</div>
					</div>
					<div class="col main-second-join-btn-box container row justify-content-center my-5">
						<button type="submit" class="btn btn-primary" style="background-color: #050099; width:220px; margin-top: 15px;"
						 onclick="return loginCheck()">L&nbsp;O&nbsp;G&nbsp;I&nbsp;N</button>
					</div>
					<div style="height: 200px;">
					</div>
				</form>
				
<!-- 				<div class="">
					<p>
						<a role="button" data-bs-toggle="modal"
						 data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">ID찾기</a>&nbsp;|&nbsp; 
						<a role="button" data-bs-toggle="modal"
						 data-bs-target="#exampleModal2" data-bs-whatever="@getbootstrap">PW찾기</a>
					</p>
				</div> -->
				
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
									<select class="form-select" id="authId" name="small_code">
										<option value="1">실시간수문정보관리시스템</option>
										<option value="2">수문시설관리시스템</option>
										<option value="3">관리자</option>
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
										<option value="1">실시간수문정보관리시스템</option>
										<option value="2">수문시설관리시스템</option>
										<option value="3">관리자</option>
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