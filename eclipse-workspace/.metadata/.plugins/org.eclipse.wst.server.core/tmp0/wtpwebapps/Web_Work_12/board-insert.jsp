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
	String flag = "", reply = null;
	int ref = 0;
	if (request.getParameter("ref") != null) {
		reply = "y";
		flag = request.getParameter("flag");
		ref = Integer.parseInt(request.getParameter("ref"));
	}
	%>
	<center>
		<h2>게 시 판</h2>
		<form action="board-insert-db.jsp?reply=<%=reply%>&ref=<%=ref%>"
			method="post">
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
				<tr>
					<td width="100"><img src="image/ball.gif"> 패스워드:</td>
					<td><input type="password" name="passwd" style="width: 100px;" /></td>
				</tr>
			</table>
			<br> <input type="submit" value="등록하기" /> <input type="reset"
				value="다시쓰기" />
		</form>

		<img src="image/green_tree.gif"> <a href="board-list.jsp">
			게시글 목록 보기</a>
	</center>
</body>
</html>