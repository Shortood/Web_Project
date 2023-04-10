<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date, java.text.* , java.io.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="test2.jsp?" method="post">
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
				document.write(image_binary);
				document.querySelector("div#image_container").appendChild(img);
				const url = window.URL.createObjectURL(event);
				//image_binary = img.getAttribute("src");
				//document.write(image_binary);
			};
			reader.readAsDataURL(event.target.files[0]);

		}
	</script>
</body>
</html>