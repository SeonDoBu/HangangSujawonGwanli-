<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/components/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function closeWindow() {
	    window.close();
	}
</script>
</head>
<body>
	<div class="container main-find-box">
		<div class="row row-cols-1 main-find-md-box">
			<div class="col main-find-title-box">
				<c:choose>
					<c:when test="${searchPw eq 1}">
						<p>PW&nbsp;찾기</p>
					</c:when>
					<c:otherwise>
						<p>ID&nbsp;찾기</p>
					</c:otherwise>
				</c:choose>
			</div>
			<c:if test="${searchPw eq 1}">
				<div class="row row-cols-2 main-find-id-box">
					<div class="col main-find-id-first">
						<p>ID</p>
					</div>
					<div class="col main-find-id-second">
						<input type="text" name="id">
					</div>
				</div>
			</c:if>
			<div class="row row-cols-2 main-find-auth-box">
				<div class="col main-find-auth-first">
					<p>권한</p>
				</div>
				<div class="col main-find-auth-second">
					<select>
						<option>권한1</option>
						<option>권한2</option>
						<option>관리자</option>
					</select>
				</div>
			</div>
			<div class="row row-cols-2 main-find-name-box">
				<div class="col main-find-name-first">
					<p>성명</p>
				</div>
				<div class="col main-find-name-second">
					<input type="text" name="name">
				</div>
			</div>
			<div class="row row-cols-2 main-find-email-box">
				<div class="col main-find-email-first">
					<p>EMAIL</p>
				</div>
				<div class="col main-find-email-second">
					<input type="text" name="email">
				</div>
			</div>
			<div class="row row-cols-2 main-find-btn-box">
				<button class="main-find-btn-first" type="submit">확인</button>
				<button class="main-find-btn-second" onclick="closeWindow()">취소</button>
			</div>
		</div>
	</div>
</body>
</html>