<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!-- isErrorPage : 밑의 exception을 사용할 수 있게 만들어주는 태그 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error 500</title>
</head>
<body>
	<h1>서비스 이용에 불편을 드려 죄송합니다.</h1>
	<h3><%= exception.toString() %></h3>
	<a href="../index.jsp">메인으로</a>
</body>
</html>