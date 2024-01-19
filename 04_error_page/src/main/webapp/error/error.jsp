<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error.jsp</title>
</head>
<body>
	<h1>Error Page</h1>
	<h2>서비스 진행준 문제가 있습니다.</h2>
	<h3><%= exception.getMessage() %></h3>
	<h4><%= exception.toString() %></h4>
	<a href="../index.jsp">메인으로</a>
</body>
</html>