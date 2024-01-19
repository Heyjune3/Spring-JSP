<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test 405</title>
</head>
<body>
	<%
		// request = client가 요청한 전송 방식, GET OR POST
		String method = request.getMethod();
		System.out.println("405 전송방식 : " + method);
		if(method.equalsIgnoreCase("get")){
			response.sendError(405,"지정된 전송 방식이 아닙니다.");
			return;
		}
		
		// POST
		String ageStr = request.getParameter("age");
		System.out.println(ageStr);
		if(ageStr.equals("")){
			out.println("값이 입력되지 않았습니다.");
		}else{
			out.println("당신의 나이는 "+ageStr+" 입니다.");
		}
	%>
</body>
</html>