<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>ǥ�� ����� ��뿹��2 - �Ķ���� �� ó��</h3>
	<form action = "Q3.jsp">
		�̸�<input type="text" name="name" value="${param.name}">
		<input type="submit" value="Ȯ��"><br>
	</form>
	
	�̸���(request.getParameter): <%=request.getParameter("name") %>�Դϴ�.<br>
	�̸���(EL) : ${param.name} �Դϴ�.
</body>
</html>