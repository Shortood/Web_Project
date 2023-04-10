<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:url var="url" value="Q2-2.jsp">
		<c:param name="id" value="2019111990" />
		<c:param name="user" value="Kang woo bin" />
		<c:param name="classname" value="Web Programming" />
	</c:url>
	<c:redirect url="${url}" />
</body>
</html>