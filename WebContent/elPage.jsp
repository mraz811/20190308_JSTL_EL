<%@page import="com.happy.dto.ScoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elPage</title>
</head>
<body>
<!-- 예전 방법 -->
<%
	ScoreDto dto = (ScoreDto) request.getAttribute("sc");
%>

<h1>EL Page</h1>
<%=dto.getName() %>
	
	<table border="1"> <!-- border="1" 보더를 사용하겠다 ="0" 은 사용하지 않겠다-->
		<tr>
			<th>성명</th>
			<td>${sc.name}</td> <!-- sc라는 이름의 scope객체를 찾아서 객체화 시킨 다음에 그 안에있는 getName을 ! -->
		</tr>
		<tr>
			<th>국어</th>
			<td>${sc.kor}</td>
		</tr>
		<tr>
			<th>영어</th>
			<td>${sc.eng}</td>
		</tr>
		<tr>
			<th>수학</th>
			<td>${sc.math}</td>
		</tr>
	</table>
</body>
</html>
