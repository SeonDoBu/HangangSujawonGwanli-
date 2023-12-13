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
<div class="container" style="margin-top:50px;
 border: solid; 1px; border-color: black; ">

<h1 style="margin-top: 10px;">관측소 정보 </h1>

<hr style="border-style: 3px;">


<div class="container">
<div>
관측소명 <input class="col-5"  style="margin: 10px;" type="text">
<div>
관측 유형 <select style="margin-right: 40px; margin-left: 5px;">
<option>강우량</option>
<option>수위</option>
<option>유량</option>
</select>
표준 코드 <input type="text">
</div>
<div style="margin: 10px;">
위도 <input type="number" style="margin-right: 40px; margin-left: 30px;">
경도 <input type="number">
</div>
<div style="margin: 10px;" >
관측방식 <input type="text" style="margin-right: 40px;">
운영기관 <input type="text">

</div>
<div class="cotainer" style="margin-top: 150px;">

<button type="submit" style="margin: 30px; background-color: #000042; color: white;"> 수정 </button>
<button type="submit" style="margin: 30px;"> 삭제 </button>
</div>
</div>
</div>

</div>


</body>
</html>