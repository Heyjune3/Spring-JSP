<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ include file="/checkAdmin.jsp" %>
<%@ page import="java.sql.*, util.*, vo.NoticeVO" %>
<%
	String strNum = request.getParameter("notice_num");

	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	NoticeVO n = null;
	
	String sql = "SELECT * FROM notice_board WHERE notice_num = ? ";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(strNum));
		rs = pstmt.executeQuery();
		if(rs.next()){
			n = new NoticeVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getString(5),
				rs.getTimestamp(6)
			);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(conn, pstmt, rs);
	}
	
%>
<section>
	<form action="notice_update_submit.jsp" method="POST">
		<!-- 변경된 내용으로 수정될 게시글 번호 -->
		<input type="hidden" name="notice_num" value="<%=n.getNotice_num() %>"/>
		<table>
			<tr>
				<th colspan="2"><h1>공지글 작성</h1></th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="notice_author" value="<%=loginMember.getName()%>"/>
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="notice_category">
						<option value="<%=n.getNotice_category() %>" selected><%=n.getNotice_category() %></option>
						<option value="공지">공지</option>
						<option value="알림">알림</option>
						<option value="이벤트">이벤트</option>
						<option value="당첨">당첨</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="notice_title" autofocus required style="width:100%;" value="<%=n.getNotice_title()%>"/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="notice_content" required style="resize:none; width:700px; height:200px;">
					<%=n.getNotice_content() %></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="작성완료"/>
					<input type="reset" value="초기화"/>
				</th>
			</tr>
		</table>
	</form>
</section>
<%@ include file="/common/footer.jsp"%>














