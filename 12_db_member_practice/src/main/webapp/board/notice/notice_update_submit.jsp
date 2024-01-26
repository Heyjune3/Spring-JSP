<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.*, vo.* "%>
<%

	String notice_num = request.getParameter("notice_num");
	String notice_category = request.getParameter("notice_category");
	String notice_title = request.getParameter("notice_title");
	String notice_content = request.getParameter("notice_content");
	
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	String sql = "UPDATE notice_board SET "
				+ " notice_category = ?, notice_title = ?,"
				+ " notice_content = ?, notice_date = now() WHERE notice_num = ? ";
	System.out.println(sql);
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, notice_category);
		pstmt.setString(2, notice_title);
		pstmt.setString(3, notice_content);
		pstmt.setInt(4, Integer.parseInt(notice_num));
		String nextPage = "notice_fail.jsp";
		int result = pstmt.executeUpdate();
		if(result == 1){
			nextPage = "notice_success.jsp";
		}
		response.sendRedirect(nextPage);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(conn, pstmt);
	}
%>