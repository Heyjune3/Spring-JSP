<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.sql.*,vo.BoardVO, util.*"%>
<%@ include file="/common/header.jsp"%>
<%
	// 페이징 처리된 qna_board 게시물 목록
	List<BoardVO> qnaList = new ArrayList<>();
		
	// 사용자가 요청한 페이지 번호
	String strPage = request.getParameter("page");
	int pageNum = 1;
	if(strPage != null){
		// 사용자가 요청한 페이지 번호가 존재하면 저장
		// 아니면 기본페이지인 1page 출력
		pageNum = Integer.parseInt(strPage);
	}
							 // 페이지번호, 한번에 보여줄 게시물 개수
	Criteria cri = new Criteria(pageNum, 10);
							 
	// 요청한 페이지, 한번에 보여줄 게시물 개수, 전체 게시물 개수, 한번에 보여줄 페이지 번호 개수
	// 이를 이용하여 페이지 블럭에 필요한 정보를 계산해서 알려주는 class
	PageMaker pm = new PageMaker();
	pm.setCri(cri);
	pm.setDisplayPageNum(10);
	
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM qna_board ORDER BY qna_re_ref DESC, qna_re_seq ASC limit ?, ?";
	String countSql = "SELECT count(*) FROM qna_board";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cri.getStartRow());
		pstmt.setInt(2, cri.getPerPageNum());
		rs = pstmt.executeQuery();
		while(rs.next()){
		BoardVO vo = new BoardVO(
				rs.getInt("qna_num"),
				rs.getString("qna_name"),
				rs.getString("qna_title"),
				rs.getString("qna_content"),
				rs.getInt("qna_re_ref"),
				rs.getInt("qna_re_lev"),
				rs.getInt("qna_re_seq"),
				rs.getInt("qna_write_num"),
				rs.getInt("qna_readcount"),
				rs.getTimestamp("qna_date")
				);
		qnaList.add(vo);
		}
		
		// 게시글 전체 개수
		// 기존에 사용한 자원 해제
		JDBCUtil.close(rs,pstmt);
		
		pstmt = conn.prepareStatement(countSql);
		rs = pstmt.executeQuery();
		int totalCount = 0;
		if(rs.next()){
			totalCount = rs.getInt(1);
		}
		// 전체 게시물 개수를 이용해서 페이징 블럭 출력에 필요한 정보 계산
		pm.setTotalCount(totalCount);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(conn, pstmt, rs);
	}
%>
<section>
	<form>
		<table class="list">
			<tr>
				<th colspan="8">질문과 답변 게시판</th>
			</tr>
			<tr>
				<th colspan="8"><%=pm %></th>
			</tr>
			<% if(loginMember != null){ %>
			<tr>
				<th colspan="8"	style="text-align:right;">
					<a href="qna_write.jsp">질문 작성하러 가기</a>
				</th>
			</tr>
			<%} %>
			<tr>
				<th>글번호</th>
				<th>ref</th>
				<th>lev</th>
				<th>seq</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성시간</th>
				<th>조회수</th>
				
			</tr>
			<%if(!qnaList.isEmpty()){ %>
				<!-- 등록된 게시물 존재 -->
				<% for(BoardVO vo : qnaList){ %>
				<tr>
					<td><%=vo.getQna_num() %></td>
					<td><%=vo.getQna_re_ref() %></td>
					<td><%=vo.getQna_re_lev() %></td>
					<td><%=vo.getQna_re_seq() %></td>
					<td>
					<!-- 제목 클릭시 상세보기 페이지 이동 -->
					<% for(int i = 1; i < vo.getQna_re_lev(); i ++){ %>
						&nbsp;&nbsp;&nbsp;&nbsp;
					<%} %>
					<% if(vo.getQna_re_lev() > 0){ %>
						└>
					<%} %>
					<a href="qna_read.jsp?qna_num=<%=vo.getQna_num()%>">
					<%=vo.getQna_title() %></a></td>
					<td><%=vo.getQna_name() %></td>
					<td><%=vo.getQna_date() %></td>
					<td><%=vo.getQna_readcount() %></td>
				</tr>
				<%} %>
				<!-- 페이징 처리 -->
				<tr>
					<th colspan="8">
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
				<tr>
					<th colspan="8">등록된 게시물 없음</th>
				</tr>
			<%} %>
		</table>
	</form>
</section>

<%@ include file="/common/footer.jsp"%>