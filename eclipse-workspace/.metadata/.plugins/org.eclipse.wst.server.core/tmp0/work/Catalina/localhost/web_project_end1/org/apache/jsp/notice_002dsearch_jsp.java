/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.65
 * Generated at: 2022-12-10 18:46:08 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class notice_002dsearch_jsp extends org.apache.jasper.runtime.HttpJspBase
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

request.setCharacterEncoding("utf-8");
Cookie[] cookies = request.getCookies();

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>공지사항</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"notice.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "maintools.jsp", out, false);
      out.write('\r');
      out.write('\n');
      out.write('	');

	int pagenum = 1;
	if (request.getParameter("page") != null) {
		pagenum = Integer.parseInt(request.getParameter("page"));
	}
	int fpage = pagenum * 10, bpage = (pagenum - 1) * 10;
	int ref;
	String id;
	int rownum = 0;
	Connection conn = null;
	Statement stmt = null;
	String sql = null, sql2 = null;
	ResultSet rs = null;
	String name2 = null;
	String type = request.getParameter("type");
	String search = request.getParameter("search_form");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		if (type.equals("head")) {
			sql = "select * from notice where title like '%" + search + "%'order by ref desc, id asc limit " + 10
			+ " offset " + bpage;
			sql2 = "select * from notice where title like '%" + search + "%'";
		} else if (type.equals("writer")) {
			sql = "select * from notice where content like '%" + search + "%'order by ref desc, id asc limit " + 10
			+ " offset " + bpage;
			sql2 = "select * from notice where content like '%" + search + "%'";
		} else {
			sql = "select * from notice where title like '%" + search + "%'or content like '%" + search
			+ "%'order by ref desc, id asc limit " + 10 + " offset " + bpage;
			sql2 = "select * from notice where title like '%" + search + "%'or content like '%" + search + "%'";
		}
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}

	rs.last();
	rownum = rs.getRow();
	rs.beforeFirst();
	
      out.write("\r\n");
      out.write("	<div id=\"wrap\">\r\n");
      out.write("	<div id=\"main\">\r\n");
      out.write("	<div class=\"content\">\r\n");
      out.write("			<table class=\"title\">\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td class=\"notice\"><a href=\"notice-list.jsp\">공지사항</a></td>\r\n");
      out.write("						<td class=\"search\">\r\n");
      out.write("							<form action=\"notice-search.jsp\" method=\"post\">\r\n");
      out.write("								<fieldset class=\"search-form\">\r\n");
      out.write("									<select name=\"type\">\r\n");
      out.write("										<option value='' selected>전체</option>\r\n");
      out.write("										<option value='head'>제목</option>\r\n");
      out.write("										<option value='writer'>내용</option>\r\n");
      out.write("									</select> <input type=\"text\" name=\"search_form\"\r\n");
      out.write("										onKeypress=\"javascript:if(event.keyCode==13) {search_onclick_submit}\" />\r\n");
      out.write("								</fieldset>\r\n");
      out.write("							</form>\r\n");
      out.write("						</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("				</table>\r\n");
      out.write("		<table class=\"mainboard\">\r\n");
      out.write("			<tr bgcolor=\"#f3e0ac\">\r\n");
      out.write("				<th>글번호</th>\r\n");
      out.write("				<th>제목</th>\r\n");
      out.write("				<th>작성자</th>\r\n");
      out.write("				<th>작성일</th>\r\n");
      out.write("			</tr>\r\n");
      out.write("			");

			while (rs.next()) {
				id = rs.getString("id");
				ref = Integer.parseInt(rs.getString("ref"));
			
      out.write("\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td align=\"center\" height=\"40\">");
      out.print(rownum);
      out.write("</td>\r\n");
      out.write("				<td align=\"left\" height=\"40\"><a\r\n");
      out.write("					href=\"notice-read.jsp?ref=");
      out.print(rs.getString("ref"));
      out.write("\" width=\"250\">\r\n");
      out.write("						");
      out.print(rs.getString("title"));
      out.write("</a></td>\r\n");
      out.write("				<td align=\"center\" height=\"40\">");
      out.print(rs.getString("name"));
      out.write("</td>\r\n");
      out.write("				<td align=\"center\" height=\"40\">");
      out.print(rs.getString("date"));
      out.write("</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			");

			rownum--;
			}
			
      out.write("\r\n");
      out.write("		</table>\r\n");
      out.write("	</div>\r\n");
      out.write("	<br>\r\n");
      out.write("	<br>\r\n");
      out.write("	<div class=\"pageButton\">\r\n");
      out.write("		");

		//sql = "select * from notice where title like '%" + search + "%'";
		try {
			rs = stmt.executeQuery(sql2);
		} catch (Exception e) {
			out.println("DB 연동 오류입니다. : " + e.getMessage());
		}
		rs.last();
		rownum = rs.getRow();
		for (int i = 1; i <= (rownum-1) / 10 + 1; i++) {
		
      out.write("\r\n");
      out.write("		<a\r\n");
      out.write("			href=\"notice-search.jsp?page=");
      out.print(i);
      out.write("&type=");
      out.print(type);
      out.write("&search_form=");
      out.print(search);
      out.write("\"\r\n");
      out.write("			class=\"num selected\">");
      out.print(i);
      out.write("</a>\r\n");
      out.write("		");

		;
		}
		
      out.write("\r\n");
      out.write("	</div>\r\n");
      out.write("	<br>\r\n");
      out.write("	");

	try {
		sql = "select * from manager";
		rs = stmt.executeQuery(sql);
		name2 = getCookieValue(cookies, "NAME");
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	while (rs.next()) {
		String name = rs.getString("name");
		if (name.equals(name2)) {
	
      out.write("\r\n");
      out.write("	<button class=\"writingbutton\" onclick=\"location.href='notice-insert.jsp'\">게시글 쓰기</button>\r\n");
      out.write("	");

	break;
	}
	}
	stmt.close();
	conn.close();
	
      out.write("\r\n");
      out.write("	</div>\r\n");
      out.write("	</div>\r\n");
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
