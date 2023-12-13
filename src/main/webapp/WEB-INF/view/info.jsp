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
	<div class="container info-container">
		<div class="row row-cols-1 info-content-box">
			<div class="row row-cols-2 info-first-box">
				<div class="cols info-first-image-box">
					<img alt="..." src="/images/info_icon1.png">
				</div>
				<div class="cols info-first-title-box">
					<p>기관&nbsp;소개</p>
				</div>
			</div>
			<div class="col info-second-box">
				<p>•&nbsp;한강홍수통제소</p>
				<p>한강홍수통제소는 한강의 홍수 및 갈수의 통제 및 관리 등의 사무를 관장하는 대한민국 환경부의 소속기관이다. 1974년 6월 29일 발족하였으며, 서울특별시 서초구 동작대로 328에 위치하고 있다. 소장은 고위공무원단 나등급에 속하는 일반직공무원으로 보한다.</p>
			</div>
			<hr class="info-hr-custom">
			<div class="col info-third-box">
				<p>•&nbsp;수자원관리&nbsp;종합&nbsp;폴랫폼</p>
				<p>환경문제와 기후변화로 인해 수자원의 중요성이 더욱 부각되고 있는 현대 사회에서, 효과적인 수자원 관리는 점점 더 중요해지고 있습니다. 이에 대응하여 개발된 "수자원관리 종합 폴랫폼"은 현대적이고 효율적인 수자원 관리를 위한 첨단 기술과 전문 지식을 통합한 솔루션입니다.</p>
			</div>
			<div class="col info-fourth-box">
				<button onclick="pageMove()">&nbsp;&nbsp;메인으로&nbsp;&nbsp;</button>
			</div>
		</div>
	</div>
</body>
</html>