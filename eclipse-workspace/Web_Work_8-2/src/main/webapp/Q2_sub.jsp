<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here2</title>
</head>
<body>
<h2>forward �׼� �±�<br></h2>
<hr>
�� ������ Q2_sub.jsp �Դϴ�.<br><hr>
���� �� �������� ��Ÿ�� �� ��������<br>
<%=request.getParameter("name") %>�κ��� �̵��Ǿ����ϴ�.
<br><hr>
<%=request.getParameter("name") %> ���� �Ѿ�� �޽��� : 
<%=request.getParameter("message") %>
<br/><hr>
</body>
</html>