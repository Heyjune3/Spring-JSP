<%@page import="util.JDBCUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- 회원가입 요청 처리 - joinCheck.jsp -->
<%
	String id = request.getParameter("id");
	// 처리 결과를 문자열로 저장
	String msg = "";
	// 처리결과에 따라 이동할 페이지를 저장
	String nextPage = "";
	
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		// 중복 아이디 체크
		String sql = "SELECT id FROM test_member WHERE id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			// 사용자가 작성한 id와 일치하는 사용자 정보가 table에 존재 - 중복아이디
			msg = "이미 존재하는 아이디입니다.";
			nextPage = "join.jsp";
		}else{
			// 사용가능한 id
			// 검색에 사용된 pstmt 제거
			JDBCUtil.close(pstmt);
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String addr = request.getParameter("addr");
			String phone = request.getParameter("phone");
			String gender = request.getParameter("gender");
			String strAge = request.getParameter("age");
			int age = Integer.parseInt(strAge);
			// num(int) / id / pass / name / addr / phone / gender / age(int)		
			sql = "INSERT INTO test_member VALUES(null,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			pstmt.setString(4, addr);
			pstmt.setString(5, phone);
			pstmt.setString(6, gender);
			pstmt.setInt(7,age);
			
			if(pstmt.executeUpdate() == 1){
				msg = "회원가입 완료";
				nextPage = "login.jsp";
			}
		}
	}catch(Exception e){
		msg = "회원가입 실패";
		nextPage = "join.jsp";
	}finally{
		JDBCUtil.close(rs,pstmt,conn);
	}
%>
<script>
	alert('<%=msg%>');
	location.replace('<%=nextPage%>');
</script>













