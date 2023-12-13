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

<h1>시자료 </h1>
<h1>관측소 명 : {sluicename}</h1>
<br>

(단위: mm) <button type="button" style="float: right; margin-right: 10px;" class="btn btn-secondary">저장</button> 
<button type="button"   onclick="locate()" class="btn" style="background-color: #000042; color: white; margin-right:20px; float: right;" >관리</button>


<br>

<table class="table table-bordered" style="margin-top: 30px;">
  <thead class="table-light">
    <tr>
      <th scope="col" colspan="2">관측일시</th>
      <th></th>
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
    <tr>
      <th scope="row" colspan="2">foreach돌령</th>
      <td></td>
      <td></td>
      <td></td>
    </tr>
 
  </tbody>
</table>

</div>
<div  >
<nav aria-label="Page navigation example" style="margin-left: 500px;">
  <ul class="pagination ">
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

</div>














</body>
</html>