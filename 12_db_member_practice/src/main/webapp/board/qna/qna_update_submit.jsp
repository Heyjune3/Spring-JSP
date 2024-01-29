<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.*" %>
<%
	// 게시글 수정 요청 처리
	String qnaNum = request.getParameter("qna_num");
	String qna_name = request.getParameter("qna_name");
	String qna_title = request.getParameter("qna_title");
	String qna_content = request.getParameter("qna_content");
	String qnaWriter = request.getParameter("qna_write_num");
	
	int qna_num = Integer.parseInt(qnaNum);
	int qna_write_num = Integer.parseInt(qnaWriter);
	
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	
	String sql = "UPDATE qna_board SET qna_name= ?, qna_title= ? , qna_content= ? WHERE qna_num= ? AND qna_write_num= ?";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, qna_name);
		pstmt.setString(2, qna_title);
		pstmt.setString(3, qna_content);
		pstmt.setInt(4, qna_num);
		pstmt.setInt(5, qna_write_num);
		int result = pstmt.executeUpdate();
		if(result == 1){
			response.sendRedirect("qna_detail.jsp?qna_num="+qna_num);
		}else{
			response.sendError(403);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(conn, pstmt);
	}
%>