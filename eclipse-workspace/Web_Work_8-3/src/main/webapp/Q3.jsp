<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>String Ŭ���� ��� ����</h2>
<%
String str="web program";
%>

<%=
"���ڿ� : " + str + "<br>" +
"���ڿ� ��ȯ : "+ str + " -> " + str.substring(5,10) +
"<br>���ڿ� ��ü : " + str + " -> " + str.replace("program","programming") +
"<br>���ڿ� �빮�ڷ� ��ȯ : " + str + " -> "+str.toUpperCase() + "<br><hr>"
%>

<h2>try-catch�� ��� ����</h2>

<%
try{
	int i, num;
	for(i=5;i>=0;i--){
		num=30/i;
		out.println(num);
		out.println("<br>");
	}
}catch(Exception e){
	out.println("������ �߻��߽��ϴ�.<br>");
	out.println("����(getMessage) : "+e.getMessage() +"<br");
} finally{
	out.println("<br><hr><br>");
}
%>
</body>
</html>