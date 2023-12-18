<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluicePopHeader.jsp" %>
<%@ include file="../../components/header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수자원 상세정보</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
		document.addEventListener("DOMContentLoaded", (event) => {
			var successMsg = $('#successMsg').val();
			var failMsg = $('#failMsg').val();
			// 성공 메세지가 있을 경우 alert창을 띄우고 팝업창 닫음
			if(successMsg != '' && successMsg != null) {
				alert(successMsg);
				window.self.close();
			}
			// 실패 메시지가 있을 경우 alert창을 띄우고 상세정보 페이지를 다시 보여줌
			if(failMsg != '' && failMsg != null) {
				alert(failMsg);
			}
		})
		
		function updateSujawon() {
			if(confirm("수정하시겠습니까?")) {
				var form = document.getElementById('updateForm');
				form.setAttribute('method','post');
				form.setAttribute('action','sujawonUpdate.do');
				form.submit();
			}
		}
		
		function deleteSujawon() {
			if(confirm("해당 수자원정보를 삭제하시겠습니까?")) {
				var form = document.getElementById('updateForm');
				form.setAttribute('method','post');
				form.setAttribute('action','sujawonDelete.do');
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
		
		<!-- section2 : 수정 폼 -->
		<form id="updateForm">
			<input type="hidden" id="successMsg" value="${successMsg}">
			<input type="hidden" id="failMsg"    value="${failMsg}">
		
			<!-- 입력 -->
			<div class="container">
				<div>
					<label>시설물 코드</label>
					<input type="text" name="siseol_id" id="siseolId" value="${siseol.siseol_id}" readonly>
				</div>
				<div>
					<label>운영기관</label>
					<select name="gigwan_id">
						<c:forEach var="gigwan" items="${gigwanList}">
							<option value="${gigwan.gigwan_id}" ${siseol.gigwan_id == gigwan.gigwan_id? 'selected':''}>
								${gigwan.name}
							</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label>시설물 종류</label>
					<select name="small_code">
						<c:forEach var="type" items="${siseolType}">
							<option value="${type.small_code}" ${siseol.small_code == type.small_code? 'selected':''}>
								${type.content}
							</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label>행정구역</label>
					<select name="district_id">
						<c:forEach var="dist" items="${districtList}">
							<option value="${dist.district_id}" ${siseol.district_id == dist.district_id? 'selected':''}>
								${dist.name}
							</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label>위도</label>
					<input type="text" name="mapy" value="${siseol.mapy}">
				</div>
				<div>
					<label>경도</label>
					<input type="text" name="mapx" value="${siseol.mapx}">
				</div>
				<div>
					<label>주소</label>
					<input type="text" name="address" value="${siseol.address}">
				</div>
			</div>
		
			<!-- 버튼 -->
			<div class="container" style="margin-top: 150px;">
				<button type="button" onclick="updateSujawon()" style="margin: 30px; background-color: #000042; color: white;">수정</button>
				<button type="button" onclick="deleteSujawon()" style="margin: 30px;">삭제</button>
			</div>
			
		</form>
	</div>
</body>
</html>