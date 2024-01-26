<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- logout.jsp -->
<%
	// session에 등록된 인증된 사용자 정보 삭제
	session.removeAttribute("login");
	
	// 쿠키 정보 삭제
	Cookie cookie = new Cookie("rememberMe","");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
%>
<script>
	alert('처리완료');
	location.replace("index.jsp");
</script>