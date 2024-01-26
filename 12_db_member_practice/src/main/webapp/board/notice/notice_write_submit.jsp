<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.*" %>
<%
	String notice_category = request.getParameter("notice_category");
	String notice_author = request.getParameter("notice_author");
	String notice_title = request.getParameter("notice_title");
	String notice_content = request.getParameter("notice_content");
	
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	String sql = "INSERT INTO notice_board VALUES(null,?,?,?,?,now())";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, notice_category);
		pstmt.setString(2, notice_author);
		pstmt.setString(3, notice_title);
		pstmt.setString(4, notice_content);
		
		int result = pstmt.executeUpdate();
		if(result == 1){
			response.sendRedirect("notice_success.jsp");
		}else{
			response.sendRedirect("notice_fail.jsp");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(conn, pstmt);
	}
			
%>