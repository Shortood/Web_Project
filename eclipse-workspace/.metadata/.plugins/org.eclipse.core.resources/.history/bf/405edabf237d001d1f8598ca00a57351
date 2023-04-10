<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="recipe-read.jsp"></jsp:include>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		String sql = "select * from comments where id=" + id;
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	%>
	<form action="comment-modify-db.jsp?id=<%=id%>&ref=<%=ref%>"
		method="post">
		<div class="makereply">
			<input type="text" name="write" placeholder="댓글 수정..." />
			<button type="submit">등록</button>
		</div>
		<br>
	</form>
</body>
</html>