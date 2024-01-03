<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluicePopHeader.jsp" %>
<%@ include file="../../components/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1 {
   margin: 20px;
}

div {
margin: 10px;
margin-left: 0px;
}
p {
margin-top: 15px;
margin-bottom: 15px;
}
input {
width: 280px;


}

</style>

</head>
<body>
<form action="sluiceInsert1" method="post">
<div class="container" style="margin-top:50px;
 border: solid; 1px; border-color: black; ">

<h1>관측소 등록 </h1>

<hr style="border-style: 3px;">

<div class="container">
<div>
<p>관측소 코드: <input type="number" style="" name="sluice_id" ></p>

<p>관측소명: <input  name="name" style="margin: 10px; margin-left: 22px;" type="text"></p>
<div>

</div>
<div >
<p>위도: <input type="number" step="0.0000000000000001"  name="mapy" style="margin-left: 52px;"></p>
<p>경도: <input type="number" step="0.0000000000000001" name="mapx" style="margin-left: 52px;"></p>
</div>
<div  >
<p>하천 주소: <input type="text" name="area" style="margin-left: 16px;"></p>
<p>하천 세부 주소: <input type="text" name="address"></p>

</div>
<div class="cotainer" style="margin-top: 30px;">

<button type="submit" style="margin: 30px; margin-left:150px; width:100px; height:50px; background-color: #000042; color: white;"> 등록 </button>
</div>
</div>
</div>

</div>
</form>
</body>
</html>