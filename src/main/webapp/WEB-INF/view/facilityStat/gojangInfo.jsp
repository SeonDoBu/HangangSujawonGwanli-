<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="faheader.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery UI CSS -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI JavaScript -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">

		/* 제목 */
	#title{
		margin-top: 50px;
		text-align: center;
		font-weight: bold;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
		/* 테이블 */	
	#con-table{
		margin: 50px;
		text-align: center;
		border-top: solid 2px;
	}
	
		/* 테이블2 */	
	#con-table2{
		margin: 50px;
		text-align: center;
		border-top: solid 2px;
	}
	
		/* 컨텐츠 */
	#content{
		padding-right: 30%;
		padding-left: 30%;
	}
	
	.table-active{
		font-weight: bold;
		border-color: white;
	}
	
	
</style>

</head>
<body>

	<div id="title">
		<h2>고장 보고서 상세</h2>
	</div>

<div id="content">
	<c:set value="${gojangInfo }" var="gi"/>
		<div id="con-table">
		 <table class="table">
				<tr>	
					<td class="table-active">보고서 등록일</td>
						<td>${gi.created_at }</td>	
				</tr>

				<tr>	
					<td class="table-active">시설물 코드</td>
					<td>
						<c:choose>
						    <c:when test="${gi.siseol_id  >= 400000000 && gi.siseol_id  <= 499999999}">
						        [관개수로] &nbsp; ${gi.siseol_id }
						    </c:when>
						    <c:when test="${gi.siseol_id  >= 300000000 && gi.siseol_id  <= 399999999}">
						        [펌프장] &nbsp; ${gi.siseol_id }
						    </c:when>
						    <c:when test="${gi.siseol_id  >= 200000000 && gi.siseol_id  <= 299999999}">
						        [저수지] &nbsp; ${gi.siseol_id }
						    </c:when>
						    <c:when test="${gi.siseol_id  >= 100000000 && gi.siseol_id  <= 199999999}">
						        [댐] &nbsp; ${gi.siseol_id }
						    </c:when>
						    <c:otherwise>
						        출력이상 ${gi.siseol_id }
						    </c:otherwise>
						</c:choose>
					</td>
				</tr>
				
				<tr>	
					<td class="table-active">작성자</td>
					<td>${gi.user_id }</td>	
				</tr>
			
			</table>
		</div>	
		
		<div id="con-table2">
			<table class="table">
				
				<tr>	
					<td class="table-active">제목</td>
						<td>${gi.title }</td>	
				</tr>

				<tr>	
					<td class="table-active">고장일</td>
						<td>${gi.gojang_date }</td>	
				</tr>
				
				
				<tr>	
					<td class="table-active">고장원인</td>
						<td>
							<textarea class="form-control">${gi.gojang_cause }</textarea>
						</td>	
				</tr>
				
				<tr>	
					<td class="table-active">현재 상황</td>
						<td>
							<textarea class="form-control">${gi.curr_status }</textarea>
						</td>	
				</tr>
				
				<tr>	
					<td class="table-active">향후 계획</td>
						<td>
							<textarea class="form-control">${gi.future_plan }</textarea>
						</td>	
				</tr>
				
				<tr>	
					<td class="table-active" colspan="2">첨부 파일</td>
				</tr>
				
				<tr>	
					<td colspan="2">
						<img alt="이미지" src="${gi.file_name }"><p>
					</td>
				</tr>				
				
			</table>	
			
		</div>	
		
		
		
		<div style="float: right; margin-right: 50px; margin-bottom: 50px;" >
	        <button type="button" style="background: #000042; color: white;" onclick="location.href='troubleList.do'">돌아가기
	        </button>
		</div>
		
</div>	
	
	

</body>
</html>