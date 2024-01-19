<%@page import="java.util.List"%>
<%@page import="vo.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- header.jsp -->
<%
	// loginMember로 등록된 정보가 존재하면 인증이 완료된 사용자
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
	
	// 로그인이 안된 사용자 일 경우
	if(loginMember == null){
		// 브라우저 에서 전달된 쿠키 정보 확인
		Cookie[] cookies = request.getCookies();
		String cookieUid = null;
		if(cookies != null){
			// 쿠키 정보가 존재할 때 로그인 상태 유지용 쿠키가 존재하는지 확인
			for(Cookie c : cookies){
				if(c.getName().equals("uid")){
					cookieUid = c.getValue();
					break;
				}
			}
		} // 로그인 저장 용 쿠키 정보 확인 완료
		
		if(cookieUid != null){
			// cookie 에 등록된 사용자 아이디 검색 완료
			List<MemberVO> memberList = (List<MemberVO>)application.getAttribute("memberList");
			if(memberList != null){
				for(MemberVO member : memberList){
					if(member.getUid().equals(cookieUid)){
						loginMember = member;
						session.setAttribute("loginMember", loginMember);
						break;
					}
				}
			}// 회원 목록 존재
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scope Project</title>
</head>
<body>
<header>
<% String path = request.getContextPath(); %>
	<a href="<%=path%>">MAIN PAGE</a> |
	<% if(loginMember == null){ %>
	<a href="<%=path%>/join.jsp">JOIN PAGE</a> |
	<!-- JSP는 파일의 경로가 아닌 URL의 경로로 지정되기 때문에 상대경로보단 절대경로 -->
	<!-- <a href="../join.jsp">JOIN PAGE</a> -->
	<a href="<%=path%>/login.jsp">LOGIN PAGE</a> |
	<%}else{ %>
	<%= loginMember.getUname() %>님 반갑습니다.|
	<a href="logOut.jsp">Log Out</a>
	<%} %>
	<hr/>
	
	<%
		String message = (String)request.getAttribute("message");
		if(message != null){
	%>
		<script>
			alert('<%=message%>');
		</script>
	<% } %>	
</header>