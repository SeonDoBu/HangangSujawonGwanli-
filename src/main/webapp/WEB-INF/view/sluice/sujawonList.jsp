<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluiceMapHeader.jsp" %>
<%@ include file="../../components/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수자원정보 목록</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		
		document.addEventListener("DOMContentLoaded", (event) => {
			var msg = $('#msg').val();
			if(msg != '' && msg != null) {
				alert(msg);
				window.self.close();
			}
		})
		
		// 상세정보 조회 팝업 실행
		function detailPopup(siseolId) {
			var url = 'sujawonDetail.do?siseolId='+siseolId;
			var windowStatus = 'width=900, height=750, left=350, top=200';
			
			window.open(url, 'detailPopup', windowStatus);
		}
		
		// 정보 등록 팝업 실행
		function insertPopup() {
			var url = 'sujawonInsertForm.do';
			var windowStatus = 'width=900, height=750, left=350, top=200';
			
			window.open(url, 'insertPopup', windowStatus);
		}
	</script>
</head>
<body>
	<div class="container col-10">
		<br>
		<!-- section1: 탭 -->
		<h1><a href="sujawonList.do">정보</a> | <a href="sujawonStatistics.do">통계</a></h1>
		
		<!-- section2: 검색폼 -->
		<div style="border: 1px; black;">
			<form action="">
				<input type="hidden" id="msg" value="${msg}">
				
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
							<option value="0">전체</option>
						</select>
					<label>행정구역</label>
						<select name="district_id">
							<option value="0">전체</option>
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
			<button type="button" style="background-color: #000042; color: white;" onclick="insertPopup()">등록</button>
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
				<c:set var="num" value="${page.start}"/>
				<c:forEach var="siseol" items="${siseolList}">
					<tr>
						<td>${num}</td>
						<td><input type="hidden" name="small_code" value="${siseol.small_code}">${siseol.siseolName}</td>
						<td><a onclick="detailPopup(this.textContent)">${siseol.siseol_id}</a></td>
						<td>${siseol.mapy}</td>
						<td>${siseol.mapx}</td>
						<td><input type="hidden" name="district_id" value="${siseol.district_id}">${siseol.districtName}</td>
						<td><input type="hidden" name="gigwan_id" value="${siseol.gigwan_id}">${siseol.gigwanName}</td>
					</tr>
					<c:set var="num" value="${num + 1}"/>
				</c:forEach>
			</tbody>
		</table>
		
		<nav aria-label="Page navigation example text-center" style="margin-top: 20px; margin-left: 200px;">
			<ul class="pagination">
				<c:if test="${page.startPage > page.pageBlock}">
					<li class="page-item">
						<a class="page-link" href="sujawonList.do?currentPage=${page.startPage - page.pageBlock}" aria-label="이전">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<li class="page-item">
						<a class="page-link" href="sujawonList.do?currentPage=${i}">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${page.endPage < page.totalPage}">
					<li class="page-item">
						<a class="page-link" href="sujawonList.do?currentPage=${page.startPage + page.pageBlock}" aria-label="다음">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
			</ul>
		</nav>
		
	</div>
</body>
</html>