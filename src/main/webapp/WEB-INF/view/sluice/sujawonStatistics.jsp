<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluiceMapHeader.jsp" %>
<%@ include file="../../components/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
	<script type="text/javascript">
		$(function(){
			// 수자원시설물 비율 파이 차트
			var ctx1 = document.getElementById('piechart').getContext('2d');
			var pieChart = new Chart(ctx1, {
				type: 'pie',
				data: {
					labels: ["댐","저수지","펌프장","관개수로"],
					datasets: [{
						data: ['${pieCnt1}','${pieCnt2}','${pieCnt3}','${pieCnt4}'],
						backgroundColor: [
							'rgba(255, 99, 132, 1.5)',
			            	'rgba(54, 162, 235, 1.5)',
			            	'rgba(255, 206, 86, 1.5)',
			            	'rgba(71, 200, 62, 1.5)'
						],
						hoverBorderColor : '#fff'
					}],
					options: {
						responsive: true,
						legend: {
							display: true,
							position: 'bottom'
						},
						title: {
							display: true,
							text: '수자원시설물 비율',
							fontSize: 17, 
							fontColor: 'rgba(46, 49, 49, 1)' 
						},
						animation: false,
						tooltips: {
							displayColors: false,
							titleFontColor: '#fff',
							titleAlign: 'center',
							bodyAlign: 'center'
						}
					}
				}
			})
			
			// 행정구역별 수자원시설물 라인 차트
			var ctx2 = document.getElementById('linechart').getContext('2d');
			var lineChart = new Chart(ctx2, {
				type: 'line',
				data: {
					labels: ["서울","경기"]		
				}
			})
		
		})	
	</script>
</head>
<body>
	<div class="container">
		<div class="blank" style="height: 100px;"></div>
		<div class="chartjs d-flex justify-content-center">
			<div class="piechart" style="height: 600px; width: 600px;">
				<h4 style="text-align: center;">수자원시설물 비율</h4>
				<canvas id="piechart"></canvas>
			</div>
			
			<div class="linechart" style="height: 600px; width: 600px; margin-left: 100px;">
				<h4 style="text-align: center;">행정구역별 수자원시설물</h4>
				<canvas id="linechart"></canvas>
			</div>
		</div>
	</div>
</body>
</html>