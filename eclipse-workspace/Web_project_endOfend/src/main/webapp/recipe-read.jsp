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
<link rel="stylesheet" href="recipe-read1.css">
</head>
<body>
	<jsp:include page="maintools.jsp"></jsp:include>
	<%
	String managername = "";
	int ref = 0, id = 0, view = 0, likes;
	String name = "";
	String date = "", ingredient = "", tag = "", image = "", step_explain = "";
	String recipename = "", menu_name = "", content = "", menu_explain = "";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String myname = getCookieValue(cookies, "NAME");
	id = Integer.parseInt(request.getParameter("id"));

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		String sql = "select * from manager";
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동    오류입니다. : " + e.getMessage());
	}
	if (rs.next()) {
		managername = rs.getString("name");
	}

	try {
		String sql = "select * from recipe where id=" + id;
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	if (rs != null) {
		rs.next();
		name = rs.getString("name");
		menu_name = rs.getString("menu_name");
		menu_explain = rs.getString("menu_explain");
		menu_explain = menu_explain.replace("\r\n", "<br>");
		step_explain = rs.getString("step_explain");
		step_explain = step_explain.replace("\r\n", "<br>");
		date = rs.getString("date");
		ingredient = rs.getString("ingredient");
		tag = rs.getString("tag");
		image = rs.getString("image");
		view = Integer.parseInt(rs.getString("view"));
		view++;
		likes = Integer.parseInt(rs.getString("likes"));
	}
	%>
	<div id="wrap">
		<div id="main">
			<div class="contents">
				<div class="content">
					<img src="recipefolder/<%=image%>" class="food">
					<h1><%=name%>님의
						<%=menu_name%></h1>
					<h2><%=menu_explain%></h2>
				</div>
				<br> <br>
				<hr>
				<div class="ingredient">
					<h3>재료</h3>
					<p>
						<%
						String sql1 = "update recipe set view=" + view + " where id =" + id;
						try {
							stmt.executeUpdate(sql1);
						} catch (Exception e) {
							out.println("DB 연동 오류입니다. : " + e.getMessage());
						}
						String ingr[] = ingredient.split("&");
						for (int i = 0; i < ingr.length; i++) {
							String pout[] = ingr[i].split("/");
							if (pout.length > 0) {
						%>
						<%=pout[0]%>
						<br>
						<%
						}
						if (pout.length > 1) {
						%>
						<%=pout[1]%><br>
						<%
						}
						}
						%>
					</p>
				</div>
				<br>
				<hr>
				<div class="make">
					<h3>요리 방법</h3>
					<table>
						<%
						String explain[] = step_explain.split("&");
						String sql = "select * from images where id=" + id + " order by ref desc";
						int cnt = 0;
						rs = stmt.executeQuery(sql);
						while (rs.next() && (cnt < explain.length)) {
							image = rs.getString("image");
						%>
						<tr>
							<td><%=cnt + 1%>.</td>
							<td><img src="recipefolder/<%=image%>" class="food"></td>
							<td><%=explain[cnt]%></td>
						</tr>
						<%
						cnt++;
						}
						%>
					</table>
				</div>
				<br>
				<hr>
				<%
				String tags[] = tag.split("#");
				%>
				<div class="hashtag">
					<table>
						<tr>
							<th># 태그</th>
							<%
							for (int i = 0; i < tags.length; i++) {
							%>
							<td><%=tags[i]%></td>
							<%
							}
							%>
						</tr>
					</table>
				</div>
				<hr>
				<div class="buttons">
					<%
					if (name.equals(myname) || managername.equals(myname)) {
					%>
					<form action="recipe-modify.jsp?id=<%=id%>" method="post">
						<input type="submit" value="수정하기">
					</form>
					<form action="recipe-delete-db.jsp?id=<%=id%>" method="post">
						<input type="submit" value="삭제하기">
					</form>
				</div>
				<%
				}
				%>
				<div class="empty_space"></div>
				<div class="empty_space"></div>
				<div class="empty_space"></div>

				<div id="reply_title">
					<big><b>댓글</b></big>
				</div>
				<div class="makereply">
					<form action="comment-insert-db.jsp?id=<%=id%>" method="post">
						<%
						if (myname != null) {
						%>
						<input type="textarea" name="write"
							placeholder="주제와 무관한 댓글, 타인의 권리를 침해하거나 명예를 훼손하는 댓글은 별도의 통보 없이 제재를 받을 수 있습니다." /><br>
						<br>
						<button type="submit">등록</button>
						<%
						}
						%>
					</form>
				</div>
				<div class="reply">
					<hr>
					<table>
						<%
						try {
							sql = "select * from comments where id=" + id;
							rs = stmt.executeQuery(sql);

						} catch (Exception e) {
							out.println("DB 연동 오류입니다. : " + e.getMessage());
						}

						while (rs.next()) {
						%>
						<tr>
							<td><a><%=rs.getString("name")%></a></td>
							<td><%=rs.getString("date")%></td>
							<td class="contents"><%=rs.getString("content")%></td>
							<%
							if (myname != null) {
								if (myname.equals(rs.getString("name")) || managername.equals(myname)) {
							%>
							<form
								action="comment-delete-db.jsp?ref=<%=rs.getString("ref")%>&id=<%=id%>"
								method="post">
								<td><input type="submit" value="댓글 삭제" /></td>
							</form>
							<%
							}
							}
							%>
						</tr>
						<%
						}
						%>
					</table>
					<hr>
				</div>
			</div>
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
