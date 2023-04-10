<%@ page language="java" contentType="text/html; charset=utf-8"
	session="false"%>
<html>
<body>
	<h2>Session URL Rewriting Result</h2>
	<%
	HttpSession session = request.getSession(true);
	out.print("세션 ID : " + session.getId() + "<br>");
	out.print("ID: " + session.getAttribute("id"));
	%>
</body>
</html>