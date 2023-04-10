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
	<jsp:useBean id="mybean" class="beans2.beans2"/>
	<jsp:setProperty property="subject" name="mybean" value="WEB PROGRAMMING"/>
	SUBJECT : <jsp:getProperty property="subject" name="mybean"/><br>
	<jsp:setProperty property="lecture" name="mybean" value="JAVA BEANS"/>
	LECTURE : <jsp:getProperty property="lecture" name="mybean"/>
</body>
</html>