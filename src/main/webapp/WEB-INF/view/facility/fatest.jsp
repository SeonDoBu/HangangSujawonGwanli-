<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../facilityStat/faheader.jsp" %>    

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
</head>
<body>
	
	<div id="con">
	 <div class="card card-product ">
        <div class="card-body py-8 ">
			<form action="#">
				<div id="con-text">
					시설물 종류 : 	
					<select name="">
						<option selected>전체</option>
						<option>댐</option>
						<option>저수지</option>
						<option>펌프장</option>
						<option>관개수로</option>
					</select>&nbsp;&nbsp;&nbsp;
					
					행정구역 : 
					<select>
						<option>신림동</option>
						<option></option>
						<option></option>
					</select>&nbsp;&nbsp;&nbsp;
					
					시설물 명칭 : 
					<input type="text" value="" placeholder="XXXXXXX" style="width: 80px;">
					&nbsp;&nbsp;&nbsp;
					
					시설물 코드 : 
					<input type="text" value="" placeholder="XXXXXXXXX" style="width: 120px;">

					&nbsp;&nbsp;
					<button style="background: #191D31; color: white;">검색</button>
					
				</div>	
			</form>
		  </div>
	   </div>	
	</div>
	
	<div id="con-table">
		 <table class="table">
		   <thead class="table-light">
			<tr>
				<th>연번</th>
				<th>시설물 종류</th>
				<th>시설물 코드</th>
				<th>1급 행정구역</th>
				<th>2급 행정구역</th>
				<th>관리기관</th>
				<th>결과작성</th>
			</tr>
			</thead>
			 <tbody>
			<tr>
				<td>1</td>
				<td>...</td>
				<td>XXXXXXXXXXX</td>
				<td>...</td>
				<td>...</td>
				<td>...</td>
				<td>
					<button style="background: white; color: #191D31; border-radius: 5px;">입력</button>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	
	
	<div id="page">
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item"><a class="page-link" href="#">이전</a></li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item"><a class="page-link" href="#">다음</a></li>
	  </ul>
	</nav>
	</div>

	

</body>
</html>