<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- withdraw.jsp -->
<%
	// 회원탈퇴 요청이 들어온 회원 정보를 회원 목록에서 삭제
	
	// 로그인 된 사용자 정보
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");

	// 등록된 회원 목록을 저장하는 List
	List<MemberVO> memberList = (List<MemberVO>)application.getAttribute("memberList");
	
	// 회원 탈퇴 요청이 들어온 회원 정보를 회원 목록에서 삭제
	// equals method를 이용하여 id가 일치하는 회원 정보 List에서 삭제
	memberList.remove(loginMember);
	
	System.out.println("회원 탈퇴 요청 처리 후 회원 목록 정보");
	System.out.println(memberList);
	System.out.println("=========================================");
	
	// 회원 정보 삭제 요청 처리 후 로그인 정보도 삭제
	response.sendRedirect("logOut.jsp");
%>







