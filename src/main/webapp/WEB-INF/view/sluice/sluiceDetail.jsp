<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluicePopHeader.jsp" %>
<%@ include file="../../components/header.jsp" %>     
    
<!DOCTYPE html>
<html>

<script type="text/javascript">

</script>
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
<form action="updateSluice" method="post">
<div class="container" style="margin-top:50px;
 border: solid; 1px; border-color: black; ">
<h1 style="">관측소 정보 </h1>
<hr style="border-style: 3px;">
<div class="container">
<div>

<p>관측소 코드: ${sluice.sluice_id }</p>
<p>관측소명:<input style="margin-left: 10px;" name="name"  value="${sluice.name }" type="text"></p>
<div>

표준 코드: <input type="text" name="sluice_id" value="${sluice.sluice_id }">
</div>
<div>
<p>위도: <input style="margin-left: 38px;" type="number" step="0.000000001" name="mapy" value="${sluice.mapy }" ></p>
<p>경도:<input style="margin-left: 42px;" type="number" step="0.000000001" name="mapx" value="${sluice.mapx }" ></p>
</div>
<div  >
<p>하천 주소: <input type="text" name="area" value="${sluice.area }"></p>
하천 세부 주소: <input type="text" name="address" value="${sluice.address }">

</div>
<div style="margin-left: 100px; margin-top: 40px;" >

<button type="submit" style="width:80px; margin-right:40px; height:50px;  background-color: #000042; color: white;" name="is_deleted" value="0"> 수정 </button>

<button type="submit" style="width:80px; height:50px;" name="is_deleted"  value="1"> 삭제 </button>

</div>
</div>
</div>

</div>
</form>

</body>
</html>