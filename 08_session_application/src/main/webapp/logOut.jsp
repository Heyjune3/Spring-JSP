<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("loginMember");

	// 사용자 pc에 저장된 쿠키 정보 삭제
	Cookie cookie = new Cookie("uid","");
	cookie.setMaxAge(0);
	cookie.setPath("/"); // 지정하지 않으면 ContextPath
	response.addCookie(cookie);
%>
<script>
	alert('로그아웃 완료');
	// location = 주소 표시줄 정보 저장
	location.href='main.jsp';
</script>