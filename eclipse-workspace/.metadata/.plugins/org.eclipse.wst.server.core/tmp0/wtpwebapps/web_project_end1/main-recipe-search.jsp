<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
Cookie[] cookies = request.getCookies();
%>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" href="notice.css">
</head>
<body>
<jsp:include page="maintools.jsp"></jsp:include>
<div id="wrap">
	<div id="main">
	<div class="content">
	<table class="title">
					<tr>
						<td class="notice"><a href="board-list.jsp">레시피 목록</a></td>
					</tr>
				</table><br>
	<div class="semitag">
				<table>
				<tr>
				<td class="search">
		<form action="main-recipe-search.jsp" method="post">
				<select name="type">
					<option value='head'selected>제목</option>
				</select> <input type="text" name="search_context"
					onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit}" />
		</form></td></tr></table>
	</div>
	<table class="mainboard">
		<tr bgcolor="#f3e0ac">
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<%
		int pagenum = 1;
		if (request.getParameter("page") != null) {
			pagenum = Integer.parseInt(request.getParameter("page"));
		}
		int fpage = pagenum * 10, bpage = (pagenum - 1) * 10;
		int id;
		int rownum = 0;
		Connection conn = null;
		Statement stmt = null;
		String sql = null, sql2 = null;
		ResultSet rs = null;
		String name2 = null;
		String search = "";
		if (request.getParameter("search_context") != null)
			search = request.getParameter("search_context");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "root", "0000");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

			sql = "select * from recipe where menu_name like '%" + search + "%'order by id desc, id asc limit " + 10
			+ " offset " + bpage;
			sql2 = "select * from recipe where menu_name like '%" + search + "%'";
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			out.println("DB 연동 오류입니다. : " + e.getMessage());
		}

		rs.last();
		rownum = rs.getRow();
		rs.beforeFirst();
		int i;
		while (rs.next()) {
			id = Integer.parseInt(rs.getString("id"));
		%>
		<tr>
			<td align="center" height="40"><%=rownum%></td>
			<td align="left" height="40"><a
				href="recipe-read.jsp?id=<%=rs.getString("id")%>" width="250"> <%=rs.getString("menu_name")%></a></td>
			<td align="center" height="40"><%=rs.getString("name")%></td>
			<td align="center" height="40"><%=rs.getString("date")%></td>
		</tr>
		<%
		rownum--;
		}
		%>
	</table>
	</div>
	<br>
	<br>
	<div class="pageButton">
		<%
		rs = stmt.executeQuery(sql2);
		rs.last();
		rownum = rs.getRow();
		for (i = 1; i <= (rownum-1) / 10 + 1; i++) {
		%>
		<a href="main-recipe-search.jsp?page=<%=i%>&search_context=<%=search%>"
			class="num selected"> <%
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

		<%
		stmt.close();
		conn.close();
		%>
		<br> <br>
	</div>
	</div>
	</div>
</body>
</html>