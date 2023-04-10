<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>String 클래스 사용 예제</h2>
<%
String str="web program";
%>

<%=
"문자열 : " + str + "<br>" +
"문자열 반환 : "+ str + " -> " + str.substring(5,10) +
"<br>문자열 대체 : " + str + " -> " + str.replace("program","programming") +
"<br>문자열 대문자로 변환 : " + str + " -> "+str.toUpperCase() + "<br><hr>"
%>

<h2>try-catch문 사용 예제</h2>

<%
try{
	int i, num;
	for(i=5;i>=0;i--){
		num=30/i;
		out.println(num);
		out.println("<br>");
	}
}catch(Exception e){
	out.println("오류가 발생했습니다.<br>");
	out.println("오류(getMessage) : "+e.getMessage() +"<br");
} finally{
	out.println("<br><hr><br>");
}
%>
</body>
</html>