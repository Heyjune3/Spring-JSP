<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>response.jsp</h2>
	<h3>result pageContext : <%=pageContext.getAttribute("index") %></h3>
	<h3>result request : <%=request.getAttribute("index") %></h3>
	<h3>request servlet attr : <%=request.getAttribute("attrID") %></h3>
	<h3>request parameter : <%=request.getParameter("id") %></h3>
</body>
</html>