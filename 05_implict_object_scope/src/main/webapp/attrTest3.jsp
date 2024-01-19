<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrTest3.jsp</title>
</head>
<body>
	<h1>attrTest3 JSP PAGE</h1>
	
	<h3>application id : <%=application.getAttribute("appId")%></h3>
	<h3>pageContext id : <%=pageContext.getAttribute("pageId")%></h3>
	<h3>request email : <%=request.getAttribute("requestEmail")%></h3>
	<h3>session email : <%=session.getAttribute("sessionEmail")%></h3>
	
	<a href="index.jsp">메인으로</a>
</body>
</html>