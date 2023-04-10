<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%
request.setCharacterEncoding("utf-8");
Cookie[] cookies = request.getCookies();
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn = null;
	Statement stmt = null;
	String sql = null, sql2 = null;
	String sel = "head", search = "";
	ResultSet rs = null;
	int id = Integer.parseInt(request.getParameter("id"));
	String name = getCookieValue(cookies, "NAME");
	int pagenum = Integer.parseInt(request.getParameter("page"));
	if (request.getParameter("sel") != null)
		sel = request.getParameter("sel");
	if (request.getParameter("search") != null)
		search = request.getParameter("search");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		out.println(name + " " + id);
		sql = "select * from likelist where id=" + id + " and name='" + name + "'";
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동    오류입니다. : " + e.getMessage());
	}

	if (rs.next()) {
		int likes = Integer.parseInt(request.getParameter("likes"));
		likes--;
		sql2 = "delete from likelist where id=" + id + " and name='" + name + "'";
		try {
			stmt.executeUpdate(sql2);
		} catch (Exception e) {
			out.println("DB 연동 오류입니다. :" + e.getMessage());
		}
		sql2 = "update recipe set likes=" + likes + " where id=" + id;
		try {
			stmt.executeUpdate(sql2);
		} catch (Exception e) {
			out.println("DB 연동 오류입니다. :" + e.getMessage());
		}
		//out.println(search+" /"+sel);
		search = URLEncoder.encode(search, "UTF-8");
		response.sendRedirect("recipepage-search.jsp?search=" + search + "&sel=" + sel + "&page=" + pagenum);
	} else {
	%>
	<center>
		<h2>이미 좋아요를 취소하셨습니다</h2>
		<a
			href="recipepage-search.jsp?search=<%=search%>&sel=<%=sel%>&page=<%=pagenum%>">계속</a>
	</center>
	<%
	}
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