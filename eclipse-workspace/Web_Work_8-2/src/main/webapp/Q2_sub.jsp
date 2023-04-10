<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here2</title>
</head>
<body>
<h2>forward 액션 태그<br></h2>
<hr>
이 파일은 Q2_sub.jsp 입니다.<br><hr>
현재 웹 브라우저에 나타난 웹 페이지는<br>
<%=request.getParameter("name") %>로부터 이동되었습니다.
<br><hr>
<%=request.getParameter("name") %> 에서 넘어온 메시지 : 
<%=request.getParameter("message") %>
<br/><hr>
</body>
</html>