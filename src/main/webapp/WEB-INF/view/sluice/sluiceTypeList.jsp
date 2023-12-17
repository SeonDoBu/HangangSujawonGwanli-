<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluiceMapHeader.jsp" %>
<%@ include file="../../components/header.jsp" %>
    
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function locate(){
		
		location.href="sluiceTypeUpdate";
		
	}

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>

<div class="container" style="margin-top:50px; margin-bottom:50px; height:100px; border: solid; 1px; border-color: gray;">
<br>
자료 유형 <select>
<option> 시자료 </option>
<option> 통 계 </option>
</select>

조회 기간 <input type="date"> ~ <input type="date">

<button type="button" class="btn" style="background-color: #000042; color: white;">검색</button>
</div>

<div class="container" style="margin-top:60px; border: solid; 1px; border-color: gray;">
<div class="container" style=""> 
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" aria-current="page" href="#">수위 정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">강우량 정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">유량 정보</a>
  </li>

</ul>

</div>
</div>

<div class="container" style="margin-top:30px; border: 1px; border-color: gray;">

<h1>시자료  </h1>

<h1>관측소 명 :${sluice.name }  </h1>

<br>

(단위: mm) <button type="button" style="float: right; margin-right: 10px;" class="btn btn-secondary">저장</button> 
<button type="button"   onclick="locate()" class="btn" style="background-color: #000042; color: white; margin-right:20px; float: right;" >관리</button>


<br>

<table class="table table-bordered" style="margin-top: 30px;">
  <thead class="table-light">
    <tr>
      <th scope="col" colspan="2">관측일시</th>
      
     <th>0</th>
     <th>1</th>
     <th>2</th>
     <th>3</th>
     <th>4</th>
     <th>5</th>
     <th>6</th>
     <th>7</th>
     <th>8</th>
     <th>9</th>
     <th>10</th>
     <th>11</th>
     <th>12</th>
     <th>13</th>
     <th>14</th>
     <th>15</th>
     <th>16</th>
     <th>17</th>
     <th>18</th>
     <th>19</th>
     <th>20</th>
     <th>21</th>
     <th>22</th>
     <th>23</th>
     
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="obs" items="${ObservDataList}">
    <tr>  
      <td scope="row" colspan="2">${obs.data_ymd }</td>
     		<td>${obs.value00}</td>
			<td>${obs.value01}</td>
			<td>${obs.value02}</td>
			<td>${obs.value03}</td>
			<td>${obs.value04}</td>
			<td>${obs.value05}</td>
			<td>${obs.value06}</td>
			<td>${obs.value07}</td>
			<td>${obs.value08}</td>
			<td>${obs.value09}</td>
			<td>${obs.value10}</td>
			<td>${obs.value11}</td>
			<td>${obs.value12}</td>
			<td>${obs.value13}</td>
			<td>${obs.value14}</td>
			<td>${obs.value15}</td>
			<td>${obs.value16}</td>
			<td>${obs.value17}</td>
			<td>${obs.value18}</td>
			<td>${obs.value19}</td>
			<td>${obs.value20}</td>
			<td>${obs.value21}</td>
			<td>${obs.value22}</td>
			<td>${obs.value23}</td>
    </tr>
 	</c:forEach>
  </tbody>
</table>

</div>
<div  >
<nav aria-label="Page navigation example text-center" style="margin-top: 20px; margin-left: 200px;">
			<ul class="pagination">
				<c:if test="${page.startPage > page.pageBlock}">
					<li class="page-item">
		
						<a class="page-link" href="ObservDataList?currentPage=${page.startPage - page.pageBlock}&sluice_id=${sluice.sluice_id }&type=${ObservData.type}" aria-label="이전">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<li class="page-item">
						<a class="page-link" href="ObservDataList?currentPage=${i}&sluice_id=${sluice.sluice_id }&type=${ObservData.type}">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${page.endPage < page.totalPage}">
					<li class="page-item">
						<a class="page-link" href="ObservDataList?currentPage=${page.startPage + page.pageBlock}&sluice_id=${sluice.sluice_id }&type=${ObservData.type}" aria-label="다음">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
			</ul>
		</nav>

</div>

</div>














</body>
</html>