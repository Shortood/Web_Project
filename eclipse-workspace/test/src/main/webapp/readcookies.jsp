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
	이름:
	<%=getCookieValue(cookies, "NAME")%>
	<BR> 성별:
	<%=getCookieValue(cookies, "GENDER")%>
	<BR> 나이:
	<%=getCookieValue(cookies, "AGE")%>
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