<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>	
		jstl은 library이기 때문에 화면에서 사용하겠다고 해줘야 하는데! 그 때 사용하는게 taglib <br>
		uri에서 core선택할 때 jsp붙은 걸 사용해야함! 전부 ctrl+space로 작성하능 ㅎㅎ <br>
		core 태그에서 for문은 foreach! 마크업은 마크업이 감싸져있는 내부가 다 영역, 블래스가 없어서..헷갈릴 수 잇는데<br>
		JSTL은 자바의 변수에 담는 것처럼 태그에 담아서 사용해야 한다.?
	</div>
	
	<h1>JSTL 문법 정리 간단히</h1>
		<table border="1">
			<tr>
				<th>객체 전체길이</th><th>vs</th><th>이름</th><th>국어</th><th>영어</th>
				<th>수학</th><th>총점</th><th>평균</th><th>등급</th>
			</tr>
			<!-- 향상된 포문을 써볼 것! binding 되는 애를 item이라고 합니다. -->
			<!-- lists의 코어가 각 dto로 변환이 되고, el을 dto. 으로 사용 -->
			<!-- for문은 i를 index번호로 사용하는데 그게 불가능해서 만들어 낸 것이 varStatus -->
			<c:forEach var="dto" items="${lists}" varStatus="vs"> 
				<tr>
					<td>
						${fn:length(lists) - vs.count}
					</td>
					<td>
						${vs.count}/${vs.index}					
					</td>
					<td>
						<!-- 만약 이름이 도라에몽10이라면 처음 도라에몽 출력-->
						<c:if test="${dto.name eq '도라에몽10'}">
							<c:out value="처음 도라에몽"/>
						</c:if>
						
						<!-- case문! mybatis는 죄다 JSTL문법으로 되어있다.-->
						<!-- choose when otherwise -->
						<!-- 삭제된 글입니다 표현시 -->
						<c:choose>
							<c:when test="${dto.name eq '도라에몽15'}">
								<c:out value="${dto.name}님 환영합니다."/>
							</c:when>
							<c:when test="${dto.name eq '도라에몽20'}">
								<c:out value="${dto.name}님!!! 환영합니다."/>
							</c:when>
							<c:otherwise>
								<c:out value="누구?"/>
							</c:otherwise>
						</c:choose>
					</td>
					
					<!-- 게시글 제목이 길면 ... 처리하는 거 화면에서 할 수 있다 -->
					<td>${dto.kor}</td>
					<!--  이중 if문 (안썼으면 좋겠지만 ): 30이상인 애들 중 40이면 최고점수 찍어주겠다-->
					<td> 
					<!-- else가 없기 때문에 사용하지 마세요. 회사에선. java에서 포문을 돌려서 가져오던지 하세여 -->
						<c:if test="${dto.eng <=30}">
							<c:out value="낙제!"/>
						</c:if>
						<c:if test="${dto.eng > 30}">
							<c:if test="${dto.eng==40}">
								<c:out value="1등입니다"/>
							</c:if>
						</c:if>
					</td>	
					<td>
						<!-- 그냥 ${dto.math} 찍어도 되는데 값을 다시쓰려고 담아두기 위함 -->
						<!--  존재는 하지만 회사에서는 사용하지 않아. 서버사이드랑 화면 개발자가 다르게 개발했을 때 사용..?-->
						<c:set var="math" value="${dto.math}" scope="request" />
						<c:out value="${math}"/>
					</td>			
					<td> 
					<!-- 연산을 할때는 EL 1개 안에서  처리, 아니면 따로따로-->
					<!-- ne 는 not equal dto.kor ne 30 (30이 아니면) -->
						<c:choose>
							<c:when test="${dto.kor == 30 || dto.math == 45}">
								<c:out value="PASS"/>
							</c:when>
							<c:otherwise>
								<c:out value="FAIL"/>
							</c:otherwise>
						</c:choose>
					</td>	
				</tr>
			</c:forEach>
		</table>
		<div>
		<!-- i = 1; i<=9; i++ -->
			<c:forEach var="i" begin="1" end="9" step="1">
				<c:forEach var="j" begin="1" end="9" step="1">
					<span>${i} x ${j} = ${i*j} </span>
				</c:forEach>
				<br>
			</c:forEach>
			
			<table border="1">
				<c:forEach var="i" begin="1" end="9" step="1">
				<tr>
					<c:forEach var="j" begin="1" end="9" step="1">
						<td  style="padding: 5px">	
							${j}X${i}= ${j*i} 
						</td>
					</c:forEach>
				</tr>
				</c:forEach>
			</table>
			
		</div>
</body>
</html>
