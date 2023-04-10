<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>표현 언어의 사용예제2 - 파라미터 값 처리</h3>
	<form action = "Q3.jsp">
		이름<input type="text" name="name" value="${param.name}">
		<input type="submit" value="확인"><br>
	</form>
	
	이름은(request.getParameter): <%=request.getParameter("name") %>입니다.<br>
	이름은(EL) : ${param.name} 입니다.
</body>
</html>