<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" href="main_style.css">
<link rel="stylesheet" href="signup.css">

</head>
<body>
<%
	String id, pwd, name, email;
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	String sql_update;
	
	id=request.getParameter("id");
	pwd=request.getParameter("pwd");
	name=request.getParameter("name");
	email=request.getParameter("email");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/cse_community?serverTimezone=UTC";
		conn = DriverManager.getConnection(jdbcurl,"root","qwerQWER123$");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sql = "insert into user values('"+id+"','"+pwd+"','"+name+"','"+email+"')";
		stmt.executeUpdate(sql);
		
		
	}
	catch(Exception e) {
	   out.println("DB 연동 오류입니다.:"+e.getMessage());
	}
	session.setAttribute("id", id);
	session.setAttribute("name", name);
	session.setAttribute("email", email);
	session.setAttribute("pwd", pwd);
%>

	<%@ include file="navbar.jsp"%>
	<div class="body-box">
		<div class="box">
			<div class="middle-box">
					<div class="menu-name">
								<span class="font-default font-bold">회원가입</span>
					</div>
					<div>
						<div class="signup-data">
								<span>회원가입이 완료되었습니다.</span>
						</div>
					</div>
					<div  class="clearfix">
					<center>
						<a href="main.jsp" id="submit-box" class="btn-default" type="button">Main</a>
					</center>
					</div>
					
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>