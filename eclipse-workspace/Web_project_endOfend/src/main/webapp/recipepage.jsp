<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
Cookie[] cookies = request.getCookies();
%>
<html>
<head>
<title>main page</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="recipepage.css">
</head>
<body>
	<jsp:include page="maintools.jsp"></jsp:include>
	<%
	int pagenum = 1;
	if (request.getParameter("page") != null) {
		pagenum = Integer.parseInt(request.getParameter("page"));
	}
	int fpage = pagenum * 8, bpage = (pagenum - 1) * 8;
	int ref;
	int id;
	String name = getCookieValue(cookies, "NAME"), sel = "head";
	int rownum = 0;
	Connection conn = null;
	Statement stmt = null, stmt2 = null;
	String sql = null, sql2 = null, sql3 = null;
	ResultSet rs = null, rs2 = null;
	String name2 = null;
	String search = "";
	if (request.getParameter("search") != null)
		search = request.getParameter("search");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sql = "select * from recipe where tag like '%" + search + "%'order by id desc limit " + 8 + " offset " + bpage;
		sql2 = "select * from recipe where tag like '%" + search + "%' order by id desc";
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
			<div class="contents">
				<table class="category">
					<tr>
						<th class="name">카테고리</th>
						<td><a href="recipepage-search.jsp?search=한식&sel=<%=sel%>">한식</a>
							<a href="recipepage-search.jsp?search=중식&sel=<%=sel%>">중식</a> <a
							href="recipepage-search.jsp?search=일식&sel=<%=sel%>">일식</a> <a
							href="recipepage-search.jsp?search=양식&sel=<%=sel%>">양식</a></td>
					</tr>
					<tr>
						<th class="name">요리목적</th>
						<td><a href="recipepage-search.jsp?search=아침&sel=<%=sel%>">아침</a>
							<a href="recipepage-search.jsp?search=점심&sel=<%=sel%>">점심</a> <a
							href="recipepage-search.jsp?search=저녁&sel=<%=sel%>">저녁</a> <a
							href="recipepage-search.jsp?search=야식&sel=<%=sel%>">야식</a> <a
							href="recipepage-search.jsp?search=간식&sel=<%=sel%>">간식</a> <a
							href="recipepage-search.jsp?search=술안주&sel=<%=sel%>">술안주</a> <a
							href="recipepage-search.jsp?search=다이어트&sel=<%=sel%>">다이어트</a> <a
							href="recipepage-search.jsp?search=벌크업&sel=<%=sel%>">벌크업</a> <a
							href="recipepage-search.jsp?search=비건&sel=<%=sel%>">비건</a></td>

					</tr>
					<tr>
						<form action="recipepage-search.jsp?sel=<%=sel%>" method="post">
							<th class="name">요리재료</th>
							<td><a href="recipepage-search.jsp?search=돼지고기&sel=<%=sel%>">돼지고기</a>
								<a href="recipepage-search.jsp?search=닭고기&sel=<%=sel%>">닭고기</a>
								<a href="recipepage-search.jsp?search=소고기&sel=<%=sel%>">소고기</a>
								<a href="recipepage-search.jsp?search=생선&sel=<%=sel%>">생선</a> <a
								href="recipepage-search.jsp?search=해산문&sel=<%=sel%>">해산물</a> <a
								href="recipepage-search.jsp?search=쌀&sel=<%=sel%>">쌀</a> <a
								href="recipepage-search.jsp?search=밀가루&sel=<%=sel%>">밀가루</a> <a
								href="recipepage-search.jsp?search=채소류&sel=<%=sel%>">채소류</a> 검색:<input
								type="text" name="search"
								onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit}">
						</form>
						</td>
					</tr>
				</table>
			</div>
			<div class="semitag">
				<table>
					<tr>
						<td>
							<form action="recipepage-search.jsp" method="post">
								<select name="sel" onchange="this.form.submit()">
									<option value='head' selected>최신순</option>
									<option value='writer'>인기순</option>
								</select>
							</form>
						</td>
						<%
						if (name != null) {
						%>
						<td><button onclick="location.href='makerecipe.jsp'">게시글
								쓰기</button></td>
						<%
						}
						%>
					</tr>
				</table>
			</div>
			<div class="menulist">
				<%
				String image;
				int cnt = 0;
				%>
				<table class="foods">
					<tr>
						<%
						while (rs.next()) {
							image = rs.getString("image");
							if (cnt % 4 == 0 && cnt != 0) {
						%>
					</tr>
					<tr>
						<%
						}
						%>
						<td><img src="recipefolder/<%=image%>" class="food"><br>
							<a href="recipe-read.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("menu_name")%></a>
							<div class="info">
								조회수:<%=Integer.parseInt(rs.getString("view"))%>
								<%
								id = Integer.parseInt(rs.getString("id"));
								sql3 = "select * from likelist where id=" + id + " and name='" + name + "'";
								try {
									rs2 = stmt2.executeQuery(sql3);
								} catch (Exception e) {
									out.println("DB 연동 오류입니다. :" + e.getMessage());
								}
								if (rs2.next()) {
								%>
								<a
									href="dis-like-db.jsp?id=<%=rs.getString("id")%>&likes=<%=rs.getString("likes")%>&page=<%=pagenum%>">
									♥ <%=Integer.parseInt(rs.getString("likes"))%></a>
								<%
								} else {
								%>
								<a
									href="add-like-db.jsp?id=<%=rs.getString("id")%>&likes=<%=rs.getString("likes")%>&page=<%=pagenum%>">
									♡ <%=Integer.parseInt(rs.getString("likes"))%></a>
								<%
								}
								%>
							</div></td>
						<%
						cnt++;
						}
						%>
					</tr>
				</table>
			</div>
			<%
			if (name != null) {
			%>
			<%
			}
			%>
			<br>
			<center>
				<%
				sql2 = "select * from recipe where tag like '%" + search + "%'";
				rs = stmt.executeQuery(sql2);
				rs.last();
				rownum = rs.getRow();
				for (int i = 1; i <= (rownum - 1) / 8 + 1; i++) {
				%>
				<a href="recipepage.jsp?page=<%=i%>" class="num_selected"> <%
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
				stmt.close();
				stmt2.close();
				conn.close();
				%>
			</center>
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