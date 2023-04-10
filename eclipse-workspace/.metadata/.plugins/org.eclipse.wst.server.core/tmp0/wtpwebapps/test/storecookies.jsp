<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    response.addCookie(new Cookie("NAME","John"));
    response.addCookie(new Cookie("GENDER","Male"));
    response.addCookie(new Cookie("AGE","20"));
    %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
쿠키 저장 완료<br>
</body>
</html>