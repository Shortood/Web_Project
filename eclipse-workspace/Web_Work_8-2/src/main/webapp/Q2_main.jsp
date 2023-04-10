<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<p>이 파일은Q2_ main.jsp 입니다.<br/>
어떤 것으로 글이 적힐까요?<br>
main일까요? sub일까요<br>
title로 바뀌니까 참고하세요.<hr></p>
<h3>jsp:forward</h3>
<jsp:forward page="Q2_sub.jsp">
<jsp:param name="message" value="Good luck with your class assignment"/>
<jsp:param name="name" value="Q2_main.jsp"/>
</jsp:forward>
</body>
</html>