<%@page import="util.JDBCUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="checkAdmin.jsp" %>
<!-- memberUpdate.jsp -->
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String strAge = request.getParameter("age");
	int age = Integer.parseInt(strAge);
	
	Connection conn = JDBCUtil.getConnection();
	String sql = "UPDATE test_member SET pass = ? , name = ? , addr = ? , phone = ? , gender = ? , age = ? WHERE id = ?";	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pass);
	pstmt.setString(2, name);
	pstmt.setString(3, addr);
	pstmt.setString(4, phone);
	pstmt.setString(5, gender);
	pstmt.setInt(6, age);
	pstmt.setString(7, id);
	
	pstmt.executeUpdate();
	JDBCUtil.close(pstmt,conn);
	response.sendRedirect("memberList.jsp");
	
%>









