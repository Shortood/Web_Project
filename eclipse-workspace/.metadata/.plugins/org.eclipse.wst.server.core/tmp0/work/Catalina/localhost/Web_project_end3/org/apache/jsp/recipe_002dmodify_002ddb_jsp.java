/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.65
 * Generated at: 2022-12-11 10:38:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Enumeration;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.TimeZone;

public final class recipe_002dmodify_002ddb_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.Enumeration");
    _jspx_imports_classes.add("com.oreilly.servlet.multipart.DefaultFileRenamePolicy");
    _jspx_imports_classes.add("java.util.Date");
    _jspx_imports_classes.add("java.util.TimeZone");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("com.oreilly.servlet.MultipartRequest");
    _jspx_imports_classes.add("java.text.DateFormat");
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
      response.setContentType("text/html; charset=UTF-8");
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

request.setCharacterEncoding("UTF-8");
Cookie[] cookies = request.getCookies();

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");

	// 파일이 저장되는 경로
	String path = getServletContext().getRealPath("recipefolder");
	//out.println(path);
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("	");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql_update;
	String name, content, tag, myname, totalstep = "";
	String totalin = "";
	String sql;
	int i = 0, cnt = 0;
	int view = 0, likes = 0;
	int id = Integer.parseInt(request.getParameter("id"));
	//----------------------------
	int size = 1024 * 1024 * 15; // 저장가능한 파일 크기
	String file = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)
	String originalFile = ""; // 이름이 변경되기 전 실제 파일 이름
	MultipartRequest multi = null;
	// 실제로 파일 업로드하는 과정
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(jdbcurl, "root", "0000");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		//------------------------------
		multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String str;
		while (files.hasMoreElements()) {
			str = (String) files.nextElement(); // 파일 이름을 받아와 string으로 저장
			//out.println(str);
			if (str.equals("mainimage1")) {
		file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
			}
			originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴
		}
	} catch (Exception e) {
		out.println("연동 오류입니다.1 : " + e.getMessage());
		e.printStackTrace();
	}
	
      out.write('\r');
      out.write('\n');
      out.write('	');

	name = multi.getParameter("menu_name");
	content = multi.getParameter("menu_explain");
	String ingredient[] = multi.getParameterValues("ingredient");
	String amount[] = multi.getParameterValues("amount");

	for (i = 0; i < ingredient.length; i++) {
		totalin = totalin + ingredient[i] + "/" + amount[i] + "&";
	}
	String step_explain[] = multi.getParameterValues("step_explain");

	for (i = 0; i < step_explain.length; i++) {
		totalstep = totalstep + step_explain[i] + "&";
	}
	tag = multi.getParameter("tag");
	myname = getCookieValue(cookies, "NAME");
	//날짜 설정
	Date now = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(now);

	try {

		sql = "select max(id) as max_id, count(*) as cnt from recipe";
		rs = stmt.executeQuery(sql);

	} catch (Exception e) {
		out.println("DB 연동 오류입니다.2:" + e.getMessage());
	}

	sql_update = "update recipe set id=" + id + ",menu_name = '" + name + "',menu_explain='" + content + "',ingredient = '"
			+ totalin + "',step_explain='" + totalstep + "',image = '" + file + "',tag='" + tag + "',date='" + strdate
			+ "' where id=" + id;

	try {
		stmt.executeUpdate(sql_update);

	} catch (Exception e) {
		out.println("DB 연동 오류입니다.5:" + e.getMessage());
	}
	//--------------------------- 설명 이미지들 DB저장
	Enumeration files = multi.getFileNames();
	String str;
	try {
		sql_update = "delete from images where id=" + id;
		stmt.executeUpdate(sql_update);
	} catch (Exception e) {
		out.println("DB 연동 오류입니다.3:" + e.getMessage());
	}
	int imgcnt = 0;
	while (files.hasMoreElements()) {
		str = (String) files.nextElement(); // 파일 이름을 받아와 string으로 저장
		if (!str.equals("mainimage1")) {
			file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
			try {
		sql_update = "insert into images values(" + imgcnt + "," + id + ",'" + file + "')";
		stmt.executeUpdate(sql_update);
			} catch (Exception e) {
		out.println("DB 연동 오류입니다.4:" + e.getMessage());
			}
		}
		imgcnt++;
	}
	stmt.close();
	conn.close();
	out.println("<script>alert('레시피가 수정되었습니다'); location.href='recipepage.jsp';</script>");
	out.flush();
	
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
