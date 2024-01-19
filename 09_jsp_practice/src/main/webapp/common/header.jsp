<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		 <ul>
		 	<li><a href="index.jsp">HOME</a></li>
			<!-- 로그인 상태 -->
			<li><a href="info.jsp"> <!-- 회원이름 --> </a>님 반갑습니다.</li>
			<li><a href="logOut.jsp">로그아웃</a></li>
			
			<!-- 비 로그인 상태 -->
		 	<li><a href="login.jsp">로그인</a></li>
		 	<li><a href="join.jsp">회원가입</a></li>
		 </ul>
 </header>
 <hr/>
<%
 	String message = (String)request.getAttribute("message");
 	if(message != null){
 %>
 	<script>
 		alert('<%=message%>');
 	</script>
 <%} %>
 
 
 
 