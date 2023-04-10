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
	String passwd = "", sql, sql1;
	String name, e_mail, title, content, reply;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	id = Integer.parseInt(request.getParameter("id"));
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

	name = request.getParameter("name");
	e_mail = request.getParameter("e_mail");
	title = request.getParameter("title");
	content = request.getParameter("content");
	if (request.getParameter("passwd") != null)
		passwd = request.getParameter("passwd");
	while (rs.next()) {
		if (!passwd.equals(rs.getString("passwd"))) {
	%>
	<center>
		<h2>잘못 입력된 패스워드입니다.</h2>
		<img src="image/green_tree.gif"> <a
			href="board-modify-pwd.jsp?id=<%=id%>">뒤로</a>
	</center>
	<%
	} else {
	%>

	<center>
		<h2>게시글 수정</h2>
		<form action="board-modify-db.jsp?id=<%=id%>" method="post">
			<table border="0" width="500">
				<tr>
					<td width="100"><img src="image/ball.gif"> 글 쓴 이:</td>
					<td><input type="text" name="name" style="width: 150px;" /></td>
				</tr>
				<tr>
					<td width="100"><img src="image/ball.gif"> 메일주소:</td>
					<td><input type="text" name="e_mail" style="width: 200px;" /></td>
				</tr>
				<tr>
					<td width="100"><img src="image/ball.gif"> 글 제 목:</td>
					<td><input type="text" name="title" style="width: 250px;" /></td>
				</tr>
				<tr>
					<td width="100"><img src="image/ball.gif"> 글 내 용:</td>
					<td><input type="textarea" name="content"
						style="width: 400px; height: 50px;" /></td>
				</tr>
			</table>
			<br> <input type="submit" value="등록하기" /> <input type="reset"
				value="다시쓰기" />
		</form>
		<img src="image/green_tree.gif"> <a href="board-list.jsp">
			취소</a>
	</center>
	<%
	}
	}
	%>
</body>
</html>