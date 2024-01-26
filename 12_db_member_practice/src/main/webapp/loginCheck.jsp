<%@page import="util.JDBCUtil"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- 로그인 요청 처리 페이지 - loginCheck.jsp -->
<%@page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 처리완료 메세지
	String msg = "";
	// 이동할 페이지
	String nextPage = "";
	
	String sql = "SELECT * FROM test_member WHERE id = ? AND pass = ?";
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		
		rs = pstmt.executeQuery();
		if(rs.next()){
			msg = "로그인 성공";
			nextPage = "index.jsp";
			// 로그인 성공 - 아이디와 패스워드가 일치하는 사용자 검색 완료
			// num(int) / id / pass / name / addr / phone / gender / age(int)
			// 인증된 정보를 session에 저장할 회원정보 객체
			MemberVO loginMember = new MemberVO(
				rs.getInt(1),				// num
				rs.getString(2),			// id
				rs.getString(3),			// pass
				rs.getString(4),			// name
				rs.getString(5),			// addr
				rs.getString(6),			// phone
				rs.getString(7),			// gender
				rs.getInt(8)				// age
			);
			session.setAttribute("login", loginMember);
			
			// 로그인 상태 유지 요청
			String login = request.getParameter("login");
			if(login != null){
				// 쿠키정보 암호화
				// id 문자열을 byte[]로 변경
				byte[] bytes = id.getBytes();
				byte[] encodedID = java.util.Base64.getEncoder().encode(bytes);
				System.out.println("id : " + id);
				id = new String(encodedID);
				System.out.println("encoded id : " + id);
				// 로그인 상태유지 체크박스 체크
				Cookie cookie = new Cookie("rememberMe", id);
				// path는 따로 지정하지 않으면 contextPath
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
			}
		}else{
			// 로그인 실패 - 아이디와 패스워드가 일치하지 않음
			msg = "로그인 실패";
			nextPage = "login.jsp";
		}
	}catch(Exception e){
		msg = "로그인 실패-"+e.toString();
		nextPage = "login.jsp";
	}finally{
		JDBCUtil.close(rs,pstmt,conn);
	}
%>
<script>
	alert('<%=msg%>');
	location.replace('<%=nextPage%>');
</script>




















