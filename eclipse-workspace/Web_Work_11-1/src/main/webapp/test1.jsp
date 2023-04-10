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
	<c:set var="name" value="홍길동" />
	선언하고 이름 출력 : 	<c:out value="${name}" />
	<br />
	<c:set var="name" value="철수" />
	변경하고 이름 출력 : 	<c:out value="${name}" />
	<br />
	<c:remove var="name" />
	삭제하고 이름 출력 : 	<c:out value="${name}" default="이름없음" />
	<br />
</body>
</html>