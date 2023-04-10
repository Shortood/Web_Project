<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@page import="java.util.TimeZone"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
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
	int id = Integer.parseInt(request.getParameter("id")), cnt, new_id = 0;
	int ref = Integer.parseInt(request.getParameter("ref"));
	String myname = getCookieValue(cookies, "NAME");
	String content = request.getParameter("write");
	DateFormat format1 = new SimpleDateFormat("yyyy.MM.dd HH:mm");
	TimeZone t = TimeZone.getTimeZone("Asia/Seoul");
	format1.setTimeZone(t);
	Date date = new Date();
	String time = format1.format(date);
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		String sql = "update comments set content='" + content + "', date ='" + time + "' where ref = " + ref;
		stmt.executeUpdate(sql);

	} catch (Exception e) {
		out.println("DB 연동 오류입니다.:" + e.getMessage());
	}

	response.sendRedirect("recipe-read.jsp?id=" + id);
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