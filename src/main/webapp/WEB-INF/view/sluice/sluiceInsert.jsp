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
<form action="">
<div class="container" style="border: solid; 1px; border-color: black; ">

<h1>관측소 등록 </h1> <button style="">목록보기</button>

<hr style="border-style: 3px;">


<div>
<div>
관측소명 <input type="text">
<div>
관측 유형 <select style="margin-right: 40px;">
<option>강우량</option>
<option>수위</option>
<option>유량</option>
</select>
표준 코드 <input type="text">
</div>
<div>
위도 <input type="number" style="margin-right: 40px;">
경도 <input type="number">
</div>
<div>
관측방식 <input type="text" style="margin-right: 40px;">
운영기관 <input type="text">

</div>
<div class="cotainer" style="margin-top: 200px;">

<button type="submit" > 등록 </button>
</div>
</div>
</div>

</div>
</form>
</body>
</html>