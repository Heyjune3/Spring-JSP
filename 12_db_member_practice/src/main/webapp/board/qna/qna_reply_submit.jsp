<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- qna_reply_submit.jsp -->
<%@ page import="java.sql.*, util.*" %>
<%
	// 답변글 등록 요청 처리
	String qna_name = request.getParameter("qna_name");
	String qna_title = request.getParameter("qna_title");
	String qna_content = request.getParameter("qna_content");
	int qna_write_num = Integer.parseInt(request.getParameter("qna_write_num"));
	int qna_re_ref = Integer.parseInt(request.getParameter("qna_re_ref"));
	int qna_re_lev = Integer.parseInt(request.getParameter("qna_re_lev"));
	int qna_re_seq = Integer.parseInt(request.getParameter("qna_re_seq"));
	
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	
	String sql = "UPDATE qna_board SET qna_re_seq = qna_re_seq + 1" 
			  + " WHERE qna_re_ref = ? AND qna_re_seq > ? ";
			  
	String insertSql = "INSERT INTO qna_board " 
			         +" VALUES(null,?,?,?,?,?,?,?,0,now(),'N')";		  
    try{
    	conn.setAutoCommit(false);
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setInt(1, qna_re_ref);
    	pstmt.setInt(2, qna_re_seq);
    	pstmt.executeUpdate();
    	
    	JDBCUtil.close(pstmt);
    	
    	pstmt = conn.prepareStatement(insertSql);
    	pstmt.setString(1, qna_name);
    	pstmt.setString(2, qna_title);
    	pstmt.setString(3, qna_content);
    	pstmt.setInt(4, qna_re_ref);
    	pstmt.setInt(5, qna_re_lev + 1);
    	pstmt.setInt(6, qna_re_seq + 1);
    	pstmt.setInt(7, qna_write_num);
    	
    	pstmt.executeUpdate();
    	conn.commit();
    }catch(Exception e){
    	conn.rollback();
    }finally{
    	conn.setAutoCommit(true);
    	JDBCUtil.close(pstmt, conn);
    	response.sendRedirect("qna_list.jsp");
    }
	
%>













