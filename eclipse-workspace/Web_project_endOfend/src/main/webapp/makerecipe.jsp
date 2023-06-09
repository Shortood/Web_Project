<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
Cookie[] cookies = request.getCookies();
%>
<html>
<head>
<link href="makerecipe1.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var count = 1;
	$(document)
			.ready(
					function() {
						$('#add_ingredient')
								.click(
										function() {
											var tbl = $('<tr><td class="type_name"></td>');
											$(tbl)
													.append(
															'<td class="type_context"><input type="text" name="ingredient" ></td>');
											$(tbl)
													.append(
															'<td class="type_context"><input type="text" name="amount" ></td></tr>');
											$('#ingredient_table').append(tbl);
										});

						$('#add_step')
								.click(
										function() {
											var tbl = $('<tr><td class="type_name"></td>');
											$(tbl)
													.append(
															'<td class="type_context"><textarea name="step_explain"> </textarea></td>');
											$(tbl)
													.append(
															"<td class='type_context'><input type='file' value='사진 추가' name='step_image"
																	+ (count)
																	+ "'accept='image/gif,image/jpeg,image/png'></td></tr>");
											$('#step_table').append(tbl);
											count++;
										});

					});
</script>
</head>

<body>
	<jsp:include page="maintools.jsp"></jsp:include>
	<div id="wrap">
		<div id="main">
			<div class="notice">레시피 작성</div>
			<br>
			<div class="contents">
				<form action="makerecipe-db.jsp" method="post"
					enctype="multipart/form-data">
					<table name="first">
						<tr>
							<td class="type_name">요리 이름</td>
							<td class="type_context"><input type="text" name="menu_name"
								required maxlength="40"></td>
							<td><input type="file" class="file" name="mainimage1"
								value="사진 추가" accept="image/gif,image/jpeg,image/png"></td>
						</tr>
						<tr>
							<td>&nbsp</td>
						</tr>
						<tr>
							<td class="type_name">요리 설명</td>
							<td class="type_context"><textarea name="menu_explain"
									pattern=".{1,}" maxlength="50"> </textarea></td>
						</tr>
					</table>
					<table id="ingredient_table">
						<tr>
							<td class="type_name">재료 설정</td>
							<td class="type_context"><input type="text"
								name="ingredient"></td>
							<td class="type_context"><input type="text" name="amount"></td>
							<td><input type="button" value="재료 추가" id="add_ingredient"></td>
						</tr>
					</table>
					<table id="step_table">
						<tr>
							<td class="type_name">상세 설명<br> <br> <input
								type="button" value="단계 추가" id="add_step"></td>
							<td class="type_context"><textarea name="step_explain"> </textarea></td>
							<td class="type_context"><input type="file" value="사진 추가"
								name="step_image0" accept="image/gif,image/jpeg,image/png"
								onchange="setThumbnail(event);"></td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="type_name">태그 설정</td>
							<td class="type_context"><input type="text" name="tag"
								id="tag_explain"></td>
						</tr>
					</table>
					<div class="submitbut">
						<input type="submit" value="글쓰기" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
