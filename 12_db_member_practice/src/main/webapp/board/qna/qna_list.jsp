<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- qna_list.jsp -->
<%@ include file="/common/header.jsp"%>
<%@ page import="java.util.*, java.sql.*, vo.*, util.*" %>
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
	//                         (페이지번호, 한번에 보여줄 게시물 개수)
	Criteria cri = new Criteria(pageNum, 10);
	
	// 요청한 페이지, 한번에보여줄 게시물 개수, 전체 게시물 개수, 한번에 보여줄 페이지 번호 개수
	// 이를 이용하여 페이지 블럭에 필요한 정보를 계산해서 알려주는 class
	PageMaker pm = new PageMaker();
	pm.setCri(cri);
	pm.setDisplayPageNum(10);
	
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM qna_board "
			+" ORDER BY qna_re_ref DESC, qna_re_seq ASC limit ?, ?";
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
			char qna_delete = rs.getString("qna_delete").charAt(0);
			vo.setQna_delete(qna_delete);
			qnaList.add(vo);
		}
		
		// 게시글 전체 개수
		// 기존에 사용한 자원 해제
		JDBCUtil.close(rs, pstmt);
		
		pstmt = conn.prepareStatement(countSql);
		rs = pstmt.executeQuery();
		int totalCount = 0;
		if(rs.next()){
			totalCount = rs.getInt(1);
		}
		// 전체게시물개수를 이용해서 페이징 블럭 출력에 필요한 정보 계산
		pm.setTotalCount(totalCount);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(rs,pstmt,conn);
	}
%>
<section>
	<form>
		<table class="list">
			<tr>
				<th colspan="8">질문과 답변 게시판</th>
			</tr>
			<tr>
				<th colspan="8"><%=pm%></th>
			</tr>
			<% if(loginMember != null) {%>
			<tr>
				<th colspan="8" style="text-align:right;">
					<a href="qna_write.jsp">질문 작성하러 가기</a>
				</th>
			</tr>	
			<%}%>
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
			<% if(!qnaList.isEmpty()){ %>
				<!-- 등록된 게시물 존재 -->
				<% for(BoardVO vo : qnaList){ %>
				<!-- 삭제되지 않은 게시물 -->
				<% if(vo.getQna_delete() == 'N'){ %>
				<tr>
					<td><%=vo.getQna_num() %></td>
					<td><%=vo.getQna_re_ref() %></td>
					<td><%=vo.getQna_re_lev() %></td>
					<td><%=vo.getQna_re_seq() %></td>
					<td style="text-align:left;padding-left:5px;">
						<!-- 제목 클릭 시 상세보기 페이지 이동 -->
						
						<% for(int i = 0; i < vo.getQna_re_lev(); i ++){ %>
							&nbsp;&nbsp;&nbsp;&nbsp;
						<%}%>
						<% if(vo.getQna_re_lev() > 0){ %>
						<!-- ㅂ + 한자 키 + 6 -->
							└>
						<%} %>
						<a href="qna_read.jsp?qna_num=<%=vo.getQna_num()%>">
						<%=vo.getQna_title() %>
						</a>
					</td>
					<td><%=vo.getQna_name() %></td>
					<td><%=vo.getQna_date() %></td>
					<td><%=vo.getQna_readcount() %></td>
				</tr>
				<%}else{ %>
				<tr>
					<th colspan="8">삭제된 게시물 입니다.</th>
				</tr>
				<%} // end  if else%>	
				<%} // end for%>
				<!-- 페이징 블럭 출력 -->
				<tr>
					<th colspan="5">
						<%if(pm.isFirst()){ %>
							<a href="<%=pm.makeQuery(1)%>">[처음]</a>
						<%}%>
						<%if(pm.isPrev()){ %>
									<!-- 	  [1][][][][5] -->
									<!-- [이전][6][][][][10] -->
							<a href="<%=pm.makeQuery(pm.getStartPage()-1)%>">[이전]</a>
						<%}%>
						<% for(int i = pm.getStartPage(); i <= pm.getEndPage(); i++){ %>
							<a href="<%=pm.makeQuery(i)%>">[<%=i%>]</a>					
						<%} %>
						<%if(pm.isNext()){ %>
									<!--  [1][][][][5][다음] -->
									<!-- [이전][6][][][][10] -->
							<a href="<%=pm.makeQuery(pm.getEndPage()+1)%>">[다음]</a>
						<%}%>
						<% if(pm.isLast()){ %>
							<a href="<%=pm.makeQuery(pm.getMaxPage())%>">[마지막]</a>
						<%}%>
					</th>
				</tr>
			<%}else{ %>
				<!-- 등록된 게시물 없음 -->
				<tr>
					<th colspan="5">등록된 게시물 없음</th>
				</tr>
			<%}%>
		</table>
	</form>
</section>
<%@ include file="/common/footer.jsp"%>










