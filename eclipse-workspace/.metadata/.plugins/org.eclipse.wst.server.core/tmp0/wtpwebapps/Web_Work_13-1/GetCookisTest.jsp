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
	쿠키 읽어오는 예제
	<%
String id = request.getParameter("id");
if (cookies != null && id == null) {
%>
	쿠키가 설정되어 있습니다.
	<%
for (Cookie cookie : cookies) {
%>
	<br>NAME :
	<%=cookie.getName()%><br> Value :
	<%=cookie.getValue()%><br> Domain :
	<%=cookie.getDomain()%><br> MaxAge :
	<%=cookie.getMaxAge()%><br> Path :
	<%=cookie.getPath()%><br> Secure :
	<%=cookie.getSecure()%><br> Comment :
	<%=cookie.getComment()%><br> Version :<%=cookie.getVersion()%><br>

	<%
	}
	%>
	<a href="SetCookisTest.html">쿠키 설정</a>
	<%
	} else {
	%>쿠키를 설정해야합니다.
	<br>
	<br>
	<a href="SetCookisTest.html">쿠키 설정</a>
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