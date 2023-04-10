<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>sign up</title>
<link href="login_signup.css" rel="stylesheet">
</head>
<body>
   <div id="wrap">
      <center>
      <h1>회원가입</h1>
      <div>가입을 통해 더 많은 레시피를 만나보세요!</div>

      <form action="signup-db.jsp" method="post">
         <input type="text" name="name" placeholder="닉네임 입력" class="in" pattern=".{1,}" maxlength="10" /><br>
         <input type="text" name="id" placeholder="아이디 입력 (6~20자)" class="in" pattern=".{6,}" maxlength="20" /><br>
         <input type="text" name="passwd" placeholder="비밀번호 입력(문자,숫자,특수문자 포함 8~20자)" class="in"   pattern=".{8,}" maxlength="20" /><br>
         <input type="text" name="e_mail" placeholder="이메일 주소" class="in_ex" />@ <input type="text" name="e_mail2" placeholder="이메일 주소" class="in_ex" /><br>
         <input type="text" name="year" placeholder="년도" class="in_ex" pattern=".{4,}" maxlength="4" /> 
         <input type="text" name="month" placeholder="월" class="in_ex" pattern=".{1,}" maxlength="2" /> 
         <input type="text" name="date" placeholder="일" class="in_ex" pattern=".{1,}" maxlength="2" /><br><br> 
         <input type="submit" class="button" value="가입하기" /><br><br>
      </form>
      </center>
   </div>
</body>
</html>