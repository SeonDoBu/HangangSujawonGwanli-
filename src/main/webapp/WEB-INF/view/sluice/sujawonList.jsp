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
		
		// 검색 url 생성
		function createUrl(page) {
			var url        = "sujawonList.do?";
			var smallCode  = document.querySelector('select[name="small_code"]').value;
			var gigwanId   = document.querySelector('select[name="gigwan_id"]').value;
			var districtId = document.querySelector('select[name="district_id"]').value;
			var siseolId   = document.querySelector('input[name="siseol_id"]').value;
			console.log(smallCode+"&"+gigwanId+"&"+districtId+"&"+siseolId);
			
			var params = {
				small_code:  smallCode,
				gigwan_id:   gigwanId,
				district_id: districtId,
				siseol_id:   siseolId,
				currentPage: page
			};
			
			url = url + Object.entries(params)
				  .filter(([key, value]) => value !== undefined && value !== null && value !== '' && value !== '0') 
				  .map(([key, value]) => key + '=' + value).join('&');
			
			location.href = url;
		}
	</script>
</head>
<body>
	<div class="container col-12" style="margin-left: 200px;">
		<br>
		<!-- section1: 탭 -->
		<div>
			<h1><a href="sujawonList.do" style="text-decoration: none; color: black;">정보</a> | 
				<a href="sujawonStatistics.do" style="text-decoration: none; color: black;">통계</a></h1>
		</div>
		
		<!-- section2: 검색폼 -->
		<div style="border: 1px; black;">
			<form method="get" id="searchForm">
				<input type="hidden" id="msg" value="${msg}">
				<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}">
				
				<div class="container col-12 d-block">
					<label>시설물종류</label>
						<select name="small_code" id="small_code">
							<option value="0">전체</option>
							<c:forEach var="type" items="${siseolType}">
								<option value="${type.small_code}" ${siseol.small_code == type.small_code? 'selected':''}>
									${type.content}
								</option>
							</c:forEach>
						</select>
						
					<label>관리기관</label>
						<select name="gigwan_id">
							<option value="0">전체</option>
							<c:forEach var="gigwan" items="${gigwanList}">
								<option value="${gigwan.gigwan_id}" ${siseol.gigwan_id == gigwan.gigwan_id? 'selected':''}>
									${gigwan.name}
								</option>
							</c:forEach>
					</select>
					
					<label>행정구역</label>
						<select name="district_id" id="district_id">
							<option value="0">전체</option>
							<c:forEach var="dist" items="${districtList}">
								<option value="${dist.district_id}" ${siseol.district_id == dist.district_id? 'selected':''}>
									${dist.name}
								</option>
							</c:forEach>
						</select>
						
					<label>시설물코드</label>
						<input type="text" name="siseol_id" id="siseol_id" value="${siseol.siseol_id != '0'? siseol.siseol_id:''}" placeholder="시설물코드를 입력하세요.">
					<button type="button" onclick="createUrl()" style="background-color: #000042; color: white;">검색</button>
				</div>
			</form>
		</div>
		
		<div class="" style="margin-right: 200px; margin-top: 20px;">
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
						<td><a href="" onclick="detailPopup(this.textContent)">${siseol.siseol_id}</a></td>
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
						<a class="page-link" onclick="createUrl(${page.startPage - page.pageBlock})" aria-label="이전">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<li class="page-item">
						<a class="page-link" onclick="createUrl(${i})">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${page.endPage < page.totalPage}">
					<li class="page-item">
						<a class="page-link" onclick="createUrl(${page.startPage + page.pageBlock})" aria-label="다음">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
			</ul>
		</nav>
		
	</div>
</body>
</html>