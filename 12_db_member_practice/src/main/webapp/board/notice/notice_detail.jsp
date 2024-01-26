<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notice_detail.jsp -->
<%@ include file="/common/header.jsp" %>
<%@ page import="java.sql.*, util.*, vo.NoticeVO" %>
<%
	// 상세보기 요청한 게시글 번호
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
				rs.getInt("notice_num"),
				rs.getString("notice_category"),
				rs.getString("notice_author"),
				rs.getString("notice_title"),
				rs.getString("notice_content"),
				rs.getTimestamp("notice_date")
			);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(rs,pstmt,conn);
	}
%>
<section>
	<table class="list">
		<tr>
			<th colspan="2">
				<h1><%=n.getNotice_category()%></h1>
			</th>
		</tr>
		<tr>
			<td>작성자</td>
			<td>
				<%=n.getNotice_author() %>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<%=n.getNotice_title() %>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<div style="width:600px; min-height:300px;">
					<pre><%=n.getNotice_content()%></pre>
				</div>
			</td>
		</tr>
		<tr>
			<td>작성시간</td>
			<td>
				<%=n.getNotice_date()%>
			</td>
		</tr>
		<% if(loginMember != null && loginMember.getId().equals("admin")){ %>
		<tr>
			<th colspan="2">
				<a href="notice_update.jsp?notice_num=<%=n.getNotice_num()%>">[수정]</a>
				
				<a href="notice_delete.jsp?notice_num=<%=n.getNotice_num()%>">[삭제]</a>
			</th>
		</tr>
		<%} %>
	</table>
</section>
<%@ include file="/common/footer.jsp" %>










