

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
Cookie[] cookies = request.getCookies();
%>
<html>

<head>
<link href="makerecipe.css" rel="stylesheet">
</head>

<body>
	<div id="wrap">
		<div id="head">
			<img src="DB에서 새싹 사진 가져와">허브레시피
		</div>

		<div id="title">레시피 등록</div>
		<div id="main">
			<form action="makerecipe-db.jsp" method="post"
				enctype="multipart/form-data">
				<table name="first">
					<tr>
						<td class="type_name">요리 이름</td>
						<td class="type_context"><input type="text" name="menu_name"></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
					<tr>
						<td class="type_name">요리 설명</td>
						<td class="type_context"><textarea name="menu_explain"> </textarea></td>
					</tr>
				</table>
				<div id="mainPic">
					<img src="DB에서 레시피 메인사진 가져와"><input type="file" class="file"
						name="mainimage1" value="사진 추가"
						accept="image/gif,image/jpeg,image/png">
				</div>`
				<table>
					<tr>
						<td class="type_name">재료 설정</td>
						<td class="type_context"><input type="text" name="ingredient"></td>
						<td class="type_context"><input type="text" name="amount"></td>
						<td><input type="button" value="재료 추가"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td class="type_name">상세 설명<br> <br> <input
							type="button" value="단계 추가"></td>
						<td class="type_context"><textarea name="step_explain"> </textarea></td>
						<td class="type_context"><input type="file" class="file"
							name="mainimage2" value="사진 추가"
							accept="image/gif,image/jpeg,image/png"><br> <br>
							<input type="file" value="동영상 추가" accept="video/*"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td class="type_name">태그 설정</td>
						<td class="type_context"><input type="text" name="tag"></td>
						<td><input type="submit" value="태그 추가"></td>
					</tr>
					<tr>
						<td><input type="submit" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
		$(document).ready(
				function() {
					var fileTarget = $('.file');
					fileTarget.on('change', function() {
						if (window.FileReader) {
							var filename = $(this)[0].files[0].name;
						} else {
							var filename = $(this).val().split('/').pop()
									.split('\\').pop();
						}

						//$(this).siblings('.file-name').val(filename);
					});
				});
		function linked(link) {
			location.href = link;
		}
	</script>
</body>

</html>