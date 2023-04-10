<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date, java.text.* , java.io.*"%>
<html>
<body>
	<form action="test2.jsp" method="post" encType="multipart/form-data">
		<input type="file" id="image" accept="image/*"
			onchange="setThumbnail(event);" />
		<div id="image_container"></div>
	</form>
	<script>
		var img;
		var image_binary;
		function setThumbnail(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				//document.write(img.getAttribute("src"));
				image_binary = img.getAttribute("src");
				document.frm.action = "test2.jsp?picture=" + image_binary;
				document.frm.method = "post";
				document.frm.submit();
				//document.write(image_binary);
				document.querySelector("div#image_container").appendChild(img);
				const url = window.URL.createObjectURL(event);
				//image_binary = img.getAttribute("src");
				//document.write(image_binary);
			};
			reader.readAsDataURL(event.target.files[0]);

		}
	</script>
	<%
	Connection conn = null;
	Statement stmt = null;
	String sql = null;
	ResultSet rs = null;
	String picname = "";
	if (request.getParameter("picture") != null) {
		picname = request.getParameter("picture");
		out.print(picname);
	}
	//OutputStream output = response.getOutputStream();
	/*
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "root", "0000");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

			File imgfile = new File("C:\\C prac\\김치찌개.jpg");
			FileInputStream fin = new FileInputStream(imgfile);

			PreparedStatement pre = conn.prepareStatement("insert into tbl_test(ID, FILENAME, FILE) VALUES (?,?,?)");
			pre.setInt(1, 2);
			pre.setString(2, "김치찌개");
			pre.setBinaryStream(3, fin, (int) imgfile.length());
			pre.executeUpdate();
			out.print("Inserting Success!");
			out.print(picname);
			pre.close();
			conn.close();
		} catch (Exception e) {
			out.println("DB 연동 오류입니다. : " + e.getMessage());
		}
	*/
	%>

</body>
</html>