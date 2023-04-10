<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
Cookie[] cookies = request.getCookies();
%>
<html>
<head>
<title>쿠키 데이터 읽기</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("pwd");
	String result;
	if (getCookieValue(cookies, id) == null) {
		out.println("쿠키를 설정합니다.");
		Cookie cookie = new Cookie(id, passwd);
		response.addCookie(cookie);
	%>
	<br>
	<br>
	<a href="GetCookisTest.jsp">쿠키 가져오기</a>
	<%
	} else {
	out.println("쿠키가 설정되어 있습니다.<br>");
	out.println("기존 쿠키를 삭제합니다.");
	Cookie cookie = new Cookie(id, "");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	%>
	<br>
	<br>
	<a href="GetCookisTest.jsp?id=<%=id%>">쿠키 가져오기</a>
	<%
	}
	%>

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




