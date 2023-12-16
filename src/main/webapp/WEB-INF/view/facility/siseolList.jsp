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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 	function submitForm() {
		 // 폼 요소 가져오기
        var form = document.getElementById("frm");

        // 모든 파라미터를 제거
        var smallCodeInput = form.querySelector('select[name="small_code"]');
        var districtIdInput = form.querySelector('select[name="district_id"]');
        var gigwanIdInput = form.querySelector('select[name="gigwan_id"]');
        var siseolIdInput = form.querySelector('input[name="siseol_id"]');
		
	 	// 선택된 옵션 값 가져오기
        var form = document.getElementById("frm");
	    var smallCode = $('#small_code2').val();
	    var districtId = $('#district_id2').val();
		var gigwanId = $('#gigwan_id2').val();
	    var siseolId = $('#siseol_id2').val();
	    
	    // "전체" 옵션인 경우 해당 파라미터 제외
	    if (smallCode === "전체") {
	    	// small_code 파라미터 제거
	    	smallCodeInput.remove();
	    }
	    if (districtId === "전체") {
	    	 districtIdInput.remove();
	    }
	    if (gigwanId === "전체") {
	    	gigwanIdInput.remove();
	    }
	    if (siseolId === "") {
	    	siseolIdInput.remove();
	    }
	    
	    // 폼 서밋
	    form.submit();
	}
	
 	function navigatePage(currentPage) {
	    var params = [];
	
	    var smallCode = $('#small_code2').val();
	    var districtId = $('#district_id2').val();
	    var gigwanId = $('#gigwan_id2').val();
	    var siseolId = $('#siseol_id2').val();
	
	    if (smallCode && smallCode !== "전체") {
	      params.push("small_code=" + encodeURIComponent(smallCode));
	    }
	    if (districtId && districtId !== "전체") {
	      params.push("district_id=" + encodeURIComponent(districtId));
	    }
	    if (gigwanId && gigwanId !== "전체") {
	      params.push("gigwan_id=" + encodeURIComponent(gigwanId));
	    }
	    if (siseolId && siseolId !== "0") {
	      params.push("siseol_id=" + encodeURIComponent(siseolId));
	    }
	
	    if (params.length > 0) {
	      var paramString = params.join("&");
	      location.href = "siseoulList.do?currentPage=" + currentPage + "&" + paramString;
	    } else {
	      location.href = "siseoulList.do?currentPage=" + currentPage;
	    }
	}
 	
	
	function chk() {
		return false;
	}
</script>
</head>
<body>
	
	<div id="con">
	 <div class="card card-product ">
        <div class="card-body py-8 ">
			<form action="siseoulList.do" id="frm" onsubmit="return chk()">
				<input type="hidden" name="big_code" value="${commonList[0].big_code}"> 
				<div id="con-text">
					시설물 종류 : 	
					<select name="small_code" id="small_code2">
						<option selected>전체</option>
						<c:forEach var="list" items="${commonList}">
							<option <c:if test ="${siseol.small_code eq list.small_code}"> selected="selected"</c:if>
							value="${list.small_code}">${list.content}</option>
						</c:forEach>
					</select>&nbsp;&nbsp;&nbsp;
					
					행정구역 : 
					<select name="district_id" id="district_id2">
						<option selected>전체</option>
						<c:forEach var="list" items="${districtList}">
							<option <c:if test ="${siseol.district_id eq list.district_id}"> selected="selected"</c:if>
							value="${list.district_id}">${list.name}</option>
						</c:forEach>
					</select>&nbsp;&nbsp;&nbsp;
					
					관리기관 : 
					<select name="gigwan_id" id="gigwan_id2">
						<option selected>전체</option>
						<c:forEach var="list" items="${gigwanList}">
							<option 
							<c:if test ="${siseol.gigwan_id eq list.gigwan_id}"> selected="selected"</c:if>value="${list.gigwan_id}">${list.name}</option>
						</c:forEach>
					</select>&nbsp;&nbsp;&nbsp;
					
					시설물 코드 : 
					<input type="text" <c:if test="${siseol.siseol_id != '0'}">value="${siseol.siseol_id}"</c:if>
					name="siseol_id" id="siseol_id2"  style="width: 120px;">

					&nbsp;&nbsp;
					<button style="background: #191D31; color: white;"  onclick="submitForm()">검색</button>
					<!-- <input type="submit"  style="background: #191D31; color: white;"  value="검색"> -->
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
						<!-- <button style="background: white; color: #191D31; border-radius: 5px;">입력</button> -->
					 <button style="background: white; color: #191D31; border-radius: 5px;"><a href="siseoulWriteForm.do?siseol_id=${list.siseol_id}" style="text-decoration: none; color: #000;">입력</a></button>
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
				<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="navigatePage(${page.startPage-page.pageBlock})">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
				<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="navigatePage(${i})">${i}</a></li>
			</c:forEach>
			<c:if test="${page.endPage < page.totalPage}">
				<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="navigatePage(${page.startPage+page.pageBlock})">다음</a></li>
			</c:if>
		</ul>
	  </nav>
	</div>
	
</body>
</html>