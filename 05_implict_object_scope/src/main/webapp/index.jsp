<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<h3><a href="request_test/requestTest.jsp">request method 확인</a></h3>
	<hr/>
	<!-- 
		pageContext   	  < 	    request 	    < 	    session     	<  	   application
		하나의 jsp page	       하나의 요청에 대한 응답            브라우저 종료				서버 종료
	 -->
	 <a href="attrForm.jsp">속성-영역 객체 테스트</a>
	 <hr/>
	 <h3>application id : <%=application.getAttribute("appId")%></h3>
	 <h3>pageContext id : <%=pageContext.getAttribute("pageId")%></h3>
	 <h3>request email : <%=request.getAttribute("requestEmail")%></h3>
	<h3>session email : <%=session.getAttribute("sessionEmail")%></h3>
</body>
</html>