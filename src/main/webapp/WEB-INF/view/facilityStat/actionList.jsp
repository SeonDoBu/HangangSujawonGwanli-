<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="faheader.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	/* 제목 */
	#title{
		margin-top: 50px;
		text-align: center;
		font-weight: bold;
		font-family: 'Noto Sans KR', sans-serif;
	}
	/* 고장/조치 선택 버튼 */
	#selectBtn{
		text-align: center;
		margin-top: 20px;
	}
	
	/* 테이블 */	
	#con-table{
		margin: 50px;
		text-align: center;
		border-top: solid 2px;
	}
	
	/* 열기 버튼 */
	#openButton{
		background: white;
		color: #000042;
		border-radius: 5px;
	}
		/* 컨텐츠 */
	#content{
		padding-right: 20%;
		padding-left: 20%;
	}
	
	
</style>
</head>
<body>
	
	<div id="title">
		<h2>고장/조치 결과 보고 목록</h2>
	</div>

<div id="content">	
	<div id="selectBtn">
        <button type="button" onclick="location.href='troubleList.do'" style="border: none;"  class="btn btn-secondary btn-block col-md-3">고장 보고서</button>
        <button type="button" onclick="location.href='actionList.do'"  style="background: #000042; border: none;"  class="btn btn-primary btn-block col-md-3">조치 결과 보고서</button>
	</div>
	
	<div style="float: right; margin-top: 50px; margin-right: 50px;" >
        <button type="button" style="background: #000042; color: white;" onclick="location.href='actionWrite.do'">조치 결과 보고서 작성
        <i class="bi bi-caret-right-fill" style="color:  white;"></i>
        </button>
	</div>
	
	
	<div style="margin-top: 100px;">
	
	<div id="con-table">
		 <table class="table">
		   <thead class="table-light">
				<tr>
					<th>연번</th>
					<th>등록 일자</th>
					<th>시설물 종류</th>
					<th>조치/복구 일자</th>
					<th>작성자</th>
					<th>조치 결과 보고서</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${actionList }" var="al">
				<tr>
					<td>${al.rn }</td>
					<td><fmt:formatDate value="${al.created_at }" pattern="yyyy-MM-dd"/></td>
					<td>
						<c:choose>
						    <c:when test="${al.siseol_id  >= 400000000 && al.siseol_id  <= 499999999}">
						        관개수로
						    </c:when>
						    <c:when test="${al.siseol_id  >= 300000000 && al.siseol_id  <= 399999999}">
						        펌프장
						    </c:when>
						    <c:when test="${al.siseol_id  >= 200000000 && al.siseol_id  <= 299999999}">
						        저수지
						    </c:when>
						    <c:when test="${al.siseol_id  >= 100000000 && al.siseol_id  <= 199999999}">
						        댐
						    </c:when>
						    <c:otherwise>
						        출력이상
						    </c:otherwise>
						</c:choose>
					</td>
					
					<td><fmt:formatDate value="${al.action_date }" pattern="yyyy-MM-dd"/></td>
					<td>${al.user_id }</td>
					<td>
						<button id="openButton">열기</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	</div>
	
	
	<div id="page">
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item"><a class="page-link" href="#">이전</a></li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item"><a class="page-link" href="#">다음</a></li>
	  </ul>
	</nav>
	</div>

</div>	

</body>
</html>