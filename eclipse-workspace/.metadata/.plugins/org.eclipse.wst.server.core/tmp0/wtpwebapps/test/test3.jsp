<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date, java.text.* , java.io.*"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
	String sql = null;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	OutputStream output = response.getOutputStream();
	InputStream input = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "root", "0000");
		sql = "select FILE from tbl_test where id = 2";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		if (rs.next()) {
			input = rs.getBinaryStream("FILE");
			int byteRead;
			while ((byteRead = input.read()) != -1) {
		output.write(byteRead);
			}
			input.close();
		}
		conn.close();
		rs.close();
		stmt.close();
	} catch (Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
	%>
</body>
</html>