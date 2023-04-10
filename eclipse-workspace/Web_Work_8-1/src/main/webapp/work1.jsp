<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int i,j,k;
for(i=1;i<=10;i++){
	for(j=1;j<=10-i;j++){
		out.print("&nbsp");
	}
	for(k=1;k<=i;k++){
		out.print("*");
	}
	out.print("<br>");
}

for(i=10;i>=1;i--){
	for(j=1;j<=10-i;j++){
		out.print("&nbsp");
	}
	for(k=1;k<=i;k++){
		out.print("*");
	}
	out.print("<br>");
}
%>
</body>
</html>