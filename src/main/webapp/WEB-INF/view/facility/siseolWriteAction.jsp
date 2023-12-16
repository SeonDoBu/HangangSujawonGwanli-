<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../facilityStat/faheader.jsp" %>
<%@ include file="/WEB-INF/components/header.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content">
		<c:if test="${result == 1}">
			<script type="text/javascript">
				alert("저장 되었습니다.");
				location.href="siseoulList.do";
			</script>
		</c:if>
		<c:if test="${result == 0}">
			<script type="text/javascript">
				alert("실패하였습니다.");
				location.href="javascript:history.back();";
			</script>
		</c:if>
	</div>
</body>
</html>