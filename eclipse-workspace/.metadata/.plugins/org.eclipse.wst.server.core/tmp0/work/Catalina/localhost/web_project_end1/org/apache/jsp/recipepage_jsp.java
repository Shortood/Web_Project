/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.65
 * Generated at: 2022-12-10 18:46:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class recipepage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>main page</title>\r\n");
      out.write("<script src=\"http://code.jquery.com/jquery-latest.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"recipepage.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "maintools.jsp", out, false);
      out.write('\r');
      out.write('\n');
      out.write('	');

	int pagenum = 1;
	if (request.getParameter("page") != null) {
		pagenum = Integer.parseInt(request.getParameter("page"));
	}
	int fpage = pagenum * 8, bpage = (pagenum - 1) * 8;
	int ref;
	int id;
	String name = getCookieValue(cookies, "NAME"), sel = "head";
	int rownum = 0;
	Connection conn = null;
	Statement stmt = null, stmt2 = null;
	String sql = null, sql2 = null, sql3 = null;
	ResultSet rs = null, rs2 = null;
	String name2 = null;
	String search = "";
	if (request.getParameter("search") != null)
		search = request.getParameter("search");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sql = "select * from recipe where tag like '%" + search + "%'order by id desc limit " + 8 + " offset " + bpage;
		sql2 = "select * from recipe where tag like '%" + search + "%' order by id desc";
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동   오류입니다. : " + e.getMessage());
	}
	rs.last();
	rownum = rs.getRow();
	rs.beforeFirst();
	
      out.write("\r\n");
      out.write("	<div id=\"wrap\">\r\n");
      out.write("		<div id=\"main\">\r\n");
      out.write("			<div class=\"contents\">\r\n");
      out.write("				<table class=\"category\">\r\n");
      out.write("					<tr>\r\n");
      out.write("						<th class=\"name\">카테고리</th>\r\n");
      out.write("						<td><a href=\"recipepage-search.jsp?search=한식&sel=");
      out.print(sel);
      out.write("\">한식</a>\r\n");
      out.write("							<a href=\"recipepage-search.jsp?search=중식&sel=");
      out.print(sel);
      out.write("\">중식</a> <a\r\n");
      out.write("							href=\"recipepage-search.jsp?search=일식&sel=");
      out.print(sel);
      out.write("\">일식</a> <a\r\n");
      out.write("							href=\"recipepage-search.jsp?search=양식&sel=");
      out.print(sel);
      out.write("\">양식</a></td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<th class=\"name\">요리목적</th>\r\n");
      out.write("						<td><a href=\"recipepage-search.jsp?search=아침&sel=");
      out.print(sel);
      out.write("\">아침</a>\r\n");
      out.write("							<a href=\"recipepage-search.jsp?search=점심&sel=");
      out.print(sel);
      out.write("\">점심</a> <a\r\n");
      out.write("							href=\"recipepage-search.jsp?search=저녁&sel=");
      out.print(sel);
      out.write("\">저녁</a> <a\r\n");
      out.write("							href=\"recipepage-search.jsp?search=야식&sel=");
      out.print(sel);
      out.write("\">야식</a> <a\r\n");
      out.write("							href=\"recipepage-search.jsp?search=간식&sel=");
      out.print(sel);
      out.write("\">간식</a> <a\r\n");
      out.write("							href=\"recipepage-search.jsp?search=술안주&sel=");
      out.print(sel);
      out.write("\">술안주</a> <a\r\n");
      out.write("							href=\"recipepage-search.jsp?search=다이어트&sel=");
      out.print(sel);
      out.write("\">다이어트</a> <a\r\n");
      out.write("							href=\"recipepage-search.jsp?search=벌크업&sel=");
      out.print(sel);
      out.write("\">벌크업</a> <a\r\n");
      out.write("							href=\"recipepage-search.jsp?search=비건&sel=");
      out.print(sel);
      out.write("\">비건</a></td>\r\n");
      out.write("\r\n");
      out.write("					</tr>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<form action=\"recipepage-search.jsp?sel=");
      out.print(sel);
      out.write("\" method=\"post\">\r\n");
      out.write("							<th class=\"name\">요리재료</th>\r\n");
      out.write("							<td><a href=\"recipepage-search.jsp?search=돼지고기&sel=");
      out.print(sel);
      out.write("\">돼지고기</a>\r\n");
      out.write("								<a href=\"recipepage-search.jsp?search=닭고기&sel=");
      out.print(sel);
      out.write("\">닭고기</a>\r\n");
      out.write("								<a href=\"recipepage-search.jsp?search=소고기&sel=");
      out.print(sel);
      out.write("\">소고기</a>\r\n");
      out.write("								<a href=\"recipepage-search.jsp?search=생선&sel=");
      out.print(sel);
      out.write("\">생선</a> <a\r\n");
      out.write("								href=\"recipepage-search.jsp?search=해산문&sel=");
      out.print(sel);
      out.write("\">해산물</a> <a\r\n");
      out.write("								href=\"recipepage-search.jsp?search=쌀&sel=");
      out.print(sel);
      out.write("\">쌀</a> <a\r\n");
      out.write("								href=\"recipepage-search.jsp?search=밀가루&sel=");
      out.print(sel);
      out.write("\">밀가루</a> <a\r\n");
      out.write("								href=\"recipepage-search.jsp?search=채소류&sel=");
      out.print(sel);
      out.write("\">채소류</a> 검색:<input\r\n");
      out.write("								type=\"text\" name=\"search\"\r\n");
      out.write("								onKeypress=\"javascript:if(event.keyCode==13) {search_onclick_submit}\">\r\n");
      out.write("						</form>\r\n");
      out.write("						</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("				</table>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"semitag\">\r\n");
      out.write("				<table>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td>\r\n");
      out.write("							<form action=\"recipepage-search.jsp\" method=\"post\">\r\n");
      out.write("								<select name=\"sel\" onchange=\"this.form.submit()\">\r\n");
      out.write("									<option value='head' selected>최신순</option>\r\n");
      out.write("									<option value='writer'>인기순</option>\r\n");
      out.write("								</select>\r\n");
      out.write("							</form>\r\n");
      out.write("						</td>\r\n");
      out.write("						");

                        if (name != null) {
                        
      out.write("\r\n");
      out.write("						<td><button onclick=\"location.href='makerecipe.jsp'\">게시글\r\n");
      out.write("								쓰기</button></td>\r\n");
      out.write("						 ");

                          }
                         
      out.write("\r\n");
      out.write("					</tr>\r\n");
      out.write("				</table>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"menulist\">\r\n");
      out.write("				");

				String image;
				int cnt = 0;
				
      out.write("\r\n");
      out.write("				<table class=\"foods\">\r\n");
      out.write("					<tr>\r\n");
      out.write("						");

						while (rs.next()) {
							image = rs.getString("image");
							if (cnt % 4 == 0 && cnt != 0) {
						
      out.write("\r\n");
      out.write("					</tr>\r\n");
      out.write("					<tr>\r\n");
      out.write("						");

						}
						
      out.write("\r\n");
      out.write("						<td><img src=\"recipefolder/");
      out.print(image);
      out.write("\" class=\"food\"><br>\r\n");
      out.write("							<a href=\"recipe-read.jsp?id=");
      out.print(rs.getString("id"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("menu_name"));
      out.write("</a>\r\n");
      out.write("							<div class=\"info\">\r\n");
      out.write("								조회수:");
      out.print(Integer.parseInt(rs.getString("view")));
      out.write("\r\n");
      out.write("								");

								id = Integer.parseInt(rs.getString("id"));
								sql3 = "select * from likelist where id=" + id + " and name='" + name + "'";
								try {
									rs2 = stmt2.executeQuery(sql3);
								} catch (Exception e) {
									out.println("DB 연동 오류입니다. :" + e.getMessage());
								}
								if (rs2.next()) {
								
      out.write("\r\n");
      out.write("								<a\r\n");
      out.write("									href=\"dis-like-db.jsp?id=");
      out.print(rs.getString("id"));
      out.write("&likes=");
      out.print(rs.getString("likes"));
      out.write("&page=");
      out.print(pagenum);
      out.write("\">\r\n");
      out.write("									♥ ");
      out.print(Integer.parseInt(rs.getString("likes")));
      out.write("</a>\r\n");
      out.write("								");

								} else {
								
      out.write("\r\n");
      out.write("								<a\r\n");
      out.write("									href=\"add-like-db.jsp?id=");
      out.print(rs.getString("id"));
      out.write("&likes=");
      out.print(rs.getString("likes"));
      out.write("&page=");
      out.print(pagenum);
      out.write("\">\r\n");
      out.write("									♡ ");
      out.print(Integer.parseInt(rs.getString("likes")));
      out.write("</a>\r\n");
      out.write("								");

								}
								
      out.write("\r\n");
      out.write("							</div></td>\r\n");
      out.write("						");

						cnt++;
						}
						
      out.write("\r\n");
      out.write("					</tr>\r\n");
      out.write("				</table>\r\n");
      out.write("			</div>\r\n");
      out.write("		");

		if (name != null) {
		
      out.write("\r\n");
      out.write("		");

		}
		
      out.write("\r\n");
      out.write("		<br>\r\n");
      out.write("		<center>\r\n");
      out.write("			");

			sql2 = "select * from recipe where tag like '%" + search + "%'";
			rs = stmt.executeQuery(sql2);
			rs.last();
			rownum = rs.getRow();
			for (int i = 1; i <= (rownum-1) / 8 + 1; i++) {
			
      out.write("\r\n");
      out.write("			<a href=\"recipepage.jsp?page=");
      out.print(i);
      out.write("\" class=\"num_selected\"> ");

 if (i == pagenum) {
 
      out.write("<b> ");
      out.print(i);
      out.write("</b> ");

 } else {
 
      out.write(' ');
      out.print(i);
      out.write(' ');

 }
 
      out.write("\r\n");
      out.write("			</a>\r\n");
      out.write("			");

			;
			}
			stmt.close();
			stmt2.close();
			conn.close();
			
      out.write("\r\n");
      out.write("		</center>\r\n");
      out.write("		</div>\r\n");
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
