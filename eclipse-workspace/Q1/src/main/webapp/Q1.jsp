<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int score = Integer.parseInt(request.getParameter("score"));
String Ham=null;

if(score>=90){
	Ham="A";
} else if(score >=80){
	Ham="B";
}else if(score >=70){
	Ham="C";
}else if(score >=60){
	Ham="D";
}else
	Ham="F";
%>
<h2>조건문 사용 예제</h2>
<h4>당신의 성적은 <%=Ham%></h4>
<hr>
<h2>반복문 사용 예제</h2>
<%
int i,j,num;
num=Integer.parseInt(request.getParameter("num"));

for(i=1;i<=num;i++){
	for(j=0;j<i;j++){
		out.println("*");
	}
	out.println("<br>");
}
%>
</body>
</html>