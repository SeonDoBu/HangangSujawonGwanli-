<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/components/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#checkId {
		width: 110px;
		height: 40px;
		border: 2px solid #002266;
		border-radius: 8px;
		background-color: #002266;
		font-size: 16px;
		font-weight: bold;
		color: white;
	}
	
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function pageMove(id) {
		console.log("실행");
		if (id === 1) {
			location.href = 'info.do';
		} else {
			location.href = 'notice.do';
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
    
    function checkDuplicateId() {
    	const idInput  = document.getElementById("id");
    	const message  = document.getElementById("idValidationMsg");
    	const id       = idInput.value;
    	var checkIdVal = document.getElementById('checkIdVal'); // 중복체크 여부
    	const reg_id   = /^[A-Za-z0-9][A-Za-z0-9]*$/; // 아이디 형식 체크
    	const reg_spc  = /\s/; // 공백 체크
    	
    	if(id.length >= 4 && id.length <= 16 && reg_id.test(id) && !reg_spc.test(id)) {
        	$.ajax({
            	url: "checkDuplicateId",
            	method: "GET",
            	data: {id : id},
            	success: function(msg) {
            		console.log(msg);
            		if(msg == "0") {
            			alert("사용 가능한 아이디입니다.");
            			checkIdVal.value = "1";
                    	idInput.classList.add("is-valid");
                    	idInput.classList.remove("is-invalid");
            		} else {
            			alert("사용할 수 없는 아이디입니다.");
            			checkIdVal.value = "0";
            		}
            	},
            	error: function() {
            		alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
            	}
            })
            	
    	} else {
        	idInput.classList.add("is-invalid");
        	idInput.classList.remove("is-valid");
        	message.textContent = "올바르지 않은 형식의 아이디입니다.";
    	}
    	
    }
    
    let strength = 0; // 패스워드 강도를 나타내는 변수
    
    function checkPasswordStrength() {
    	strength = 0;
        const passwordInput = document.getElementById("pw");
        const message = document.getElementById("pwStrengthMsg");
        const password = passwordInput.value;

        const lengthRegex = /^.{8,25}$/; // 자릿수를 체크하는 정규표현식
        const uppercaseRegex = /[A-Z]/; // 영문 대문자가 포함되어 있는지를 체크하는 정규표현식
        const lowercaseRegex = /[a-z]/; // 영문 소문자가 포함되어 있는지를 체크하는 정규표현식
        const numberRegex = /[0-9]/; // 숫자가 포함되어 있는지를 체크하는 정규표현식
        const specialCharRegex = /[\W_]/; // 특수문자가 포함되어 있는지를 체크하는 정규표현식
        const reg_spc = /\s/; // 공백 체크
        
        if (lengthRegex.test(password) && !reg_spc.test(password)) {
        	passwordInput.classList.add("is-invalid");
            passwordInput.classList.remove("is-valid");
            message.textContent = "패스워드는 8~25자리로, 공백이 없어야 합니다.";
        }
        if (password.length >= 15) {
        	strength++;
        }
        if (uppercaseRegex.test(password)) {
        	strength++;
        }
        if (lowercaseRegex.test(password)) {
        	strength++;
        }
        if (numberRegex.test(password)) {
        	strength++;
        }
        if (specialCharRegex.test(password)) {
        	strength++;
        }
        // 강도에 따라 메시지 업데이트
        if (strength == 5) {
            passwordInput.classList.add("is-valid");
            passwordInput.classList.remove("is-invalid");
            message.textContent = "보안강도 : 강함";
        } else if (strength >= 3 && strength < 5) {
            passwordInput.classList.add("is-valid");
            passwordInput.classList.remove("is-invalid");
            message.textContent = "보안강도 : 보통";
        } else {
            passwordInput.classList.add("is-invalid");
            passwordInput.classList.remove("is-valid");
            message.textContent = "보안강도 : 약함";
        }
        console.log(strength);
    }

    function checkPasswordMatch() {
        const pwd = document.getElementById("pw");
        const re_pwd = document.getElementById("pw2");
        const message = document.getElementById("pwMatchMsg");

        if (pwd.value === re_pwd.value) {
        	re_pwd.classList.add("is-valid");
        	re_pwd.classList.remove("is-invalid");
            message.textContent = "패스워드가 일치합니다.";
        } else {
        	re_pwd.classList.add("is-invalid");
        	re_pwd.classList.remove("is-valid");
            message.textContent = "패스워드가 일치하지 않습니다.";
        }
    }

    
    function checkJoinForm() {
    	const id    = document.getElementById('id');
    	const pw    = document.getElementById('pw');
    	const pw2   = document.getElementById('pw2');
    	const name  = document.getElementById('name');
    	const email = document.getElementById('email');
    	const tel   = document.getElementById('tel');
    	
        if (id.value === "") {
            alert("ID를 입력해주세요.");
			id.focus();
            return false;
        }
        
        if (document.getElementById('checkIdVal').value !== "1") {
        	alert("ID 중복체크를 해주세요.");
        	id.focus();
        	return false;
        }
        
        if (pw.value === "") {
            alert("PW를 입력해주세요.");
            pw.focus();
            return false;
        }
        
        if (strength < 3) {
        	alert("보안이 약한 수준의 PW입니다.");
        	pw2.focus();
        	return false;
        }
        
        if (pw2.value === "") {
            alert("PW재확인을 입력해주세요.");
            pw2.focus();
            return false;
        }
        
        if (pw2.value !== pw.value) {
            alert("PW가 일치하지 않습니다.");
            pw2.focus();
            return false;
        }
        
        if (name.value === "") {
            alert("성명을 입력해주세요.");
            name.focus();
            return false;
        }
        
        const reg_name = /^[가-힣]+$/;
        if (!reg_name.test(name.value)) {
        	alert("성명은 한글로 입력해주세요.");
        	name.focus();
        	return false;
        }
        
        if (email.value === "") {
            alert("EMAIL을 입력해주세요.");
            email.focus();
            return false;
        }
        
        const reg_email = /^[A-Za-z-0-9\-\.]+@[A-Ja-z-0-9\-\.]+\.[A-Ja-z-0-9]+$/;
        if (!reg_email.test(email.value)) {
        	alert("이메일 형식을 확인해주세요.");
        	email.focus();
        	return false;
        }
        
        if (tel.value === "") {
            alert("TEL을 입력해주세요.");
            tel.focus();
            return false;
        }
        
        const reg_tel = /^\d{2,3}-\d{3,4}-\d{4}$/;
        if (!reg_tel.test(tel.value)) {
        	alert("전화번호 형식을 확인해주세요.");
        	tel.focus();
        	return false;
        }
        
    	// 모두 입력된 경우
    	if(confirm('가입하시겠습니까?')) {
    		return true;	
    	} else {
    		return false;
    	}
    }

</script>
</head>
<body>
	<div class="container main-container" style="height: 1000px;">
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
			<div class="row row-cols-1 main-second-box" style="height: 1000px;">
				<div class="col main-second-title-box">
					<p>
						<a onclick="loginLink()">로그인</a>&nbsp;&nbsp;&nbsp; <span><a
							onclick="signupLink()">회원가입</a></span>
					</p>
				</div>
				<form action="join.do" method="post">
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
						<!-- 	<input type="text" name="user_id" id="id" class="input-box form-control" style="width: 220px;"> -->
							<div class="d-flex" style="width: 110px;">
							<input type="text" name="user_id" id="id" class="input-box form-control" style="width: 220px;">
								<button type="button" id="checkId" onclick="checkDuplicateId()" class="col-sm-1 mx-1" style="height: 46px;">중복체크</button>
								<input type="hidden" id="checkIdVal" value="0">
							</div>			
							<p id="idValidationMsg" style="margin-bottom: 0px;">*영어 소문자 및 숫자로 이루어진 4~16자리</p>
						</div>
					</div>
					
					<div class="my-4 row justify-content-center">
						<label class="input-label col-sm-3 text-end">PW</label>
						<div class="col-sm-8">
							<input type="password" name="password" id="pw" class="input-box form-control"
							 oninput="checkPasswordStrength()">
							<p id="pwStrengthMsg" style="margin-bottom: 0px;">*8~25자리, 알파벳 대소문자, 숫자, 특수문자 중 <br>2가지 이상 포함</p>
						</div>
					</div>
					
					<div class="my-4 row justify-content-center">
						<label class="input-label col-sm-3 text-end">PW 재확인</label>
						<div class="col-sm-8">
							<input type="password" id="pw2" class="input-box form-control"
							 oninput="checkPasswordMatch()" placeholder="패스워드를 한 번 더 입력해주세요.">
							<p id="pwMatchMsg" style="margin-bottom: 0px;"></p>
						</div>
					</div>
					
					<div class="my-4 row justify-content-center">
						<label class="input-label col-sm-3 text-end">성명</label>
						<div class="col-sm-8">
							<input type="text" name="name" id="name" class="input-box form-control">
						</div>
					</div>
					
					<div class="my-4 row justify-content-center">
						<label class="input-label col-sm-3 text-end">EMAIL</label>
						<div class="col-sm-8">
							<input type="email" name="email" id="email" class="input-box form-control"
							 placeholder="example123@xxxx.com">
						</div>
					</div>
					
					<div class="my-4 row justify-content-center">
						<label class="input-label col-sm-3 text-end">TEL</label>
						<div class="col-sm-8">
							<input type="tel" name="tel" id="tel" class="input-box form-control"
							 placeholder="000 - 0000 - 0000">
						</div>
					</div>
					
					<div class="my-4 row justify-content-center">
						<label class="input-label col-sm-3 text-end">기관명</label>
						<div class="col-sm-8">
							<select name="gigwan_id" class="input-box form-select">
								<c:forEach var="gigwan" items="${gigwanList}">
									<option value="${gigwan.gigwan_id}">${gigwan.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="my-4 row justify-content-center">
						<label class="input-label col-sm-3 text-end">소속부서</label>
						<div class="col-sm-8">
							<select name="dept" class="input-box form-select">
								<option value="개발부">개발부</option>
								<option value="글로벌사업본부">글로벌사업본부</option>
								<option value="기술본부">기술본부</option>
								<option value="연구부">연구부</option>
								<option value="홍보부">홍보부</option>
								<option value="환경에너지본부">환경에너지본부</option>
							</select>
						</div>
					</div>

					<div class="my-4 row justify-content-center">
						<label class="input-label col-sm-3 text-end">직급</label>
						<div class="col-sm-8">
							<select name="position" class="input-box form-select">
								<option value="부장">부장</option>
								<option value="차장">차장</option>
								<option value="과장">과장</option>
								<option value="대리">대리</option>
								<option value="주임">주임</option>
								<option value="사원">사원</option>
							</select>
						</div>
					</div>
					
					<div class="col main-second-join-btn-box container row justify-content-center my-5">
						<button type="submit" onclick="return checkJoinForm()" style="margin-top: 3px;">회원가입</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>