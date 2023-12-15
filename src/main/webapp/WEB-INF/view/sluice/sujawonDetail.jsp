<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluicePopHeader.jsp" %>
<%@ include file="../../components/header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수자원 상세정보</title>
</head>
<body>
	<div class="container" style="margin-top:50px; border: solid; 1px; border-color: black;">
		<!-- section1 : 타이틀 -->
		<div><h1 style="margin-top: 10px;">수자원정보</h1></div>
		<hr style="border-style: 3px;">
		
		<!-- section2 : 수정 폼 -->
		<div class="container">
			<div>
				<label>시설물 코드</label>
				<input type="text" name="siseol_id" value="${siseol.siseol_id}" readonly>
			</div>
			<div>
				<label>운영기관</label>
				<input type="text" name="gigwanName" value="${siseol.gigwanName}">
			</div>
			<div>
				<label>시설물 종류</label>
				<input type="text" name="siseolName" value="${siseol.siseolName}">
			</div>
			<div>
				<label>행정구역</label>
				<input type="text" name="districtName" value="${siseol.districtName}">
			</div>
			<div>
				<label>위도</label>
				<input type="text" name="mapy" value="${siseol.mapy}">
			</div>
			<div>
				<label>경도</label>
				<input type="text" name="mapx" value="${siseol.mapx}">
			</div>
		</div>
		
		<!-- section3: 버튼 -->
		<div class="container" style="margin-top: 150px;">
			<button type="button" style="margin: 30px; background-color: #000042; color: white;">수정</button>
			<button type="button" style="margin: 30px;">삭제</button>
		</div>
	</div>
</body>
</html>