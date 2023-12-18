<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>sumoon</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <style type="text/css">
  .nav-item{
  margin-top: 20px;

  
  }
  
  </style>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script type="text/javascript">
  	function closeAndRedirect(type) {
  		if(type == 'a') {
  			opener.parent.location = 'sluiceList';
  		} else if(type == 'b') {
  			opener.parent.location = 'sujawonList.do';
  		}
  		window.close();
  	}
  </script>
  </head>
  
  <body>
<div>
<ul class="nav nav-underline" style="background-color: #000042; height: 80px; " >
  <li class="nav-item">
    <h2 style="color: #FFFFFF; margin-left: 150px;" >실시간 수문정보 관리  시스템</h2>
  </li>


  
    <li class="nav-item" style="margin-left: 30px;">
    <a class="nav-link " style="color: #FFFFFF;" onclick="closeAndRedirect('a')">관측소 목록</a>
  </li>
  
    <li class="nav-item">
    <a class="nav-link " style="color: #FFFFFF;" onclick="closeAndRedirect('b')">수자원 목록</a>
  </li>
  
</ul>

</div>
   
   
   
   
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
  </body>
</html>
