<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>수자원시설물관리정보시스템</title>
		
		<!-- 부트스트랩 폰트 아이콘 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">		

		<!-- 구글 폰트 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />

        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../../css/facility.css" rel="stylesheet" />
   		
   		  <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
   		
        <style>
            /* 사이드바 제목 */
            #sideHead {
                background-color:  #000042;
                color: white;
                font-weight: bold;
            }

            /* 헤더  */
            #head {
                background-color:  #000042;
                color: white;
            }
        </style>
   
   
    </head>
    <body>
       
        <div class="d-flex" id="wrapper">
            <!-- 사이드바 -->
 		 	
 		 <!-- 	
            <div class="border-end" id="sidebar-wrapper" style="background-color: #EBEDF1; ">
               
                <div class="sidebar-heading border-bottom" id="sideHead">
             		   점검이력통계
                </div>
                
                <div class="list-group list-group-flush" style="background-color: #EBEDF1; float: left;">
                    <a class="list-group-item list-group-item-action list-group-item p-3" href="#!">고장 및 조치 통계</a>
                    <a class="list-group-item list-group-item-action list-group-item p-3" href="#!">일지 작성 통계</a>
                    <a class="list-group-item list-group-item-action list-group-item p-3" href="#!">기간 별 알람 통계</a>
                    <a class="list-group-item list-group-item-action list-group-item p-3" href="#!">점검대상 별 알람 통계</a>
                    <a class="list-group-item list-group-item-action list-group-item p-3" href="#!">장애유형 별 알람 통계</a>
                </div>
            </div>
 		  -->	
            
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg  border-bottom" id="head">
                    <div class="container-fluid">

						<div style="background: #000042; font-weight: bold;">
							<h4><a href="siseoulList.do" style="text-decoration: none; color: white;">수자원시설물관리정보시스템</a></h4>
						</div>
						
                    	<!-- 화면 축소시 메뉴아이콘 -->
                        <button class="navbar-toggler" style="background: white;" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    	
                           <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active">
                                  <a class="nav-link" href="siseoulList.do" style="color: white; font-weight: bold;">점검결과작성</a>
                                </li>
                                
                                <li class="nav-item">
                              	  <a class="nav-link" href="siseoulInspectionList.do" style="color: white; font-weight: bold;">점검이력조회</a>
                                </li>
                                
                            <!--     <li class="nav-item">
                              	  <a class="nav-link" href="faBreak" style="color: white; font-weight: bold;">점검이력통계</a>
                                </li> -->

                                <li class="nav-item">
                              	  <a class="nav-link" href="troubleList.do" style="color: white; font-weight: bold;" >고장/조치결과보고</a>
                                </li>

                            </ul>
                            </div> 
                    	
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active">
                                	<a class="nav-link" href="#!" style="color: white;">사이트맵 &nbsp;|</a>
                                </li>
                                
                                <li class="nav-item">
                              	  <a class="nav-link" href="#!" style="color: white;">
	                              	  <% if(session.getAttribute("user_id") != null) {
										 String user_name = (String)session.getAttribute("user_name"); 
										 out.println(user_name); 
									   } else {
										 out.println("");
									   }
									  %> 님 &nbsp;|</a>
                                </li>
                                
                                <li class="nav-item">
                              	  <a class="nav-link" href="logout.do" style="color: white;">로그아웃</a>
                                </li>
                                
                            </ul>
                        </div>
                    
                    </div>
                </nav>               
			<!-- 내용시작 -->	
				
      