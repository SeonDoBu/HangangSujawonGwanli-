<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../facilityStat/faheader.jsp" %>
<%@ include file="/WEB-INF/components/header.jsp"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	/* 검색 카드 */	
	#con{ 
		margin: 50px;
		border: solid 2px;
		border-radius: 10px; 
	}
	/* 검색 카드  내용*/	
	#con-text{
		margin-top: 10px;
		margin-bottom: 10px;
		font-weight: bold;
	}
	/* 테이블 */	
	#con-table{
		margin: 50px;
		text-align: center;
		border-top: solid 2px;
	}
	
	#page {
    text-align: center;
    margin: 50px;
	}

</style>
<script type="text/javascript">
	function submitForm() {
	    // 선택된 옵션 값 가져오기
	    var smallCode = document.getElementById("smallCodeSelect").value;
	    var districtId = document.getElementById("districtSelect").value;
	    var gigwanId = document.getElementById("gigwanSelect").value;
	    var siseolId = document.getElementsByName("siseol_id")[0].value;
	    alert("시작한다.")
	    
	    // "전체" 옵션인 경우 해당 파라미터 제외
	    if (smallCode === "전체") {
	        document.getElementById("searchForm").removeChild(document.getElementById("smallCodeSelect"));
	    }
	    if (districtId === "전체") {
	        document.getElementById("searchForm").removeChild(document.getElementById("districtSelect"));
	    }
	    if (gigwanId === "전체") {
	        document.getElementById("searchForm").removeChild(document.getElementById("gigwanSelect"));
	    }
	    
	    // 폼 서밋
	    document.getElementById("searchForm").submit();
	}
</script>
</head>
<body>
	
	<div id="con">
	 <div class="card card-product ">
        <div class="card-body py-8 ">
			<form action="selectedSiseolList.do" id="searchForm">
				<div id="con-text">
					시설물 종류 : 	
					<select name="small_code">
						<option selected>전체</option>
						<c:forEach var="list" items="${commonList}">
							<option value="${list.small_code}">${list.content}</option>
						</c:forEach>
					</select>&nbsp;&nbsp;&nbsp;
					
					행정구역 : 
					<select name="district_id">
						<option selected>전체</option>
						<c:forEach var="list" items="${districtList}">
							<option value="${list.district_id}">${list.name}</option>
						</c:forEach>
					</select>&nbsp;&nbsp;&nbsp;
					
					관리기관 : 
					<select name="gigwan_id">
						<option selected>전체</option>
						<c:forEach var="list" items="${gigwanList}">
							<option value="${list.gigwan_id}">${list.name}</option>
						</c:forEach>
					</select>&nbsp;&nbsp;&nbsp;
					
					시설물 코드 : 
					<input type="text" name="siseol_id"  placeholder="XXXXXXXXX" style="width: 120px;">

					&nbsp;&nbsp;
					<button style="background: #191D31; color: white;" type="button" onclick="submitForm()">검색</button>
				</div>	
			</form>
		  </div>
	   </div>	
	</div>
	
	<div id="con-table">
		 <table class="table">
		   <thead class="table-light">
			<tr>
				<th>번호</th>
				<th>시설물 종류</th>
				<th>시설물 코드</th>
				<th>행정구역</th>
				<th>관리기관</th>
				<th>결과작성</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="list" items="${siseolList}" varStatus="status">
				<tr>
					<td>${status.index + 1 + (page.currentPage - 1) * page.rowPage}</td>
					<td>${list.siseolName}</td>
					<td>${list.siseol_id}</td>
					<td>${list.districtName}</td>
					<td>${list.gigwanName}</td>
					<td>
						<button style="background: white; color: #191D31; border-radius: 5px;">입력</button>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	<div id="page" style="text-align: center;">
	  <nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page.startPage > page.pageBlock}">
				<li class="page-item"><a class="page-link" href="siseoulList.do?currentPage=${page.startPage-page.pageBlock}">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
				<li class="page-item"><a class="page-link" href="siseoulList.do?currentPage=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${page.endPage < page.totalPage}">
				<li class="page-item"><a class="page-link" href="siseoulList.do?currentPage=${page.startPage+page.pageBlock}">다음</a></li>
			</c:if>
		</ul>
	  </nav>
	</div>
	
</body>
</html>