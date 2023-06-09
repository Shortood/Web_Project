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
	<%
	Connection conn = null;
	Statement stmt = null;
	String sql = null;
	ResultSet rs = null;
	String name = getCookieValue(cookies, "NAME");
	String id = getCookieValue(cookies, "ID");
	String email = "";
	int year = 0, month = 0, date = 0;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sql = "select * from user where name='" + name + "'";
		rs = stmt.executeQuery(sql);
		rs.next();
		email = rs.getString("email");
		year = Integer.parseInt(rs.getString("year"));
		month = Integer.parseInt(rs.getString("month"));
		date = Integer.parseInt(rs.getString("date"));
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	%>
	<div id="wrap">
		<div id="head">
			<a href="mainpage.jsp">허브 레시피</a>
		</div>

		<div id="section">
			<div class="section_content">
				<div class="section_title">마이페이지</div>
			</div>
			<div class="section_content">
				<div class="section_subTitle">회원 정보</div>
				<ul>
					<li><a href="mypage.jsp">나의 정보</a></li>
					<li><a href="my-modify.jsp">정보 수정</a></li>
				</ul>
			</div>
			<div class="section_content">
				<div class="section_subTitle">레시피</div>
				<ul>
					<li>My 레시피</li>
					<li>좋아요 누른 레시판</li>
				</ul>
			</div>
		</div>

		<div id="main">
			<div class="main_content">
				<h1 style="color: cadetblue">나의 정보</h1>
				고객님께서 가입하신 맛있는 요리법 회원 정보입니다.<br> <br> 닉네임: <b><%=name%></b>
				<!-- 사용자 tb에서 받아옴 -->
			</div>
			<div class="main_content">
				<table>
					<tr>
						<td>올린글</td>
						<td>15개</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><%=id%></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><%=email%></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><%=year%>.<%=month%>.<%=date%></td>
					</tr>
				</table>
			</div>
			<div class="main_content">
				<hr>
				찜한 레시피
				<hr>
				<ul>
					<li>박재형의 제육볶음 레시피</li>
					<!--DB에서 찜한 레시피 가져옴-->
					<li>강우빈의 잔치국수 레시피</li>
				</ul>
			</div>
		</div>
	</div>
	<%
	stmt.close();
	conn.close();
	%>
</body>
</html>
<%!private String getCookieValue(Cookie[] cookies, String name) {
		String value = null;
		if (cookies == null)
			return null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(name))
				return cookie.getValue();
		}
		return null;
	}%>