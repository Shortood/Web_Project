<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
Cookie[] cookies = request.getCookies();
%>
<html>
<head>
<title>main page</title>
<link rel="stylesheet" href="font.css">
<link rel="stylesheet" href="mainpage.css">
</head>
<body>
<div class="topbutton">
      <table>
         <tr>
            <td class="logo"><a href="mainpage.jsp"><img
                  src="images/mainimage.png" class="mainimage"> 허브레시피</a></td>
            <td class="search_context">
               <form action="main-recipe-search.jsp" method="post">
                  <input type="text" name="search_context" class="searchbar">
               </form>
            </td>
            <%
            if (getCookieValue(cookies, "NAME") == null) {
            %>
            <td class="page-btn"><a href="login.jsp">로그인</a></td>
            <%
            } else {
            %>
            <td class="page-btn"><a href="logout.jsp">로그아웃</a></td>
            <%
            }
            %>
            <%
            if (getCookieValue(cookies, "NAME") != null) {
            %>
            <td class="page-btn"><a href="my-info.jsp">마이페이지</a></td>
            <%
            }
            %>
         </tr>
      </table>
   </div>
   <br>
   <div class="topbar">
      <nav>
         <table class="topmenu">
            <tr>
               <th><a href="notice-list.jsp">공지사항</a></th>
               <th><a href="recipepage.jsp">레시피</a></th>
               <th><a href="board-list.jsp">게시판</a></th>
               <th><a href="recipe-ranking.jsp">랭킹</a></th>
            </tr>
         </table>
      </nav>
   </div>
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