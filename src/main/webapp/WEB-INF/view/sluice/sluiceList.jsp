<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluiceMapHeader.jsp" %>
<%@ include file="../../components/header.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
 
window.close();

 
 function showpopup(){
	 window.open("sluiceInsert","pop","width=900,height=750,left=350,top=200");
	 
 }

 function showpopDetail(slu){
	
/* 	 	alert("체크1"+$("#chk1")+${sluice.sluice_id});
	 var slu = document.getElementById("chk1").getAttribute('data-value'); */
	alert("slu값"+slu);
	 window.open("sluiceDetail?sluice_id="+slu,"pop","width=900,height=750,left=350,top=200");
	  
	 
	 
 }

 
 
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container col-10">
<br>

<h1>관측소 목록</h1>

<div style="border: 1px; black;">

<form action="">
<!-- 관측소 목록밑 드롭다운 구역 -->
<div class="container col-12 d-block">
관측유형
<select>
	<option>전체</option>
	<option>강우량</option>
	<option>수위</option>
	<option>유량</option>
</select>
운영기관
<select>
	<option>전체</option>
	<option>운영1</option>
	<option>운영2</option>
	<option>운영3</option>
</select>
행정구역
<select>
	<option>전체</option>
	<option>행정1</option>
	<option>행정2</option>
	<option>행정3</option>
</select>
관측소명 <input type="text" placeholder="관측소명을 입력하세요." > 
<button type="button" style="background-color: #000042; color: white; " > 검색</button>
</div>
</form>
</div>

<div class="text-end" style="margin-right: 200px; margin-top: 20px;">

<button type="button" style="background-color: #000042; color: white;" onclick="showpopup()"> 등록</button>

<button type="button" style="background-color: gray;"> 저장</button>
</div>

<!--리스트 테이블 foreach  -->
<table class="table" style="margin-top: 30px; width: 900px;">
  <thead class="table-light">
    <tr>
      <th scope="col">연번</th>
     <th scope="col">관측소명</th>
     <th scope="col">표준코드</th>
     <th scope="col">위도</th>
     <th scope="col">경도</th>
     <th scope="col">관측유형</th>
     <th scope="col">운영기관</th>
     <th scope="col">조회</th> 
    </tr>
  </thead>
  <tbody class="table-group-divider">
   <c:set var="num" value="1"/>
   <c:forEach var="sul" items="${SluiceList}">
   <tr>
   	<td>${num }</td>
   	<!--
   	<input type="hidden" value="${sluice.sluice_id }">
   	<form action="sluiceDetail" method="get"><input type="hidden" id="" value="${sul.sluice_id }">  -->
   	<td><a href=""  onclick="showpopDetail(${sul.sluice_id})" id="" <%-- data-value="${sul.sluice_id } --%> > ${sul.sluice_id } ${sul.name}</a></td>
   	<td>${sul.sluice_id }</td>
   	<td>${sul.mapy }</td>
   	<td>${sul.mapx }</td>
   		<td>
   	관측유형 조인 ㄱ 

   	 </td>
   	<td>운영기관 조인 ㄱ</td>
       <td><a href="ObservDataList?sluice_id=${sul.sluice_id }&type=${sul.type}">
       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg></a></td>    
    </tr>
   
  <c:set var="num" value="${num +1}"/>
   </c:forEach>
   
 
    
  </tbody>
</table>

<nav aria-label="Page navigation example text-center" style="margin-top: 20px; margin-left: 200px;">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>



</div>










</body>
</html>