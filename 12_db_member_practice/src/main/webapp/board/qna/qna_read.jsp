<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.*" %>
<%
	int qna_num = Integer.parseInt(request.getParameter("qna_num"));

// 상세보기 요청 시 조회 수 증가
	String readSql = "UPDATE qna_board SET qna_readcount = qna_readcount + 1 WHERE qna_num = ?";
	
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;

	try{
		pstmt = conn.prepareStatement(readSql);
		pstmt.setInt(1, qna_num);
		pstmt.executeUpdate();
		
		response.sendRedirect("qna_detail.jsp?qna_num=" + qna_num);
	}catch(Exception e){
		
	}finally{
		JDBCUtil.close(pstmt, conn);
	}
		
%>