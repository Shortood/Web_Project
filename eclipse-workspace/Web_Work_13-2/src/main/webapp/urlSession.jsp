<%@ page language="java" contentType="text/html; charset=utf-8"
	session="false"%>
<html>
<body>
	<h2>Session URL Rewriting Test</h2>
	<%
	String id = request.getParameter("id");
	if (id.equals("")) {
		response.sendRedirect("urlSession.html");
		return;
	}
	HttpSession session = request.getSession(true);
	if (session.isNew()) {
		session.setAttribute("id", id);
		out.print("세션 ID : " + session.getId() + "<br>");
		out.print("ID: " + session.getAttribute("id"));
	}
	String url = response.encodeURL("urlSessionResult.jsp");
	%>
	<hr>
	<a href=<%=url%>>Test1</a>
	<br>
	<a href="urlSessionResult.jsp">Test2</a>
</body>
</html>