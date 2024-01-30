<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- qna_delete.jsp -->
<%@ page import="java.sql.*, util.*" %>
<%
	//게시글 삭제 요청
	int qna_num = Integer.parseInt(request.getParameter("qna_num"));

	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	
	String sql = "DELETE FROM qna_board WHERE qna_num = ?";
	sql = "UPDATE qna_board SET qna_delete ='Y' WHERE qna_num = ?";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, qna_num);
		pstmt.executeUpdate();
		response.sendRedirect("qna_list.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(pstmt,conn);
	}
%>











