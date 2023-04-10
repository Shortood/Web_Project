<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<body>
	<%
	int id;
	String passwd = "", sql, sql1;
	String name, e_mail, title, content, reply;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	id = Integer.parseInt(request.getParameter("id"));

	name = request.getParameter("name");
	e_mail = request.getParameter("e_mail");
	title = request.getParameter("title");
	content = request.getParameter("content");
	passwd = request.getParameter("passwd");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/wptest?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		sql = "select * from board_tbl where id=" + id;
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	%>
	<%
	sql1 = "update board_tbl set name='" + name + "', e_mail='" + e_mail + "', title='" + title + "', content='" + content
			+ "' where id = " + id;
	try {
		stmt.executeUpdate(sql1);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	%>
	<center>
		<h2>게시글이 수정되었습니다</h2>
		<img src="image/green_tree.gif"> <a
			href="board-read.jsp?id=
			<%=id%>">작성한 글 확인</a> <img
			src="image/green_tree.gif"> <a href="board-list.jsp"> 게시글
			목록 보기</a>
	</center>

</body>
</html>