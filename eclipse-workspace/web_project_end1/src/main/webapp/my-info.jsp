<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
Cookie[] cookies = request.getCookies();
%>
<%
request.setCharacterEncoding("utf-8");
%>

<html>

<head>
<title>Insert title here</title>
<link href="mypage.css" rel="stylesheet">
</head>

<body>
<jsp:include page="mypage.jsp"></jsp:include>
   <%
   Connection conn = null;
   Statement stmt = null;
   String sql = null, sql2 = null;
   ResultSet rs = null;
   String name = getCookieValue(cookies, "NAME");
   String id = getCookieValue(cookies, "ID");
   String email = "";
   int rownum = 0;
   int year = 0, month = 0, date = 0;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
      conn = DriverManager.getConnection(url, "root", "0000");
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
      sql = "select * from user where name='" + name + "'";
      sql2 = "select * from recipe where name='" + name + "'";
      rs = stmt.executeQuery(sql);
      if(!rs.next()){
    	  sql = "select * from manager where name='" + name + "'";
    	  rs = stmt.executeQuery(sql);
    	  rs.next();
      }
      email = rs.getString("email");
      year = Integer.parseInt(rs.getString("year"));
      month = Integer.parseInt(rs.getString("month"));
      date = Integer.parseInt(rs.getString("date"));
      rs = stmt.executeQuery(sql2);
      rs.last();
      rownum = rs.getRow();
   } catch (Exception e) {
      out.println("DB 연동 오류입니다.2 : " + e.getMessage());
   }
   %>
<div id="main">
         <div class="main_content">
            <h1 style="color: cadetblue">나의 정보</h1>
            고객님께서 가입하신 허브 레시피 회원 정보입니다.<br> <br>
         </div><hr>
         <div class="main_content">
            <table>
               <tr>
               <td class="tag">닉네임</td>
               <td><%=name%></td>
               </tr>
               <tr>
                  <td class="tag">올린글</td>
                  <td><%=rownum%>개</td>
               </tr>
               <tr>
                  <td class="tag">아이디</td>
                  <td><%=id%></td>
               </tr>
               <tr>
                  <td class="tag">이메일</td>
                  <td><%=email%></td>
               </tr>
               <tr>
                  <td class="tag">생년월일</td>
                  <td><%=year%>.<%=month%>.<%=date%></td>
               </tr>
            </table>
         </div>
         <hr>
</div>
   <%
   stmt.close();
   conn.close();
   %>
</body>
</html>
<%!private String getCookieValue(Cookie[] cookies, String name) {
      String value = null;
      if (cookies == null)
         return null;
      for (Cookie cookie : cookies) {
         if (cookie.getName().equals(name))
            return cookie.getValue();
      }
      return null;
   }%>