<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(request.getParameter("aa") == null){
			// ClassNotFoundException을 발생시킨다.
			throw new ClassNotFoundException("없지롱.");
		}
	%>

</body>
</html>