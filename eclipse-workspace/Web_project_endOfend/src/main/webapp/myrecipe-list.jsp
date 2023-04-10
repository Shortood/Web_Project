<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
Cookie[] cookies = request.getCookies();
%>
<html>
<head>
<title>공지사항</title>
<link rel="stylesheet" href="myrecipe-list.css">
</head>
<body>
	<jsp:include page="mypage.jsp"></jsp:include>
	<%
	int pagenum = 1;
	if (request.getParameter("page") != null) {
		pagenum = Integer.parseInt(request.getParameter("page"));
	}
	int fpage = pagenum * 10, bpage = (pagenum - 1) * 10;
	//int ref;
	int id;
	String name = getCookieValue(cookies, "NAME");
	int rownum = 0;
	Connection conn = null;
	Statement stmt = null;
	String sql = null, sql2 = null;
	ResultSet rs = null;
	String name2 = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sql = "select * from recipe where name ='" + name + "'order by id desc limit " + 10 + " offset " + bpage;
		sql2 = "select * from recipe where name ='" + name + "' order by id desc";
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동   오류입니다. : " + e.getMessage());
	}
	rs.last();
	rownum = rs.getRow();
	rs.beforeFirst();
	%>
	<div id="main">
		<div class="main_content">
			<h1>My 레시피</h1>
			내가 올린 레시피들을 볼 수 있습니다.
		</div>
		<hr>
		<br>
		<div>
			<table class="mainboard">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<%
				int i = rownum;
				while (rs.next()) {
					id = Integer.parseInt(rs.getString("id"));
				%>
				<tr>
					<td align="center" height="40"><%=rownum%></td>
					<td align="center" height="40"><a
						href="recipe-read.jsp?id=<%=rs.getString("id")%>" width="250">
							<%=rs.getString("menu_name")%></a></td>
					<td align="center" height="40"><%=rs.getString("name")%></td>
					<td align="center" height="40"><%=rs.getString("date")%></td>
				</tr>
				<%
				rownum--;
				}
				%>
			</table>
		</div>
		<br> <br>
		<div class="pageButton">
			<%
			sql2 = "select * from recipe where name ='" + name + "'";
			rs = stmt.executeQuery(sql2);
			rs.last();
			rownum = rs.getRow();
			for (i = 1; i <= (rownum - 1) / 10 + 1; i++) {
			%>
			<a href="myrecipe-list.jsp?page=<%=i%>" class="num selected"> <%
 if (i == pagenum) {
 %><b> <%=i%></b> <%
 } else {
 %> <%=i%> <%
 }
 %>
			</a>
			<%
			;
			}
			%>
		</div>
	</div>
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
