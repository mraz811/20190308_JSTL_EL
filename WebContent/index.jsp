<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스</title>
</head>
<body>
	<a href="./ctrl.do?command=elPage">EL(Expression Language): scope가 자동으로 설정되어 있음</a>
	<div>
	<br>그래서 request.getAttribute안하고 key이럼.get메소드 사용,  <br>
	달러 중괄호로 처리, 간편하게 사용할 수 있음. null 이라는게 뜨지 않아서 어디서 틀린지 모름<br>
	scope는 : page, request, session.. 4개이나 얘는 scope를 구분하지 않습니다.<br>
	자동으로 구분해서 가져옴
	클릭을 누르는 순간 Controller.java로 이동 		(urlMapping), 계층, life cycle
	HTTPservlet으로 넘어오면 sendRedirect는 불가능하다. 왜 안될까요?
	redirect는 화면에서만 그대로 이동하는 거지만 servlet context.. 아?? 오후 2시 40분
	</div>
	<br><br>
<!-- 	<a href="./ExpressionLanguage.jsp">익스프레션 랭지기 설명</a> -->
	<a href="./ExpressionLanguage.jsp?name=문이슬">익스프레션 랭지기 설명</a>
	<!-- name을 scope객체로..어떻게 받아야 하지? param. -->	
	<br>
	<a href="./ctrl.do?command=jstlPage">JSTL</a>
	
</body>
</html>
