<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<body>
	<%
	int ref;
	String passwd = "", sql, sql1;
	String name, e_mail, title, content, reply;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	ref = Integer.parseInt(request.getParameter("ref"));

	title = request.getParameter("title");
	content = request.getParameter("content");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		sql = "select * from notice where ref=" + ref;
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	if (title.length() > 40 || content.length() > 500 || title.length() == 0) {
	%>
	<center>
		<h2>길이를 지켜주세요</h2>
		<a href="board-insert.jsp">뒤로</a>
	</center>
	<%
	} else {
	sql1 = "update notice set title='" + title + "', content='" + content + "' where ref = " + ref;
	try {
		stmt.executeUpdate(sql1);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	stmt.close();
	conn.close();
	}
	out.println("<script>alert('공지사항이 수정되었습니다'); location.href='notice-list.jsp';</script>");
	out.flush();
	%>
</body>
</html>