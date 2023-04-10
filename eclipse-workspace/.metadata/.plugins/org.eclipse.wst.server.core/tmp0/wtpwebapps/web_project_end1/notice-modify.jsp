<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="board-insert1.css">
</head>
<body>
<jsp:include page="maintools.jsp"></jsp:include>
   <%
   int ref;
   String passwd = "", sql, sql1;
   String name, e_mail, title, content, reply;
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   ref = Integer.parseInt(request.getParameter("ref"));
   try {
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
      conn = DriverManager.getConnection(url, "root", "0000");
      stmt = conn.createStatement();
      sql = "select * from notice where ref=" + ref;
      rs = stmt.executeQuery(sql);
   } catch (Exception e) {
      out.println("DB 연동 오류입니다. : " + e.getMessage());
   }
   %>
<div id="wrap">
  <div id="main">
     <div class="contents">
	    <table class="title">
	    <tr>
		<td class="notice">작성글 수정</td>
		</tr>
	    </table><br>
   <div class="writing-page">
   <form action="notice-modify-db.jsp?ref=<%=ref%>" method="post">
      <table>
         <tr>
            <td>제목:</td>
            <td class="head"><input type="text" name="title"></td>
         </tr>
         <tr>
            <td>내용:</td>
            <td class="content"><textarea name="content"
						maxlength="500"></textarea></td>
         </tr>
      </table>
      <div class="buttons">
      <table>
      <tr>
      <td><input type="submit" value="등록하기" /></td>
      <td><input type="reset" value="다시쓰기" /></td>
      <td><input type="button" value="목록" onclick="location.href='notice-list.jsp'">
      </tr>
      </table>
        </div>
      </form>
      </div>
      </div>
      </div>
      </div>
   <%
   stmt.close();
   conn.close();
   %>
</body>
</html>