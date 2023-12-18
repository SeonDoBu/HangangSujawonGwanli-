<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluiceMapHeader.jsp" %>
<%@ include file="../../components/header.jsp" %>
    
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

	function onback() {
		
		location.href="ObservDataList?sluice_id=${observData.sluice_id}&type=${observData.type}";
	}
	
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input {
width: 70px;
}

</style>
</head>
<body>
<form action="observdataUpdate" method="post">
<div>
<div class="" style="margin-left:40px; margin-top:30px; border: 1px; border-color: gray;">
	
	<input type="text" name="type" value="${observDataD.type}">
	<input type="text" name="data_ymd" value="${observDataD.data_ymd }">
	<input type="text" name="sluice_id" value="${observDataD.sluice_id }">

<h1>시자료 </h1>
<h1>관측소 명 : ${sluice.name} 
   	<c:choose>
   	<c:when test="${observDataD.type eq 1 }">
   	강수량관측소
   	</c:when>
   	<c:when test="${observDataD.type eq 2 }">
   	수위관측소
   	</c:when>
   	<c:when test="${observDataD.type eq 3 }">
   	유량관측소
   	</c:when>
   	<c:otherwise>
   	관측중
   	</c:otherwise>
   	</c:choose>

</h1>
<br>

(단위: mm) 

<br>

<table class="table table-bordered" style="margin-top: 30px; width: 1100px;">
  <thead class="table-light" style="width: 1100px;">
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
     </tr>
     <tr style="background-color: white;">
      <th scope="row" colspan="2">${observDataD.data_ymd }</th>
    	<td><input type="number" step="0.000001" name="value00" value="${observDataD.value00}" > </td>
		<td><input type="number" step="0.000001" name="value01" value="${observDataD.value01}" > </td>
		<td><input type="number" step="0.000001" name="value02" value="${observDataD.value02}"> </td>
		<td><input type="number" step="0.000001" name="value03" value="${observDataD.value03}"> </td>
		<td><input type="number" step="0.000001" name="value04" value="${observDataD.value04}"> </td>
		<td><input type="number" step="0.000001" name="value05" value="${observDataD.value05}"> </td>
		<td><input type="number" step="0.000001" name="value06" value="${observDataD.value06}"> </td>
		<td><input type="number" step="0.000001" name="value07" value="${observDataD.value07}"> </td>
		<td><input type="number" step="0.000001" name="value08" value="${observDataD.value08}"> </td>
		<td><input type="number" step="0.000001" name="value09" value="${observDataD.value09}"> </td>
		 
		<td><input type="number" step="0.000001" name="value10" value="${observDataD.value10}"> </td>
		<td><input type="number" step="0.000001" name="value11" value="${observDataD.value11}"> </td>
     
    </tr>
  </thead>
  
  <tbody class="table-light" style="width: 1100px;">
	<tr>
	<th colspan="2">
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
     <tr style="background-color: white;">
     	<th colspan="2"></th>
		<td><input type="number" step="0.000001" name="value12" value="${observDataD.value12}"> </td>
		<td><input type="number" step="0.000001" name="value13" value="${observDataD.value13}"> </td>
		<td><input type="number" step="0.000001" name="value14" value="${observDataD.value14}"> </td>
		<td><input type="number" step="0.000001" name="value15" value="${observDataD.value15}"> </td>
		<td><input type="number" step="0.000001" name="value16" value="${observDataD.value16}"> </td>
		<td><input type="number" step="0.000001" name="value17" value="${observDataD.value17}"> </td>
		<td><input type="number" step="0.000001" name="value18" value="${observDataD.value18}" > </td>
		<td><input type="number" step="0.000001" name="value19" value="${observDataD.value19}"> </td>
		<td><input type="number" step="0.000001" name="value20" value="${observDataD.value20}"> </td>
		<td><input type="number" step="0.000001" name="value21" value="${observDataD.value21}"> </td>
		<td><input type="number" step="0.000001" name="value22" value="${observDataD.value22}"> </td>
		<td><input type="number" step="0.000001" name="value23" value="${observDataD.value23}"> </td>

    </tr>
 
  </tbody>
</table>

</div>
<div style="float: left; margin-left: 400px;" >

<button type="submit" style="background-color: #000042; margin-right:20px;  color: white;" onclick="show()"> 수정</button>

<button type="button" style="background-color: #000042; color: white;" onclick="onback()"> 닫기</button>
</div>

</div>
</form>













</body>
</html>