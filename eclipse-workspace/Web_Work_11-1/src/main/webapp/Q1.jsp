<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>c:if 커스텀 액션 사용</h2>
	<c:set var="name" value="webp" />
	msg : ${name}
	<br>
	<c:if test="${name=='webp'}" var="re">
test result = ${re}<br>
		<hr>
	</c:if>
	<c:set var="data" value="개발자" />
	<h2>c:choose 커스텀 액션 사용</h2>
	value = ${data}
	<br>
	<c:choose>
		<c:when test="${data eq '사장'}">
	사장입니다
	</c:when>
		<c:when test="${data eq '개발자'}">
	개발자입니다
	</c:when>
		<c:otherwise>
	누구도 아닙니다
	</c:otherwise>
	</c:choose>
	<hr>
	<h2>c:forEach 커스텀 액션 사용</h2>
	<table>
		<tr>
			<td><b>Value</b></td>
			<td><b>Square</b></td>
		</tr>
		<c:forEach var="x" begin="0" end="9" step="3">
			<tr>
				<td><center>
						<c:out value="${x}" />
					</center></td>
				<td><center>
						<c:out value="${x*x*x}" />
					</center></td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<h2>c:import 커스텀 액션 사용</h2>
	<c:import url="test1.jsp">
	</c:import>
	<hr>
</body>
</html>