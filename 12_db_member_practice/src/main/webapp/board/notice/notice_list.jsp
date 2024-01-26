<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp" %>
<%@ page import="java.sql.*, util.*, vo.NoticeVO, java.util.*" %>
<%
	// 사용자가 요청한 페이지 번호
	String strPageNum = request.getParameter("page");
	int pageNum = 1;
	if(strPageNum != null){
		pageNum = Integer.parseInt(strPageNum);
	}
	
	Criteria cri = new Criteria(pageNum, 10);
	PageMaker pm = new PageMaker();
	pm.setCri(cri);

	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// SELECT 된 게시물을 저장할 리스트
	List<NoticeVO> noticeList = new ArrayList<>();
	String sql = "SELECT * FROM notice_board ORDER BY notice_num DESC limit ? , ?";
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cri.getStartRow());
		pstmt.setInt(2, cri.getPerPageNum());
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			noticeList.add(new NoticeVO(
					rs.getInt(1),			// notice_num
					rs.getString(2),		// notice_category
					rs.getString(3),		// notice_author
					rs.getString(4),		// notice_title
					rs.getString(5),		// notice_content
					rs.getTimestamp(6)		// notice_date
					));
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(conn, pstmt, rs);
	}
	
	// 전체 게시물 수
	try{
		sql = "SELECT count(*) FROM notice_board";
		conn = JDBCUtil.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int totalCount = 0;
		if(rs.next()){
			totalCount = rs.getInt(1);
		}
		pm.setTotalCount(totalCount);
	}catch(Exception e){
		
	}finally{
		JDBCUtil.close(conn, pstmt, rs);
	}
	
%>
<section>
	<table class="list">
		<tr>
			<th colspan="4">
				<h1>공지사항</h1>
			</th>
		</tr>
		<tr>
			<th colspan="4"><%=pm %></th>
		</tr>
		<% if(loginMember != null && loginMember.getId().equals("admin")){ %>
		<tr>
			<td colspan="4" style="text-align:right">
			<a href="notice_write.jsp">공지글 작성</a>
			</td>
		</tr>
		<%} %>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<%if(!noticeList.isEmpty()){ %>
			<!-- 게시물 목록 존재 -->			
			<% for(NoticeVO n : noticeList){ %>
			<tr>
				<td><%=n.getNotice_num() %></td>
				<td>
				<a href="notice_detail.jsp?notice_num=<%=n.getNotice_num() %>">
				[<%=n.getNotice_category() %>]<%=n.getNotice_title() %>
				</a>
				</td>
				<td><%=n.getNotice_author() %></td>
				<td><%=n.getNotice_date() %></td>
			</tr>
			<%} %>
			<!-- 페이징 처리 -->
			<tr>
		<th colspan="4">
		<%if(pm.isFirst()){ %>
			<a href="<%=pm.makeQuery(1) %>">[처음]</a>
		<%} %>
		<%if(pm.isPrev()){ %>
						<!-- 	  [1][][][][5] -->
						<!-- [이전][6][][][][10] -->
			<a href="<%=pm.makeQuery(pm.getStartPage()-1) %>">[이전]</a>
		<%} %>
		<% for(int i = pm.getStartPage(); i <=pm.getEndPage(); i++){ %>
		<%-- <a href="?page=<%=i%>&perPageNum=<%=pm.getCri().getPerPageNum()%>">[<%=i %>]</a> --%>
			<a href="<%=pm.makeQuery(i)%>">[<%=i %>]</a>
		<%} %>
		<%if(pm.isNext()){ %>
						<!--  [1][][][][5][다음] -->
						<!-- [이전][6][][][][10] -->
			<a href="<%=pm.makeQuery(pm.getEndPage()+1) %>">[다음]</a>
		<%} %>
		<%if(pm.isLast()){ %>
			<a href="<%=pm.makeQuery(pm.getMaxPage()) %>">[마지막]</a>
		<%} %>
		</th>
	</tr>
		<%}else{ %>
			<!-- 등록된 게시물 없음 -->
			<tr><th colspan="4">등록된 게시물이 없습니다.</th></tr>
		<%} %>
	</table>
</section>
<%@ include file="../../common/footer.jsp" %>









