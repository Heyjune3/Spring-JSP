<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- memberDelete.jsp -->
    <%@ include file="checkAdmin.jsp" %>
    <%@ page import="java.sql.*, util.*" %>
<%
	String strNum = request.getParameter("num");
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	String sql = "DELETE FROM test_member WHERE num =?";
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,Integer.parseInt(strNum));
		int result = pstmt.executeUpdate();
		if(result == 0){
			response.sendError(404,"삭제된 회원 없음");
			return;
		}else{
			response.sendRedirect("memberList.jsp");
		}
	}catch(Exception e){
		response.sendError(404,"삭제된 회원 없음");
		return;
	}finally{
		JDBCUtil.close(conn, pstmt);
	}
%>












