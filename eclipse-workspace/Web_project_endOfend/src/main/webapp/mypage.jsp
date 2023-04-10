<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
Cookie[] cookies = request.getCookies();
%>
<%
request.setCharacterEncoding("utf-8");
%>

<html>
<head>
<title>Insert title here</title>
<link href="mypage.css" rel="stylesheet">
</head>
<body>
	<div id="wrap">
		<div id="head">
			<image src=" "> </image>
			<a href="mainpage.jsp">허브 레시피</a>
		</div>
		<hr>

		<div id="section">
			<div class="section_content">
				<div class="section_title">마이페이지</div>
			</div>
			<div class="section_content">
				<div class="section_subTitle">회원 정보</div>
				<ul>
					<li><a href="my-info.jsp">나의 정보</a></li>
					<li><a href="my-modify.jsp">정보 수정</a></li>
				</ul>
			</div>
			<div class="section_content">
				<div class="section_subTitle">레시피</div>
				<ul>
					<li><a href="myrecipe-list.jsp">My 레시피</a></li>
					<li><a href="like-list.jsp">좋아요 누른 게시판</a></li>
				</ul>
			</div>
		</div>
</body>
</html>