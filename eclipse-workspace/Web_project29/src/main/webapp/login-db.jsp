<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
</head>
<body>
	<%
	String id, passwd;
	boolean flag;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null, rs2 = null;
	id = request.getParameter("id");
	passwd = request.getParameter("passwd");
	flag = false;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		String sql = "select * from user where id='" + id + "'";
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}

	while (rs.next()) {
		if (id.equals(rs.getString("id")) && passwd.equals(rs.getString("passwd"))) {
			flag = true;
			response.addCookie(new Cookie("NAME", rs.getString("name")));
			response.addCookie(new Cookie("E_MAIL", rs.getString("email")));
			response.addCookie(new Cookie("ID", rs.getString("id")));
			if (session.isNew()) {
		session.setAttribute("id", id);
			}
			response.sendRedirect("mainpage.jsp");
		}
	}
	try {
		String sql2 = "select * from manager where id='" + id + "'";
		rs2 = stmt.executeQuery(sql2);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	while (rs2.next()) {
		if (id.equals(rs2.getString("id")) && passwd.equals(rs2.getString("passwd"))) {
	flag = true;
	response.addCookie(new Cookie("NAME", rs2.getString("name")));
	response.addCookie(new Cookie("E_MAIL", rs2.getString("email")));
	response.addCookie(new Cookie("ID", rs2.getString("id")));
	response.sendRedirect("mainpage.jsp");
	}
	}
	if (flag == false) {
	%>
	out.println("<script>alert('잘못된 아이디나 비밀번호 입니다'); location.href='login.jsp';</script>"); out.flush();
	<%
	}
	stmt.close();
	conn.close();
	%>
</body>
</html>