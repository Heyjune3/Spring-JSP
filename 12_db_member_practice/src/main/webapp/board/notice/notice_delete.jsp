<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.*" %>
<%
	String notice_num = request.getParameter("notice_num");

	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	String sql = "DELETE FROM notice_board WHERE notice_num = ?";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(notice_num));
		int result = pstmt.executeUpdate();
		if(result == 1){
			response.sendRedirect("notice_success.jsp");
		}else{
			response.sendRedirect("notice_detail.jsp?notice_num="+notice_num);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(conn, pstmt);
	}
%>