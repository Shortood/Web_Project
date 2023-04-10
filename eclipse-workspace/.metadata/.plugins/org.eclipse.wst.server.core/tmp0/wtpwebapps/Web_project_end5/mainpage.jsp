<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
Cookie[] cookies = request.getCookies();
%>
<html>
<head>
<title>main page</title>
<link rel="stylesheet" href="mainpage.css">
</head>
<body>
	<jsp:include page="maintools.jsp"></jsp:include>
	<div id="wrap">
	<div id="main">
	<div id="content">
	<div class="menulist">
		<h2 class="ad_1">Most View</h2>
		<table class="foods">
			<tr>
				<%
				Connection conn = null;
				Statement stmt = null;
				String sql = null;
				ResultSet rs = null;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
					conn = DriverManager.getConnection(url, "root", "0000");
					stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					sql = "select * from recipe order by view desc limit " + 4 + " offset " + 0;
					rs = stmt.executeQuery(sql);
				} catch (Exception e) {
					out.println("DB 연동 오류입니다. : " + e.getMessage());
				}
				while (rs.next()) {
				%>
				<td class="menuname"><a
					href="recipe-read.jsp?id=<%=rs.getString("id")%>"><img
						src="recipefolder/<%=rs.getString("image")%>" class="food"><br>
						<br><%=rs.getString("menu_name")%></a></td>
				<%
				}
				%>
			</tr>
		</table>
	</div>
	<br>
	<hr>
	<h2 class="ad_1">Most Like</h2>
	<%
	try {
		sql = "select * from recipe order by likes desc limit " + 4 + " offset " + 0;
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	%>
	<div class="menuname">
		<table class="foods">
			<tr>
				<%
				while (rs.next()) {
				%>
				<td class="menuname"><a
					href="recipe-read.jsp?id=<%=rs.getString("id")%>"><img
						src="recipefolder/<%=rs.getString("image")%>" class="food"><br>
						<br><%=rs.getString("menu_name")%></a></td>
				<%
				}
				%>
			</tr>
		</table>
	</div>
	</div>
   </div>
</div>
</body>
</html>
