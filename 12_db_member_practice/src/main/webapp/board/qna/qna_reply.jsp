<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- qna_reply.jsp -->
<%@ include file="/common/header.jsp" %>
<%@ page import="java.sql.*, util.*" %>
<%
	String originalNum = request.getParameter("qna_num");
	
	int qna_re_ref = 0;		// 그룹 번호
	int qna_re_lev = 0;		// view depth
	int qna_re_seq = 0;		// 답변글 정렬 번호
	
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT qna_re_ref, qna_re_lev, qna_re_seq FROM qna_board "
			    + " WHERE qna_num = ? ";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(originalNum));
		rs = pstmt.executeQuery();
		if(rs.next()){
			qna_re_ref = rs.getInt(1);
			qna_re_lev = rs.getInt(2);
			qna_re_seq = rs.getInt(3);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(rs,pstmt,conn);
	}
	
%>
<section>
	<form action="qna_reply_submit.jsp" method="POST">
		<input type="hidden" name="qna_re_ref" value="<%=qna_re_ref%>"/>
		<input type="hidden" name="qna_re_lev" value="<%=qna_re_lev%>"/>
		<input type="hidden" name="qna_re_seq" value="<%=qna_re_seq%>"/>
		<input type="hidden" name="qna_write_num" value="<%=loginMember.getNum()%>"/>
		<table>
			<tr>
				<th colspan="2"><h1>답변글 작성</h1></th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="qna_name" 
						   value="<%=loginMember.getName()%>" readonly/>
				</td>
			</tr>
			<tr>
				<td>글 제목</td>
				<td>
					<input type="text" name="qna_title" autofocus required />
				</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>
					<textarea name="qna_content" required cols="50" rows="10"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button>작성완료</button>
					<button type="reset">새로 작성</button>
				</th>
			</tr>
		</table>
	</form>
</section>
<%@ include file="/common/footer.jsp" %>













