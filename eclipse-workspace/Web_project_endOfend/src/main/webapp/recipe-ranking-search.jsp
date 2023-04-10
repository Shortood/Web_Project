<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
Cookie[] cookies = request.getCookies();
%>
<html>
<head>
<title>랭킹</title>
<link rel="stylesheet" href="notice.css">
</head>
<body>
	<%
	String sel = request.getParameter("sel");
	%>
	<jsp:include page="maintools.jsp"></jsp:include>
	<div id="wrap">
		<div id="main">
			<div class="content">
				<br>
				<table class="title">
					<tr>
						<td class="notice"><a href="recipe-ranking.jsp">랭킹</a></td>
					</tr>
				</table>
				<br>
				<div class="semitag">
					<table>
						<tr>
							<td>
								<form action="recipe-ranking-search.jsp" method="post">
									<select name="sel" onchange="this.form.submit()">
										<%
										if (sel.equals("viewnum")) {
										%>
										<option value='viewnum' selected>조회수</option>
										<option value='likenum'>인기수</option>
										<%
										} else {
										%><option
											value='viewnum'>조회수</option>
										<option value='likenum' selected>인기수</option>
										<%
										}
										%>
									</select>
								</form>
							</td>
						</tr>
					</table>
				</div>
				<table class="mainboard">
					<tr bgcolor="#f3e0ac">
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<%
						if (sel.equals("viewnum")) {
						%><th>조회수</th>
						<%
						} else {
						%><th>좋아요수</th>
						<%
						}
						%>
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
					try {
						Class.forName("com.mysql.jdbc.Driver");
						String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
						conn = DriverManager.getConnection(url, "root", "0000");
						stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
						if (sel.equals("viewnum")) {
							sql = "select * from recipe order by view desc, id asc limit " + 10 + " offset " + bpage;
						} else if (sel.equals("likenum")) {
							sql = "select * from recipe order by likes desc, id asc limit " + 10 + " offset " + bpage;
						}
						rs = stmt.executeQuery(sql);
					} catch (Exception e) {
						out.println("DB 연동 오류입니다. : " + e.getMessage());
					}
					rs.last();
					rownum = rs.getRow();
					rs.beforeFirst();
					int i = rownum;
					while (rs.next()) {
						id = Integer.parseInt(rs.getString("id"));
					%>
					<tr>
						<td align="center" height="40"><%=rownum%></td>
						<td align="left" height="40"><a
							href="recipe-read.jsp?id=<%=rs.getString("id")%>" width="250">
								<%=rs.getString("menu_name")%></a></td>
						<td align="center" height="40"><%=rs.getString("name")%></td>
						<td align="center" height="40"><%=rs.getString("date")%></td>
						<%
						if (sel.equals("viewnum")) {
						%>
						<td align="center" height="40"><%=rs.getString("view")%></td>
						<%
						} else {
						%><td align="center"
							height="40"><%=rs.getString("likes")%></td>
						<%
						}
						%>
					</tr>
					<%
					rownum--;
					}
					%>
				</table>
			</div>
			<br> <br>
			<div class="pageButton">
				<%
				sql = "select * from recipe";
				try {
					rs = stmt.executeQuery(sql);
				} catch (Exception e) {
					out.println("DB 연동 오류입니다. : " + e.getMessage());
				}
				rs.last();
				rownum = rs.getRow();
				for (i = 1; i <= (rownum - 1) / 10 + 1; i++) {
				%>
				<a href="recipe-ranking-search.jsp?page=<%=i%>&sel=<%=sel%>"
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
			</div>
			<br>
			<%
			if (getCookieValue(cookies, "NAME") != null) {
			%>
			<%
			}
			%>
		</div>
	</div>
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