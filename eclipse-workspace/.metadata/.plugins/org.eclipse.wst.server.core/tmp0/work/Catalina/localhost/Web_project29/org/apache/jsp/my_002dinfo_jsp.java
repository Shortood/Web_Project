/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.65
 * Generated at: 2022-12-10 17:43:54 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class my_002dinfo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

private String getCookieValue(Cookie[] cookies, String name) {
      String value = null;
      if (cookies == null)
         return null;
      for (Cookie cookie : cookies) {
         if (cookie.getName().equals(name))
            return cookie.getValue();
      }
      return null;
   }
  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

Cookie[] cookies = request.getCookies();

      out.write('\r');
      out.write('\n');

request.setCharacterEncoding("utf-8");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link href=\"mypage.css\" rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "mypage.jsp", out, false);
      out.write("\r\n");
      out.write("   ");

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
   
      out.write("\r\n");
      out.write("<div id=\"main\">\r\n");
      out.write("         <div class=\"main_content\">\r\n");
      out.write("            <h1 style=\"color: cadetblue\">나의 정보</h1>\r\n");
      out.write("            고객님께서 가입하신 허브 레시피 회원 정보입니다.<br> <br>\r\n");
      out.write("         </div><hr>\r\n");
      out.write("         <div class=\"main_content\">\r\n");
      out.write("            <table>\r\n");
      out.write("               <tr>\r\n");
      out.write("               <td class=\"tag\">닉네임</td>\r\n");
      out.write("               <td>");
      out.print(name);
      out.write("</td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <td class=\"tag\">올린글</td>\r\n");
      out.write("                  <td>");
      out.print(rownum);
      out.write("개</td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <td class=\"tag\">아이디</td>\r\n");
      out.write("                  <td>");
      out.print(id);
      out.write("</td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <td class=\"tag\">이메일</td>\r\n");
      out.write("                  <td>");
      out.print(email);
      out.write("</td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <td class=\"tag\">생년월일</td>\r\n");
      out.write("                  <td>");
      out.print(year);
      out.write('.');
      out.print(month);
      out.write('.');
      out.print(date);
      out.write("</td>\r\n");
      out.write("               </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("         </div>\r\n");
      out.write("         <hr>\r\n");
      out.write("</div>\r\n");
      out.write("   ");

   stmt.close();
   conn.close();
   
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
