<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluicePopHeader.jsp" %>
<%@ include file="../../components/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수자원정보 등록</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
		document.addEventListener("DOMContentLoaded", (event) => {
			var msg = $('#msg').val();
			// 메세지가 있을 경우 alert창을 띄우고 팝업창 닫음
			if(msg != '' && msg != null) {
				alert(msg);
				window.self.close();
			}
		})
		
		function insertSujawon() {
			if(confirm('등록하시겠습니까?')) {
				var form = document.getElementById('submitForm');
				form.method = 'post';
				form.action = 'sujawonInsert.do';
				form.submit();
			}
		}
	</script>
</head>
<body>
	<div class="container" style="margin-top:50px; border: solid; 1px; border-color: black;">
		<!-- section1 : 타이틀 -->
		<div><h1 style="margin-top: 10px;">수자원정보</h1></div>
		<hr style="border-style: 3px;">
		
		<!-- section2 : 입력 폼 -->
		<form id="submitForm">
			<input type="hidden" id="msg" value="${msg}">
		
			<!-- 입력 -->
			<div class="container">
				<div>
					<label>시설물 코드</label>
					<input type="text" name="siseol_id">
				</div>
				<div>
					<label>운영기관</label>
					<select name="gigwan_id">
						<c:forEach var="gigwan" items="${gigwanList}">
							<option value="${gigwan.gigwan_id}">${gigwan.name}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label>시설물 종류</label>
					<select name="small_code">
						<c:forEach var="type" items="${siseolType}">
							<option value="${type.small_code}">${type.content}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label>행정구역</label>
					<select name="district_id">
						<option value="0">전체</option>
						<c:forEach var="dist" items="${districtList}">
							<option value="${dist.district_id}">${dist.name}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label>위도</label>
					<input type="text" name="mapy">
				</div>
				<div>
					<label>경도</label>
					<input type="text" name="mapx">
				</div>
				<div>
					<label>주소</label>
					<input type="text" name="address">
				</div>
			</div>
		
			<!-- 버튼 -->
			<div class="container" style="margin-top: 150px;">
				<button type="button" onclick="insertSujawon()" style="margin: 30px; background-color: #000042; color: white;">등록</button>
			</div>
			
		</form>
	</div>
</body>
</html>