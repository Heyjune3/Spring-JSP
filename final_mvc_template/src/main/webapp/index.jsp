<%@page import="java.sql.Connection"%>
<%@page import="util.DBCPUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"  %>
<%
	Connection conn = DBCPUtil.getConnection();
%>
<section class="wrap">
	<h1 class="default">메인 페이지 입니다.</h1>
</section>
<%@ include file="/common/footer.jsp"  %>




