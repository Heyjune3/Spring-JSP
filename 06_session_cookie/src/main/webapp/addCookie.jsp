<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="check.jsp" %>
	<hr/>
	<h1>ADD COOKIE</h1>
	
	<%	
		// 쿠키 등록 1번 방법
		// Set-Cookie (브라우저 개발자창(F12) -> Network -> 쿠키클릭)
		// Max-Age == 쿠키 유지 시간 2592000 : 60 * 60 * 24 * 30 == 초단위
		response.addHeader("Set-Cookie","id=id001; Max-Age=2592000; path=/");
	
		// 2번 방법
		// new Cookie() 빨간줄 없애기 == 필수요소 입력 : 어떤 구분자로 어떤 value 값을 사용할 것인가
		Cookie cookie = new Cookie("PM_NAME","이준호");
		cookie.setMaxAge(2592000);
		cookie.setPath("/");
		// response 응답 객체가 실어줌
		response.addCookie(cookie);
		
	%>
	<a href="index.jsp">메인으로</a>
	
</body>
</html>