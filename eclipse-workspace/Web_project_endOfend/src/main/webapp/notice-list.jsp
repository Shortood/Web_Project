<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
Cookie[] cookies = request.getCookies();
%>
<html>
<head>
<title>공지사항</title>
<link rel="stylesheet" href="notice.css">
</head>
<body>
	<jsp:include page="maintools.jsp"></jsp:include>
	<%
	int pagenum = 1;
	if (request.getParameter("page") != null) {
		pagenum = Integer.parseInt(request.getParameter("page"));
	}
	int fpage = pagenum * 10, bpage = (pagenum - 1) * 10;
	int ref;
	String id;
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
		sql = "select * from notice order by ref desc, id asc limit " + 10 + " offset " + bpage;
		sql2 = "select * from notice order by ref desc, id asc";
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동   오류입니다. : " + e.getMessage());
	}
	rs.last();
	rownum = rs.getRow();
	rs.beforeFirst();
	%>
	<div id="wrap">
		<div id="main">
			<div class="content">
				<table class="title">
					<tr>
						<td class="notice"><a href="notice-list.jsp">공지사항</a></td>
					</tr>
				</table>
				<div class="semitag">
					<br>
					<table>
						<tr>
							<td class="search">
								<form action="notice-search.jsp" method="post">
									<select name="type">
										<option value='' selected>전체</option>
										<option value='head'>제목</option>
										<option value='writer'>내용</option>
									</select> <input type="text" name="search_form"
										onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit}" />
								</form>
							</td>
					</table>
					<table class="mainboard">
						<tr bgcolor="#f3e0ac">
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
						<%
						int i = rownum;
						while (rs.next()) {
							id = rs.getString("id");
							ref = Integer.parseInt(rs.getString("ref"));
						%>
						<tr>
							<td align="center" height="40"><%=rownum%></td>
							<td align="left" height="40"><a
								href="notice-read.jsp?ref=<%=rs.getString("ref")%>" width="250">
									<%=rs.getString("title")%></a></td>
							<td align="center" height="40"><%=rs.getString("name")%></td>
							<td align="center" height="40"><%=rs.getString("date")%></td>
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
					sql2 = "select * from notice order by ref desc, id asc";
					rs = stmt.executeQuery(sql2);
					rs.last();
					rownum = rs.getRow();
					for (i = 1; i <= (rownum - 1) / 10 + 1; i++) {
					%>
					<a href="notice-list.jsp?page=<%=i%>" class="num selected"> <%
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
				</div>
				<br>
				<%
				try {
					sql = "select * from manager";
					rs = stmt.executeQuery(sql);
					name2 = getCookieValue(cookies, "NAME");
				} catch (Exception e) {
					out.println("DB 연동 오류입니다. : " + e.getMessage());
				}
				while (rs.next()) {
					String name = rs.getString("name");
					if (name.equals(name2)) {
				%>
				<div class="owner">
					<button onclick="location.href='notice-insert.jsp'">게시글 쓰기</button>
				</div>
				<%
				break;
				}
				}
				stmt.close();
				conn.close();
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