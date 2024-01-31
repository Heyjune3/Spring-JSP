<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Formatter</title>
</head>
<body>
	<form action="jstlFmtTest.jsp">
		<input type="date" name="selectedDate" pattern="yyyy-MM-dd"/>
		<button>확인</button>
	</form>
</body>
</html>