<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=request.getParameter("id")%>
	님의 취미는
	<br>
	<%
	String result[] = request.getParameterValues("sport");
	if (result != null) {
		for (int i = 0; i < result.length; i++)
			out.print(result[i] + " ");
	}
	%>

</body>
</html>