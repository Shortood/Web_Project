<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String id = request.getParameter("id");
String user = request.getParameter("user");
String classname = request.getParameter("classname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	USER ID IS
	<%=id%>
	<br> USER NAME IS
	<%=user%>
	<br> CLASS NAME IS
	<%=classname%>
	<br>

</body>
</html>