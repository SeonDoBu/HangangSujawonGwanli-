<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>sumoon</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style type="text/css">
.nav-item {
	margin-top: 20px;
}
</style>
</head>

<body>
	<div>
		<ul class="nav nav-underline"
			style="background-color: #000042; height: 80px;">
			<li class="nav-item">
				<h2 style="color: #FFFFFF; margin-left: 150px;">실시간 수문정보 관리 시스템</h2>
			</li>
			<li class="nav-item" style="margin-left: 10px;"><a
				class="nav-link" href="sluiceMain" style="color: #FFFFFF;"> 지도 </a>
			</li>


			<!-- 헤더 드롭다운 할까 ?  -->
			<!-- <div>
<div class="dropdown">
  <button class="btn dropdown-toggle"   style="background-color: #062e6f; color: #FFFFFF;" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    관측소
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">목록</a></li>
    <li><a class="dropdown-item" href="#"></a></li>
    <li><a class="dropdown-item" href="#">Something else here</a></li>
  </ul>
</div>
</div> -->

			<li class="nav-item" style="margin-left: 30px;"><a
				class="nav-link " href="sluiceList" style="color: #FFFFFF;">관측소</a>
			</li>

			<li class="nav-item"><a class="nav-link " href="sujawonList.do"
				style="color: #FFFFFF;">수자원</a></li>



			<li style="margin-left: 100px;"></li>
			<li class="nav-item"><a class="nav-link" href="#"
				style="color: #FFFFFF;">사이트맵 |</a></li>

			<li class="nav-item"><a class="nav-link" href="#"
				style="color: #FFFFFF;">{user_name}님 |</a></li>

			<li class="nav-item"><a class="nav-link" href="#"
				style="color: #FFFFFF;">로그아웃</a></li>

		</ul>




	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
		integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
		crossorigin="anonymous"></script>
</body>
</html>
