<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	EL SESSION : ${member}<br/>
	<%
		String id = request.getParameter("id");
		request.setAttribute("userID", id);
	%>
	request ID : ${userID}<br/>
	<input type="text" value="${param.id}"/>
</body>
</html>