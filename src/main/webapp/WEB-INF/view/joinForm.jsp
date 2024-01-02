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
		location.href = 'join.do';
    }
    
    function checkDuplicateId() {
    	const id = document.getElementById('id').value;
    	
    	$.ajax({
    		url: "checkDuplicateId",
    		method: "POST",
    		data: {id : id},
    		success: function(msg) {
    			console.log(msg);
    			alert(msg);
    		},
    		error: function() {
    			alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
    		}
    	})
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
        
        if (pw.value === "") {
            alert("PW를 입력해주세요.");
            pw.focus();
            return false;
        }
        
        if (pw2.value === "") {
            alert("PW재확인을 입력해주세요.");
            pw2.focus();
            return false;
        }
        
        if (pw2.value !== "") {
            alert("PW가 일치하지 않습니다.");
            pw2.focus();
            return false;
        }
        
        if (name.value === "") {
            alert("성명을 입력해주세요.");
            name.focus();
            return false;
        }
        
        if (email.value === "") {
            alert("EMAIL을 입력해주세요.");
            email.focus();
            return false;
        }
        
        if (tel.value === "") {
            alert("TEL을 입력해주세요.");
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
						<select name="small_code">
							<option value="1">실시간수문관리</option>
							<option value="2">수자원시설물관리</option>
							<option value="3">관리자</option>
						</select>
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>ID</p>
					</div>
					<div class="col-4 main-join-auth-second">
						<input type="text" name="user_id" id="id">
					</div>
					<div class="col-2 mx-4">
						<button type="button" id="checkId" onclick="checkDuplicateId()">중복체크</button>
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>PW</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="password" name="password" id="pw">
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>PW재확인</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="password" id="pw2">
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>성명</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="text" name="user_name" id="name">
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>EMAIL</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="email" name="email" id="email" placeholder="xxxx1234@xxxx.com">
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>TEL</p>
					</div>
					<div class="col main-join-auth-second">
						<input type="text" name="tel" id="tel" placeholder="000 - 0000 - 0000">
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>기관명</p>
					</div>
					<div class="col main-join-auth-second">
						<select name="gigwan_id">
							<c:forEach var="gigwan" items="${gigwanList}">
								<option value="${gigwan.gigwan_id}">${gigwan.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>소속부서</p>
					</div>
					<div class="col main-join-auth-second">
						<select name="dept">
							<option value="개발부">개발부</option>
							<option value="글로벌사업본부">글로벌사업본부</option>
							<option value="기술본부">기술본부</option>
							<option value="연구부">연구부</option>
							<option value="홍보부">홍보부</option>
							<option value="환경에너지본부">환경에너지본부</option>
						</select>
					</div>
				</div>
				<div class="row row-cols-2 main-join-auth-box">
					<div class="col main-join-auth-first">
						<p>직급</p>
					</div>
					<div class="col main-join-auth-second">
						<select name="position">
							<option value="부장">부장</option>
							<option value="차장">차장</option>
							<option value="과장">과장</option>
							<option value="대리">대리</option>
							<option value="주임">주임</option>
							<option value="사원">사원</option>
						</select>
					</div>
				</div>
				<div class="col main-second-join-btn-box">
					<button type="submit" onclick="return checkJoinForm()">회원가입</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>