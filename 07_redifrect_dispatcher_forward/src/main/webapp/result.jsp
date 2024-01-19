<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>result.jsp</h1>
	
	<!-- 이렇게 보면 똑같지만 request의 다른점은 Dispatcher의 forward 방식 때문 -->
	<h3>pageContext : <%=pageContext.getAttribute("index") %></h3>
	<h3>request : <%=request.getAttribute("index") %></h3>
	
	<a href="redirect?id=chlrlms">response send redirect</a>
	<hr/>
	<a href="forward?id=kfd45674">dispatcher forward</a>
</body>
</html>