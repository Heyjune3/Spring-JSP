<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<%@ include file="check.jsp" %>
	<h1>MAIN INDEX</h1>
	<a href="addCookie.jsp">쿠키 추가</a>
	<a href="removeCookie.jsp">쿠키 삭제</a>
	<a href="addSession.jsp">Session 값 추가</a>
	<a href="checkSession.jsp">Session 속성 확인</a>
	<!-- 
		pageContext   	  < 	    request 	    < 	    session     	<  	   application
		하나의 jsp page	       하나의 요청에 대한 응답            브라우저 종료				서버 종료
	 -->
	 <%
	 	// pageContext 각 영역 객체에서 범위가 넓은 영역 객체정보 호출
	 	// ServeletRequest == request 객체가 구현해야할 기능을 정의한 interface
	 	ServletRequest req = pageContext.getRequest();
	 	HttpSession ses = pageContext.getSession();
	 	ServletContext app = pageContext.getServletContext();
	 	
	 	// request
	 	ses = request.getSession();
	 	app = request.getServletContext();
	 	
	 	// session
	 	app = session.getServletContext();
	 %>
</body>
</html>