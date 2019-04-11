<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%!
	// declaration은 자바의 method인데, {} 이다. 
	 // 그래서 새로고침해도 값을 유지하고 있다. '<%!' 이 아닌 '<%'인 경우 계속 초기화 된다. 
	int n = 0;
	// 하지만 얘도 무한정 유지하고 있는 것이 아니라, 몇 초동안 사용을 하지 않는다면 사라져 버린다.
%>
<%
	int m = 0;
%>
<body>
<%= n++ %>
<%= m++ %>
	<h1>EL 설명</h1>
	<div>
		<q>
			이름 정할 때 주의해야 함. 검색 순서<br>
			page, request, session, application 순으로 검색함 <br>
			 expressionLanguage는 null이 존재하지 않아서.. 다 찾았는데도 존재하지 않을 경우,<br>
			 값(키)가 존재하지 않을 경우 빈 것("")출력! <b>절!대! NULL은 아닙니다!!!!!</b>
		</q>
	</div>
		
	<div>
		<!-- name을 scope객체로..어떻게 받아야 하지? param. -->	
		<br>${param.name}<br>
	</div>
	
		<table>
			<thead>
				<tr>
					<th>El expression</th>
					<th>Result</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>\${1+2}</td>	<!-- ${1+2} -->
					<td>${1+2}</td>		<!-- 3 -->
				</tr>
				<tr>
					<td>\${1==1}</td>	<!-- ${1==1} -->
					<td>${1==1}</td>	<!-- true -->
				</tr>
				<tr>
					<td>\${1==1?"맞음":"틀림"}</td>
					<td>${1==1?"맞음":"틀림"}</td>		<!-- 맞음 -->
				</tr>
				<tr>
<%-- 				<td>${"A" mod "A"}</td>		<!-- NumberFormatException --> --%>
					<td></td>
					<td>${"A" eq "A"}</td>		<!-- 문자비교 eq : true -->
				</tr>
			</tbody>
		</table>
	
</body>
</html>
