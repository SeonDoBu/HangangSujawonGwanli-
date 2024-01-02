<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  String user_id   = "";
	String user_name = "";
	String user_role = "";
	
	if(session.getAttribute("user_id") != null) {
		user_id   = (String)session.getAttribute("user_id");
		user_name = (String)session.getAttribute("user_name");
		user_role = String.valueOf(session.getAttribute("user_role")); 
		/* 
		if(user_role == "3") {
			
		} else {
			ModelAndView modelAndView = new ModelAndView("redirect:home.do");
		} */
	}	
%>
	<div class="admin-topbar-box">
		<div class="row row-col-2 admin-topbar-text-box">
			<div class="cols admin-topbar-text-first">
				<p><a href="adminInfo.do" style="text-decoration: none; color: white;">관리자시스템</a></p>
			</div>
			<div class="cols admin-topbar-text-second">
				<p>관리자 <% out.println(user_name); %> 님 &nbsp;&nbsp;|&nbsp;&nbsp;
				   <a href="logout.do" style="text-decoration: none; color: white;">로그아웃</a></p>
			</div>
		</div>
	</div>