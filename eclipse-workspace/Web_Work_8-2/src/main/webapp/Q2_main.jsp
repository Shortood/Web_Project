<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<p>�� ������Q2_ main.jsp �Դϴ�.<br/>
� ������ ���� �������?<br>
main�ϱ��? sub�ϱ��<br>
title�� �ٲ�ϱ� �����ϼ���.<hr></p>
<h3>jsp:forward</h3>
<jsp:forward page="Q2_sub.jsp">
<jsp:param name="message" value="Good luck with your class assignment"/>
<jsp:param name="name" value="Q2_main.jsp"/>
</jsp:forward>
</body>
</html>