<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error_500.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String ageStr = request.getParameter("age");
		int age = Integer.parseInt(ageStr);
	%>
	당신의 나이는 : <%= age %> 입니다.
</body>
</html>