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
<form action="sluiceInsert1" method="post">
<div class="container" style="margin-top:50px;
 border: solid; 1px; border-color: black; ">

<h1 style="margin-top: 10px;">관측소 등록 </h1>

<hr style="border-style: 3px;">

<div class="container">
<div>
관측소 코드 <input type="number" name="sluice_id" > <br>
관측소명 <input class="col-5" name="name" style="margin: 10px;" type="text">
<div>

</div>
<div style="margin: 10px;">
위도 <input type="number" step="0.0000000000000001"  name="mapy" style="margin-right: 40px; margin-left: 30px;">
경도 <input type="number" step="0.0000000000000001" name="mapx">
</div>
<div style="margin: 10px;" >
하천 주소 <input type="text" name="area" >
하천 세부 주소 <input type="text" name="address">

</div>
<div class="cotainer" style="margin-top: 150px;">

<button type="submit" style="margin: 30px; background-color: #000042; color: white;"> 등록 </button>
</div>
</div>
</div>

</div>
</form>
</body>
</html>