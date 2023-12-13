<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/components/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
			<div class="row row-cols-4 notice-second-box">
				<div class="cols notice-second-keyword-box">
					<p>조건</p>
					<select>
						<option>전체</option>
						<option>제목</option>
						<option>제목+내용</option>
					</select> <input type="text" name="" placeholder="검색어를 입력해주세요.">
					<button>&nbsp;조회&nbsp;</button>
				</div>
			</div>
			<div class="row row-cols-1 notice-third-box">
				<table class="table notice-third-table">
					<tr>
						<th colspan="2">제목</th>
						<th>등록일</th>
						<th>조회수</th>
						<th>첨부파일</th>
					</tr>
					<tr>
						<td>1</td>
						<td>어쩌구저쩌구어쩌구</td>
						<td>2023-12-13 12:00:00</td>
						<td>12</td>
						<td>-</td>
					</tr>
					<tr>
						<td>2</td>
						<td>어쩌구저쩌구어쩌구</td>
						<td>2023-12-13 12:00:00</td>
						<td>12</td>
						<td>-</td>
					</tr>
					<tr>
						<td>3</td>
						<td>어쩌구저쩌구어쩌구</td>
						<td>2023-12-13 12:00:00</td>
						<td>12</td>
						<td>-</td>
					</tr>
					<tr>
						<td>4</td>
						<td>어쩌구저쩌구어쩌구</td>
						<td>2023-12-13 12:00:00</td>
						<td>12</td>
						<td>-</td>
					</tr>
					<tr>
						<td>5</td>
						<td>어쩌구저쩌구어쩌구</td>
						<td>2023-12-13 12:00:00</td>
						<td>12</td>
						<td>-</td>
					</tr>
					<tr>
						<td>6</td>
						<td>어쩌구저쩌구어쩌구</td>
						<td>2023-12-13 12:00:00</td>
						<td>12</td>
						<td>-</td>
					</tr>
					<tr>
						<td>7</td>
						<td>어쩌구저쩌구어쩌구</td>
						<td>2023-12-13 12:00:00</td>
						<td>12</td>
						<td>-</td>
					</tr>
					<tr>
						<td>8</td>
						<td>어쩌구저쩌구어쩌구</td>
						<td>2023-12-13 12:00:00</td>
						<td>12</td>
						<td>-</td>
					</tr>
					<tr>
						<td>9</td>
						<td>어쩌구저쩌구어쩌구</td>
						<td>2023-12-13 12:00:00</td>
						<td>12</td>
						<td>-</td>
					</tr>
					<tr>
						<td>10</td>
						<td>어쩌구저쩌구어쩌구</td>
						<td>2023-12-13 12:00:00</td>
						<td>12</td>
						<td>-</td>
					</tr>
				</table>
			</div>
			<div class="row row-cols-1 notice-fourth-box">
				<button onclick="pageMove()">&nbsp;&nbsp;메인으로&nbsp;&nbsp;</button>
			</div>
		</div>
	</div>
</body>
</html>