<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>알 수 없는 오류</h1>
	<h3>이용에 불편을 드려 죄송합니다.</h3>
	<h4>(--)(__)3(--)</h4>
	<h5>oT^To</h5>
	<a href="index.jsp">메인으로</a>
	<!-- 위의 isErrorPage 입력 시 exception에 빨간줄 사라짐 -->
	<%= exception.getMessage() %>
</body>
</html>