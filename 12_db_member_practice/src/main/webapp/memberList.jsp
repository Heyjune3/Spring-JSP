<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- memberList.jsp -->
<%@ include file="common/header.jsp" %>
<%@ include file="checkAdmin.jsp" %>
<%
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	// 검색된 회원 목록을 저장할 리스트 
	List<MemberVO> memberList = new ArrayList<>();
	
	// 사용자가 요청한 게시물의 페이지 번호
	String strPage = request.getParameter("page");
	// 페이지당 보여줄 게시물 개수
	String paramPerPageNum = request.getParameter("perPageNum");
	// 이름으로 검색된 회원 목록
	String search = request.getParameter("search");
	// null - search 파라미터가 없을 경우에는 공백으로 치환하여 모든 정보 검색
	// WHERE name LIKE CONCAT('%','','%')이렇게 하면 null 이 아니라 공백으로 인식
	if(search == null){
		search ="";
	}
	
	int pageNum = 0, perPageNum = 0;
	if(strPage != null && !strPage.equals("")){
		pageNum = Integer.parseInt(strPage);
	}
	
	if(paramPerPageNum != null && !paramPerPageNum.equals("")){
		perPageNum = Integer.parseInt(paramPerPageNum);
	}
	
	Criteria cri = new Criteria(pageNum, perPageNum);
	
	try{
		String sql = "SELECT * FROM test_member ORDER BY num DESC";
		sql = "SELECT * FROM test_member ORDER BY num DESC limit ?, ?";
										// 검색할 이름의 포함되는 한 글자로만 검색하기
		sql = "SELECT * FROM test_member WHERE name LIKE CONCAT('%',?,'%') ORDER BY num DESC limit ?, ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,search);
		pstmt.setInt(2, cri.getStartRow());
		pstmt.setInt(3, cri.getPerPageNum());
		rs = pstmt.executeQuery();
		while(rs.next()){
			MemberVO m = new MemberVO(
				rs.getInt(1),				// num
				rs.getString(2),			// id
				rs.getString(3),			// pass
				rs.getString(4),			// name
				rs.getString(5),			// addr
				rs.getString(6),			// phone
				rs.getString(7),			// gender
				rs.getInt(8)				// age
			);
			memberList.add(m);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally{
		JDBCUtil.close(rs,pstmt,conn);
	}
	
	// 페이징 블럭 출력을 위한 클래스 선언
	PageMaker pm = null;
	
	// paging block 처리
	try{
		conn = JDBCUtil.getConnection();
		String sql = "SELECT count(*) FROM test_member WHERE name LIKE CONCAT('%',?,'%')";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, search);
		rs = pstmt.executeQuery();
		int totalCount = 0;
		if(rs.next()){
			totalCount = rs.getInt(1);
		}
		pm = new PageMaker(cri, totalCount, 10);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(rs,pstmt,conn);
	}
	
	
%>

<section>
<table border=1 class="list">
	<tr>
		<th colspan="7">
			<h1>회원목록</h1>
			<%=pm%>
		</th>
	</tr>
	<tr>
		<td colspan="7">
			<form>
				<%-- <input type="hidden" name="page" value="<%=cri.getPage()%>"/> --%>
				<select name="perPageNum" onchange="form.submit();">
					<%for(int i = 5; i <= 50; i+=5){ %>
					<option value="<%=i%>" <%=cri.getPerPageNum() == i ? "selected" : "" %>><%=i%> 개씩 보기</option>
					<%} %>
				</select>
					<!-- 검색기능 -->			
				<input type="text" value="<%=search%>" name="search" placeholder="검색할 사용자 이름 작성" style="border:1px solid gray;"/>
				<input type="submit" value="검색"/>
			</form>
		</td>
	</tr>
	<!-- 페이징 블럭 출력 -->
	<%if(!memberList.isEmpty()){ %>
	<tr>
		<th colspan="7">
		<%if(pm.isFirst()){ %>
			<a href="<%=pm.makeQuery(1) %>&search=<%=search%>">[처음]</a>
		<%} %>
		<%if(pm.isPrev()){ %>
						<!-- 	  [1][][][][5] -->
						<!-- [이전][6][][][][10] -->
			<a href="<%=pm.makeQuery(pm.getStartPage()-1) %>&search=<%=search%>">[이전]</a>
		<%} %>
		<% for(int i = pm.getStartPage(); i <=pm.getEndPage(); i++){ %>
		<%-- <a href="?page=<%=i%>&perPageNum=<%=pm.getCri().getPerPageNum()%>">[<%=i %>]</a> --%>
			<a href="<%=pm.makeQuery(i)%>&search=<%=search%>">[<%=i %>]</a>
		<%} %>
		<%if(pm.isNext()){ %>
						<!--  [1][][][][5][다음] -->
						<!-- [이전][6][][][][10] -->
			<a href="<%=pm.makeQuery(pm.getEndPage()+1) %>&search=<%=search%>">[다음]</a>
		<%} %>
		<%if(pm.isLast()){ %>
			<a href="<%=pm.makeQuery(pm.getMaxPage()) %>&search=<%=search%>">[마지막]</a>
		<%} %>
		</th>
	</tr>
	<%} %>
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>성별</th>
		<th>나이</th>
	</tr>
	<%
		if(!memberList.isEmpty()){
			for(MemberVO m : memberList){
	%>
	<!-- 회원 목록 출력 -->
			<tr title="<%=m.getName()%>님의 회원 정보" onclick="moveInfo('<%=m.getNum()%>');">
				<td><%=m.getNum()%></td>
				<td><%=m.getId()%></td>
				<td><%=m.getName()%></td>
				<td><%=m.getAddr()%></td>
				<td><%=m.getPhone()%></td>
				<td><%=m.getGender()%></td>
				<td><%=m.getAge()%></td>
			</tr>
	<%
			} // end for
		}else{
	%>
	<!-- 등록된 회원이 없을 시 출력 -->
	<tr><th colspan="7">등록된 회원이 없습니다.</th></tr>
	<%}%>
</table>
</section>
<script>
	// 전달 받은 회원 번호의 회원정보를 확인하는 memberInfo.jsp 이동 함수
	function moveInfo(num){
		location.href='memberInfo.jsp?num='+num;
	}
</script>
<%@ include file="common/footer.jsp" %>











