<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<title>main page</title>
<link rel="stylesheet" href="board-insert1.css">
</head>
<body>
	<jsp:include page="maintools.jsp"></jsp:include>
	<div id="wrap">
		<div id="main">
			<div class="contents">
				<table class="title">
					<tr>
						<td class="notice">글쓰기</td>
					</tr>
				</table>
				<br> <br>
				<div class="writing-page">
					<form action="notice-insert-db.jsp" method="post">
						<table cellspacing="20">
							<tr>
								<td>제목:</td>
								<td class="head"><input type="text" name="title"
									pattern=".{1,}" maxlength="40"></td>
							</tr>
							<tr>
								<td>내용:</td>
								<td class="story"><textarea name="content" maxlength="500"></textarea></td>
							</tr>
						</table>
						<div class="buttons">
							<table>
								<tr>
									<td><input type="submit" value="등록하기"></td>
									<td><input type="reset" value="다시쓰기"></td>
									<td><input type="button"
										onclick="location.href='notice-list.jsp'" value="목록"></td>
								</tr>
							</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>