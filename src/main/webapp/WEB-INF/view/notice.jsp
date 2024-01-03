<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/components/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<script type="text/javascript">
	function pageMove() {
		console.log("실행");
		location.href = 'home.do';
	}
</script>
</head>
<body>
	<div class="container notcie-container">
		<div class="row row-cols-1 notice-content-box">
			<div class="row row-cols-2 notice-first-box">
				<div class="cols notice-first-image-box">
					<img alt="..." src="/images/info_icon1.png">
				</div>
				<div class="cols notice-first-title-box">
					<p>공지사항</p>
				</div>
			</div>
			<div class="row row-cols-4 notice-second-box" style="margin-bottom: 10px;">
				<div class="cols notice-second-keyword-box">
					<p>조건</p>
					<select>
						<option>전체</option>
						<option>제목</option>
						<option>제목+내용</option>
					</select> 
					<input type="text" name="" placeholder="검색어를 입력해주세요.">
					<button>&nbsp;조회&nbsp;</button>
				</div>
			</div>
			
			<!-- 글번호 Logic -->
			<c:set var="num" value="1"/>
			
			<div class="row row-cols-1 notice-third-box">
				<table class="table notice-third-table">
					<tr>
						<th colspan="2">제목</th>
						<th>등록일</th>
						<th>조회수</th>
						<th>첨부파일</th>
					</tr>
					<c:forEach var="notices" items="${noticeAllList }">
						<tr>
							<td>${num }</td>
							<c:set var="num" value="${num +1 }"/>	
							<td><a href="noticeDetail.do?noticeId=${notices.notice_id }">${notices.title }</a></td>
							<td>
								<fmt:formatDate value="${notices.created_date }" type="date"
										        pattern="YYYY-MM-dd hh:mm:ss"/>
							</td>
							<td>${notices.readcount }</td>
							<c:choose>
								<c:when test="${notices.file_name eq null}">
									<td>-</td>
								</c:when>
								<c:otherwise>
								<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="row row-cols-1 notice-fourth-box">
				<button onclick="pageMove()" style="margin-top: 10px;">&nbsp;&nbsp;메인으로&nbsp;&nbsp;</button>
			</div>
		</div>
	</div>
</body>
</html>