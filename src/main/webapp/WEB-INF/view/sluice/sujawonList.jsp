<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sluiceMapHeader.jsp" %>
<%@ include file="../../components/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수자원정보 목록</title>
</head>
<body>
	<div class="container col-10">
		<br>
		<!-- section1: 탭 -->
		<h1><a>정보</a> | <a>통계</a></h1>
		
		<!-- section2: 검색폼 -->
		<div style="border: 1px; black;">
			<form action="">
				<div class="container col-12 d-block">
					<label>시설물종류</label>
						<select name="small_code">
							<option value="999">전체</option>
							<c:forEach var="type" items="${siseolType}">
								<option value="${type.small_code}">${type.content}</option>
							</c:forEach>
						</select>
					<label>관리기관</label>
						<select>
							<option value="">전체</option>
						</select>
					<label>행정구역</label>
						<select name="district_id">
							<option value="">전체</option>
							<c:forEach var="dist" items="${districtList}">
								<option value="${dist.district_id}">${dist.name}</option>
							</c:forEach>
						</select>
					<label>시설물코드</label>
						<input form="text" name="keyword" placeholder="시설물코드를 입력하세요.">
					<button type="button" style="background-color: #000042; color: white;">검색</button>
				</div>
			</form>
		</div>
		
		<div class="text-end" style="margin-right: 200px; margin-top: 20px;">
			<button type="button" style="background-color: #000042; color: white;" onclick="showpopup()">등록</button>
			<button type="button" style="background-color: gray;">저장</button>
		</div>
		
		<!-- section3: 목록 테이블 -->
		<table class="table" style="margin-top: 30px; width: 900px;">
			<thead class="table-light">
				<tr>
					<th scope="col">연번</th>
					<th scope="col">시설물종류</th>
					<th scope="col">시설물코드</th>
					<th scope="col">위도</th>
					<th scope="col">경도</th>
					<th scope="col">행정구역</th>
					<th scope="col">관리기관</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:if test="${siseolList.size() == 0}"><td colspan="7">해당하는 시설물이 없습니다.</td></c:if>
				<c:set var="num" value="1"/> <!-- todo: ${page.start}로 바꾸기 -->
				<c:forEach var="siseol" items="${siseolList}">
					<tr>
						<td>${num}</td>
						<td>${siseol.small_code}</td> <!-- todo: content로 바꾸기 -->
						<td>${siseol.siseol_id}</td>
						<td>${siseol.mapy}</td>
						<td>${siseol.mapx}</td>
						<td>${siseol.district_id}</td> <!-- todo: content로 바꾸기 -->
						<td>${siseol.gigwan_id}</td> <!-- todo: name으로 바꾸기 -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>