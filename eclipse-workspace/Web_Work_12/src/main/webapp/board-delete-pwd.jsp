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
	<%
	int id;
	String passwd = "";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	id = Integer.parseInt(request.getParameter("id"));

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/wptest?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		String sql = "select * from board_tbl where id=" + id;
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}

	while (rs.next()) {
		passwd = rs.getString("passwd");
	}

	if (passwd.equals(""))
		response.sendRedirect("board-delete-db.jsp?id=" + id);
	%>
	<center>
		<h2>패스워드를 입력하시오</h2>
		<form action="board-delete-db.jsp?id=<%=id%>" method="post">
			<table border="0" width="500">
				<tr>
					<td width="100"><img src="image/ball.gif"> 패스워드:</td>
					<td><input type="text" name="passwd" style="width: 200px;" /></td>
				</tr>
			</table>
			<br> <input type="submit" value="삭제하기" /> <input type="reset"
				value="다시쓰기" />
		</form>

		<img src="image/green_tree.gif"> <a href="board-list.jsp">
			수정 취소</a>
	</center>

</body>
</html>