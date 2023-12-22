<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sluiceMapHeader.jsp" %>    
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>지도</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
     integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<style type="text/css">
		.sidebar10 {
			width: 80px;
			background-color: #000042;
			height: 1920px;
			float: left;
		}
		
		/* 지도 크기 설정을 위한 css */
		.map {
      	height: 1180px;
      	width: 100%;
    	}
	</style>
	
    <script src="https://code.jquery.com/jquery-3.6.0.js" 
	 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="/js/ol.js"></script> <!-- OpenLayer 라이브러리 -->
	<link href="/css/ol.css" rel="stylesheet" type="text/css" > <!-- OpenLayer css -->
	<script type="text/javascript" src="/js/mapTest.js"></script> <!-- 지도 맵객체 생성을 위한 js-->
	<script type="text/javascript">
/* 		$(function(){
			console.log("sluiceMain.jsp");
			 // 맵 객체에 레이어를 추가함
			map.addLayer(wms2);
			map.addLayer(wms3);
			map.addLayer(wms4);
		}) */
		/*전체 선택 할려고 했으나 값이 바뀌지않음  */
/* 		$(document).ready(function() {
			$("#chkAll").click(function() {
				if($("#chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
				else $("input[name=chk]").prop("checked", false);
			});

			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;

				if(total != checked) $("#chkAll").prop("checked", false);
				else $("#chkAll").prop("checked", true); 
			});
		});
	 */

		
		function addLayer1() {
	/* 		if(document.getElementById('chk').checked) {
				
			} else {
				location.
			} */
			
		/* 	var haha = $("#chk").val;
			 console.log(haha); */
			if(document.getElementById('chk1').checked) {
				console.log('하하');
				map.addLayer(wms1);
			} else {
				console.log('메롱');
				map.removeLayer(wms1);
			}	
		}
		
		function addLayer2() {
		if(document.getElementById('chk2').checked) {
			console.log('하하');
			map.addLayer(wms2);
		} else {
			console.log('메롱');
			map.removeLayer(wms2);
		}
		}
		function addLayer3() {
		if(document.getElementById('chk3').checked) {
			console.log('하하');
			map.addLayer(wms3);
		} else {
			console.log('메롱');
			map.removeLayer(wms3);
		}}
		function addLayer4() {
		if(document.getElementById('chk4').checked) {
			console.log('하하');
			map.addLayer(wms4);
		} else {
			console.log('메롱');
			map.removeLayer(wms4);
		}}
		function addLayer5() {
		if(document.getElementById('chk5').checked) {
			console.log('하하');
			map.addLayer(wms5);
		} else {
			console.log('메롱');
			map.removeLayer(wms5);
		}}
		function addLayer6() {
		if(document.getElementById('chk6').checked) {
			console.log('하하');
			map.addLayer(wms6);
		} else {
			console.log('메롱');
			map.removeLayer(wms6);
		}}
		function addLayer7() {
			if(document.getElementById('chk7').checked) {
				console.log('하하');
				map.addLayer(wms7);
			} else {
				console.log('메롱');
				map.removeLayer(wms7);
			}}
		
	</script>
  </head>
  <body>

<!-- 사이드바 버튼  -->
<div class="sidebar10" >
 <button class="btn btn-primary"  style="margin: 10px; border:0px; width:70px; height:70px; background-color: #000042;"  type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">
 <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-thermometer-sun" viewBox="0 0 16 16">
  <path d="M5 12.5a1.5 1.5 0 1 1-2-1.415V2.5a.5.5 0 0 1 1 0v8.585A1.5 1.5 0 0 1 5 12.5z"/>
  <path d="M1 2.5a2.5 2.5 0 0 1 5 0v7.55a3.5 3.5 0 1 1-5 0V2.5zM3.5 1A1.5 1.5 0 0 0 2 2.5v7.987l-.167.15a2.5 2.5 0 1 0 3.333 0L5 10.486V2.5A1.5 1.5 0 0 0 3.5 1zm5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-1 0v-1a.5.5 0 0 1 .5-.5zm4.243 1.757a.5.5 0 0 1 0 .707l-.707.708a.5.5 0 1 1-.708-.708l.708-.707a.5.5 0 0 1 .707 0zM8 5.5a.5.5 0 0 1 .5-.5 3 3 0 1 1 0 6 .5.5 0 0 1 0-1 2 2 0 0 0 0-4 .5.5 0 0 1-.5-.5zM12.5 8a.5.5 0 0 1 .5-.5h1a.5.5 0 1 1 0 1h-1a.5.5 0 0 1-.5-.5zm-1.172 2.828a.5.5 0 0 1 .708 0l.707.708a.5.5 0 0 1-.707.707l-.708-.707a.5.5 0 0 1 0-.708zM8.5 12a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-1 0v-1a.5.5 0 0 1 .5-.5z"/>
</svg><small>관측소</small></button><br>
<div class="offcanvas offcanvas-start" style="margin-top: 80px; margin-left: 80px; float: left;" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
  <!-- 사이드바 헤더  -->
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasScrollingLabel">사이드바 헤더</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <!-- 사이드바 바디 리스트용  -->
  <div class="offcanvas-body">
    <p>사이드바 테이블 </p>
    <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
  </div>
</div>
<!-- 사이드바 끝  -->

<!-- 사이드바 버튼2  -->

 <button class="btn btn-primary" style="margin: 10px; border:0px; background-color:#000042; width: 70px; height: 70px;"  type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling2" aria-controls="offcanvasScrolling">
 <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-stack" viewBox="0 0 16 16">
  <path d="m14.12 10.163 1.715.858c.22.11.22.424 0 .534L8.267 15.34a.598.598 0 0 1-.534 0L.165 11.555a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.66zM7.733.063a.598.598 0 0 1 .534 0l7.568 3.784a.3.3 0 0 1 0 .535L8.267 8.165a.598.598 0 0 1-.534 0L.165 4.382a.299.299 0 0 1 0-.535L7.733.063z"/>
  <path d="m14.12 6.576 1.715.858c.22.11.22.424 0 .534l-7.568 3.784a.598.598 0 0 1-.534 0L.165 7.968a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.659z"/>
</svg>
 <small>레이어</small>
 
 </button><br>
<div class="offcanvas offcanvas-start" style="margin-top: 80px; margin-left: 80px; float: left;" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling2" aria-labelledby="offcanvasScrollingLabel">
  <!-- 사이드바 헤더  -->
  <div class="offcanvas-header" style="float: right;">
    <h5 class="offcanvas-title" id="offcanvasScrollingLabel">레이어 
    </h5>
  <!--   <div>
    <input type="checkbox" checked="checked" id="chkAll">
    </div> -->
    
    
    
    <button type="button"  class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <!-- 사이드바 바디 리스트용  -->
  <div class="offcanvas-body">
   
<!-- 메롱의메롱 -->
<h4>행정구역</h4>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer5()" name="chk" id="chk5" checked="checked"> 행정구역 경기<br>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer6()" name="chk" id="chk6" checked="checked"> 행정구역 서울

<h4 style="margin-top: 10px;">한강하천</h4>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer1()" name="chk" id="chk1" checked="checked"> 한강하천_서울<br>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer2()" name="chk" id="chk2" checked="checked"> 한강하천_경기<br>
<h4 style="margin-top: 10px;">한강수계</h4>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer3()" name="chk"  id="chk3" checked="checked"> 한강수계_서울<br>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer4()" name="chk" id="chk4" checked="checked"> 한강수계_경기<br>

<br><br><br>
&nbsp;&nbsp;<input type="checkbox" onclick="addLayer7()" name="chk" id="chk7" checked="checked"> 관측소<br>

 </div>
</div>


<!-- 사이드바 버튼3  -->

 <button class="btn btn-primary" style="margin: 10px; border:0px; background-color:#000042; width: 70px; height: 70px;"  type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling3" aria-controls="offcanvasScrolling">
 <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
</svg>
 <small>북마크</small>
 
 
</button>
<div class="offcanvas offcanvas-start" style="margin-top: 80px; margin-left: 80px; float: left;" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling3" aria-labelledby="offcanvasScrollingLabel">
  <!-- 사이드바 헤더  -->
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasScrollingLabel">사이드바 헤더3</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <!-- 사이드바 바디 리스트용  -->
  <div class="offcanvas-body">
    <p>사이드바 테이블3 </p>
    <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
  </div>
</div>
</div>
<div>

<!-- 진짜 바디의 시작 -->
	<div id="map" class="map" style="margin-left: 80px;">
	<!-- 실제 지도가 표출 될 영역 -->
	</div>

</div>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
   
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
  
  </body>
</html>