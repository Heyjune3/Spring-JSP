<%@page import="java.util.Base64"%>
<%@page import="vo.MemberVO, java.sql.*, util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error/error_400.jsp"%>
<%-- 페이징 처리 연습하기 위해 회원 추가 
<%!
	int i = 1850;
%>
<%

	String sqlTemp = "INSERT INTO test_member VALUES "
			+ "(null,?,?,'이기근','부산광역시','01011111111','남성',30)";
	for(int j = 0; j < 600; j++){
		Connection conn = JDBCUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sqlTemp);
		pstmt.setString(1,"id"+i);
		pstmt.setString(2,"pw"+i);
		pstmt.executeUpdate();
		JDBCUtil.close(pstmt, conn);
		i++;
	}

%>
 --%>
<%
	// session에 등록된 인증된 사용자 정보
	MemberVO loginMember = (MemberVO)session.getAttribute("login");
	Cookie[] cookies = request.getCookies();
	if(loginMember == null && cookies != null){
		// 로그인이 되어 있지 않은 사용자 && 쿠키 정보 존재
		for(Cookie c : cookies){
			if(c.getName().equals("rememberMe")){
				// 자동로그인 용으로 등록된 cookie
				String id = c.getValue(); // 자동로그인 용으로 등록된 사용자 id
				System.out.println("header cookie id : " + id);
				// aWQwMDE=
				byte[] decodedID = Base64.getDecoder().decode(id.getBytes());
				// 디코딩된 바이트 배열로 문자열 생성
				id = new String(decodedID);
				System.out.println("header decoded id : " + id);
				// 사용자 id로 회원 정보 검색
				Connection conn = JDBCUtil.getConnection();
				String sql = "SELECT * FROM test_member WHERE id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()){
					loginMember = new MemberVO(
						rs.getInt("num"),
						rs.getString("id"),
						rs.getString("pass"),
						rs.getString("name"),
						rs.getString("addr"),
						rs.getString("phone"),
						rs.getString("gender"),
						rs.getInt("age")
					);
					session.setAttribute("login", loginMember);
				} // end rs.next()
				JDBCUtil.close(rs,pstmt,conn);
				break; // for문 탈출
			} //end  check cookie
		} // end cookies for
	} // end if

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<!-- 절대 경로에서 찾아 들어가기 -->
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/header.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/footer.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<div>
			<ul>
				<li><a href="<%=path %>/index.jsp">home</a></li>
				<li><a href="<%=path %>/board/notice/notice_list.jsp">공지사항</a></li>
				<li><a href="#">질문과답변</a></li>
			</ul>
		</div>
		<div>
			<ul>
				<% if(loginMember == null){ %>
				<!-- 비 로그인시용자 -->
				<li><a href="<%=path %>/login.jsp">로그인</a></li>
				<li><a href="<%=path %>/join.jsp">회원가입</a></li>
				<%}else{ %>
				<!-- 로그인 된 사용자 -->
				<li>
					<a href="<%=path %>/info.jsp"> <!-- 회원이름 -->
					<%=loginMember.getName()%>	
					</a>님 방가방가
				</li>
				<li><a href="<%=path %>/logout.jsp">로그아웃</a></li>
				<!-- 관리자 로그인일 경우 -->
					<% if(loginMember.getId().equals("admin")){ %>
				<li><a href="<%=path %>/memberList.jsp">회원관리</a></li>
					<%}%>
				<%}%>
			</ul>
		</div>
	</header>
	
	
	
	
	
	