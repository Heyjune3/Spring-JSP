<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ page import="java.sql.*, vo.*, util.*" %>
<%
	// 상세보기 요청한 게시글 번호
	String qnaNum = request.getParameter("qna_num");
	int qna_num = Integer.parseInt(qnaNum);
	
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM qna_board WHERE qna_num = ? ";
	
	// 검색된 게시글 정보를 저장할 class
	BoardVO board = null;
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, qna_num);
		rs = pstmt.executeQuery();
		if(rs.next()){
			board = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getInt(5),
				rs.getInt(6),
				rs.getTimestamp(7)
			);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(rs,pstmt,conn);
	}
%>
<section>
	<form action="qna_update_submit.jsp" method="POST">
		<input type="hidden" name="qna_num" value="<%=board.getQna_num()%>"/>
		<input type="hidden" name="qna_write_num" value="<%=board.getQna_write_num()%>"/>
		<table>
			<tr>
				<th colspan="2"><h1>게시글 수정</h1></th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="qna_name" value="<%=loginMember.getName()%>" readonly/>
				</td>
			</tr>
			<tr>
				<td>글 제목</td>
				<td>
					<input type="text" name="qna_title" value="<%=board.getQna_title()%>" autofocus required/>
				</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>
					<textarea name="qna_content" required rows="10" cols="50"><%=board.getQna_content()%></textarea>
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
<%@ include file="/common/footer.jsp"%>