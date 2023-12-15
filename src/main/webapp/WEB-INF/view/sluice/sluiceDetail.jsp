<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluicePopHeader.jsp" %>
<%@ include file="../../components/header.jsp" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateSluice" method="post">
<div class="container" style="margin-top:50px;
 border: solid; 1px; border-color: black; ">

<h1 style="margin-top: 10px;">관측소 정보 </h1>

<hr style="border-style: 3px;">


<div class="container">
<div>

관측소 코드 ${sluice.sluice_id }<br> 
관측소명 <input class="col-5" name="name" value="${sluice.name }" style="margin: 10px;" type="text">
<div>

표준 코드 <input type="hidden" name="sluice_id" value="${sluice.sluice_id }">
</div>
<div style="margin: 10px;">
위도 <input type="number" step="0.000000001" name="mapy" value="${sluice.mapy }" style="margin-right: 40px; margin-left: 30px;">
경도 <input type="number" step="0.000000001" name="mapx" value="${sluice.mapx }" >
</div>
<div style="margin: 10px;" >
하천 주소 <input type="text" name="area" value="${sluice.area }">
하천 세부 주소 <input type="text" name="address" value="${sluice.address }">

</div>
<div class="cotainer" style="margin-top: 150px;">

<button type="submit" style="margin: 30px; background-color: #000042; color: white;"> 수정 </button>
<button type="submit" style="margin: 30px;"> 삭제 </button>
</div>
</div>
</div>

</div>

</form>
</body>
</html>