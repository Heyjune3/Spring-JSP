<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.MemberVO"%>
<%
	// 사용자가 로그인된 상태인지를  session의 loginMember 속성값으로 판별
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");

	// cookie 정보를 이용한 자동 로그인 기능 추가
	// request로 전달된 브라우저의 쿠키 목록
	Cookie[] cookies = request.getCookies();
	// 비로그인 상태에서 쿠키 정보가 전달 되면 자동로그인 작업 수행
	if(loginMember == null && cookies != null){
		// 전달된 쿠키 정보 reading
		for(Cookie c : cookies){
			// value - name
			String name = c.getName();
			// name이 rememberMe 라면 value == id
			String value = c.getValue();
			if(name.equals("rememberMe")){
				// 자동 로그인용 쿠키 확인
				// 등록된 회원 목록에서 id값(value)이 일치하는 사용자 정보 검색
				// (자동로그인 요청한 사용자 id와 일치하는 회원 정보를 목록에서 검색)
				List<MemberVO> memberList = (List<MemberVO>)application.getAttribute("memberList");
				if(memberList != null && !memberList.isEmpty()){
					// 회원 목록 list 정보가 존재할 경우에 확인
					int index = memberList.indexOf(new MemberVO(value));
					if(index >= 0){
						loginMember = memberList.get(index);
						session.setAttribute("loginMember", loginMember);
						break;
					}
				}
			}
		}
	}
%>
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
		 	<!-- session에 loginMember 속성값이 존재 -->
		 	<% if(loginMember != null){ %>
			<!-- 로그인 상태 -->
			<li><a href="info.jsp"> 
					<!-- 회원이름 -->
				<%=loginMember.getName()%>	 
				</a>님 반갑습니다.
			</li>
			<li><a href="logOut.jsp">로그아웃</a></li>
			<%}else{ %>
			<!-- 비 로그인 상태 -->
		 	<li><a href="login.jsp">로그인</a></li>
		 	<li><a href="join.jsp">회원가입</a></li>
		 	<%}%>
		 </ul>
 </header>
 
 
 
 
 
 