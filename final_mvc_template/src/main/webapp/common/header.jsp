<%@page import="beans.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Member</title>
<% String context = request.getContextPath(); %>
<link href="<%=context %>/css/header.css" rel="stylesheet" type="text/css" />
<link href="<%=context %>/css/footer.css" rel="stylesheet" type="text/css" />
<link href="<%=context %>/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%
		MemberVO member = (MemberVO)session.getAttribute("member");
	%>
	<header>
		<div>
			<ul>
				<li>
					<a href="#">home</a>
				</li>
				<li>
					<a href="#"><%=member.getName() %></a>님 방가
				</li>
				<li>
					<a href="">회원관리</a>
				</li>
				<li><a href="logOut.mc">로그아웃</a></li>
				<li><a href="login.mc">로그인</a></li>
				<li><a href="join.mc">회원가입</a></li>
			</ul>
		</div>
		<div>
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">질문과답변</a></li>
			</ul>
		</div>
	</header>
	
	
	
	
	
	
	
	
	
	
	
	
	
	