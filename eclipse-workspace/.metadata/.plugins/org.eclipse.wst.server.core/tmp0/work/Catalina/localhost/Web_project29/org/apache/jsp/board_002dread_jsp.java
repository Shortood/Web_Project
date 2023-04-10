/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.65
 * Generated at: 2022-12-10 18:06:49 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class board_002dread_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>게시판</title>\r\n");
      out.write("<link href=\"board-read.css\" rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "maintools.jsp", out, false);
      out.write('\r');
      out.write('\n');
      out.write('	');

	int ref = 0;
	String id, date = "";
	String name = "", title = "", content = "";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String boardname = getCookieValue(cookies, "NAME");
	ref = Integer.parseInt(request.getParameter("ref"));

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		String sql = "select * from board where ref=" + ref;
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	if (rs != null) {
		rs.next();
		name = rs.getString("name");
		title = rs.getString("title");
		content = rs.getString("content");
		content = content.replace("\r\n", "<br>");
		ref = Integer.parseInt(rs.getString("ref"));
		date = rs.getString("date");
	}
	
      out.write("\r\n");
      out.write("	<div id=\"wrap\">\r\n");
      out.write("		<div id=\"main\">\r\n");
      out.write("			<div class=\"content\">\r\n");
      out.write("				<table>\r\n");
      out.write("					<br>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td width=\"600\" height=\"40\" colspan=\"4\"><h2>");
      out.print(title);
      out.write("</h2></td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td width=\"100\">작성자:</td>\r\n");
      out.write("						<td>");
      out.print(name);
      out.write("</td>\r\n");
      out.write("						<td width=\"100\">작성일:</td>\r\n");
      out.write("						<td>");
      out.print(date);
      out.write("</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("				</table>\r\n");
      out.write("				<hr>\r\n");
      out.write("				<table>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td height=\"400\" colspan=\"4\">");
      out.print(content);
      out.write("</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("				</table>\r\n");
      out.write("				<hr>\r\n");
      out.write("				<div>\r\n");
      out.write("					");

					String managername = "";
					try {
						String sql = "select * from manager";
						rs = stmt.executeQuery(sql);
					} catch (Exception e) {
						out.println("DB 연동	오류입니다. : " + e.getMessage());
					}
					if (rs.next()) {
						managername = rs.getString("name");
					}

					if (name.equals(boardname) || managername.equals(boardname)) {
					
      out.write("\r\n");
      out.write("					<button type=\"button\"\r\n");
      out.write("						onclick=\"location.href='board-modify.jsp?ref=");
      out.print(ref);
      out.write("'\">\r\n");
      out.write("						게시글 수정</a>\r\n");
      out.write("						<button type=\"button\"\r\n");
      out.write("							onclick=\"location.href='board-delete-db.jsp?ref=");
      out.print(ref);
      out.write("'\">\r\n");
      out.write("							게시글 삭제</a>\r\n");
      out.write("							");

							}
							
      out.write("\r\n");
      out.write("							<button type=\"button\" onclick=\"location.href='board-list.jsp'\">\r\n");
      out.write("								게시글 목록 보기</a>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div class=\"empty_space\"></div>\r\n");
      out.write("				<div class=\"empty_space\"></div>\r\n");
      out.write("				<div class=\"empty_space\"></div>\r\n");
      out.write("\r\n");
      out.write("				<div id=\"reply_title\">\r\n");
      out.write("					<big><b>댓글</b></big><small> 총 20개(실제 개수 따오기)</small>\r\n");
      out.write("				</div>\r\n");
      out.write("\r\n");
      out.write("				<div id=\"reply_form\">\r\n");
      out.write("					<form action=\"board-comment-insert-db.jsp?id=");
      out.print(ref);
      out.write("\"\r\n");
      out.write("						method=\"post\">\r\n");
      out.write("						<textarea name=\"reply\"\r\n");
      out.write("							placeholder=\"주제와 무관한 댓글, 타인의 권리를 침해하거나 명예를 훼손하는 댓글은 별도의 통보 없이 제재를 받을 수 있습니다.\"></textarea>\r\n");
      out.write("						<br>\r\n");
      out.write("						<br>\r\n");
      out.write("						<button type=\"submit\">등록</button>\r\n");
      out.write("					</form>\r\n");
      out.write("				</div>\r\n");
      out.write("				<hr>\r\n");
      out.write("				<div class=\"reply_content\">\r\n");
      out.write("					<table>\r\n");
      out.write("						");

						try {
							String sql = "select * from boardcomments where id=" + ref;
							rs = stmt.executeQuery(sql);
						} catch (Exception e) {
							out.println("DB 연동	오류입니다. : " + e.getMessage());
						}
						while (rs.next()) {
						
      out.write("\r\n");
      out.write("						<tr>\r\n");
      out.write("							<td><a>");
      out.print(rs.getString("name"));
      out.write("</a></td>\r\n");
      out.write("							<td>");
      out.print(rs.getString("date"));
      out.write("</td>\r\n");
      out.write("							<td class=\"contents\">");
      out.print(rs.getString("content"));
      out.write("</td>\r\n");
      out.write("							");

							if (boardname != null) {
								if (boardname.equals(name) || boardname.equals(managername)) {
							
      out.write("\r\n");
      out.write("							<form\r\n");
      out.write("								action=\"board-comment-delete-db.jsp?ref=");
      out.print(rs.getString("ref"));
      out.write("&id=");
      out.print(ref);
      out.write("\"\r\n");
      out.write("								method=\"post\">\r\n");
      out.write("								<td><input type=\"submit\" value=\"댓글 삭제\" /></td>\r\n");
      out.write("							</form>\r\n");
      out.write("							");

							}
							}
							
      out.write("\r\n");
      out.write("						</tr>\r\n");
      out.write("						");

						}
						stmt.close();
						conn.close();
						
      out.write("\r\n");
      out.write("					</table>\r\n");
      out.write("					<hr>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write('\r');
      out.write('\n');
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