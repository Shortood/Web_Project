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
<link rel="stylesheet" href="my-modify.css">
</head>
<body>
<jsp:include page="mypage.jsp"></jsp:include>
<div id="main">
<div class="main_content">
   <h1>정보 수정</h1>
   나의 정보를 수정합니다.
</div><hr>
<div class="main_content">
      <form action="my-modify-db.jsp" method="post">
      <table>
      <tr>
         <td>
         비밀번호 : <input type="text" name="passwd" placeholder="비밀번호 입력(문자,숫자,특수문자 포함 8~20자)" class="newpwd" pattern=".{8,}"maxlength="20"/>
         </td>
      </tr>
      <tr>
         <td> 이메일 : <input type="text" name="e_mail" placeholder="이메일 주소" class="new2" /> @ 
         <input type="text" name="e_mail2" placeholder="이메일 주소" class="new2" />
         </td>
      </tr>
      <tr> 
          <td>생년월일 : <input type="text" name="year" placeholder="년도" class="new3" pattern=".{4,}"maxlength="4"/> 
                       <input type="text" name="month" placeholder="월" class="new3" pattern=".{1,}"maxlength="2"/> 
                       <input type="text" name="date" placeholder="일" class="new3" pattern=".{1,}"maxlength="2"/>
          </td>
      </tr>
      <tr>
      <td><input type="submit" class="button" value="정보 수정" /></td>
      </tr>
      </table>
      </form>
</div>
</div>
</body>
</html>