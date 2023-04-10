<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<html>

<head>
   <meta charset="UTF-8">
   <title>login in</title>
   <link href="login_signup.css" rel="stylesheet">
</head>

<body>
   <div id="wrap">
      <center>
         <h1>Sign in</h1>
         <form action="login-db.jsp" method="post">
            <input type="text" name="id" placeholder="아이디" class="in" pattern=".{6,}" maxlength="20" /><br><br>
            <input type="password" name="passwd" placeholder="비밀번호" class="in" pattern=".{8,}" maxlength="20" /><br><br>
            <input type="submit" class="button" value="로그인" /><br> <br>
         </form>
         아이디가 없으신가요?<br><br>
         <a href="signup.jsp">create an account</a>
      </center>
   </div>
</body>

</html>