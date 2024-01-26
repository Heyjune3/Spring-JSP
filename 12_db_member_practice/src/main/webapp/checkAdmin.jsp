<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO member = (MemberVO)session.getAttribute("login");
	if(member == null || !member.getId().equals("admin")){
		// 403 error Forbidden - 사용할 권한이 없음. 권한 불충분
		response.sendError(403);
		return;
	}
%>