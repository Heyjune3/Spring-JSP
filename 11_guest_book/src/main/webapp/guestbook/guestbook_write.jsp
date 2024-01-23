<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.JDBCUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 등록 요청 처리</title>
</head>
<body>
	<h1>방명록 등록 페이지</h1>
	<%
		String guestName = request.getParameter("guestName");
		String password = request.getParameter("password");
		String message = request.getParameter("message");
		
		// 처리된 결과 메세지를 저장할 변수
		String resultMsg="";
		Connection conn = JDBCUtil.getConnection();
		System.out.println(conn);
		
		PreparedStatement pstmt = null;
		
		try{
						// 인자 변수								  1  2  3
			String sql = "INSERT INTO test_guestbook VALUES(null, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, guestName);
			pstmt.setString(2, password);
			pstmt.setString(3, message);
			
			int result = pstmt.executeUpdate();
			resultMsg = (result > 0) ? "방명록 등록 성공" : "방명록 등록 실패";
		}catch(Exception e){
			resultMsg = "방명록 등록 실패" + e.toString();
		}finally{
			JDBCUtil.close(pstmt,conn);
		}
		
		String path = request.getContextPath();
		
	%>
	<!-- 방명록 작성 후 처리결과 출력 -->
	<h2><%=resultMsg %></h2>
	<a href="<%=path %>/guestbook/guestbook_list.jsp">[목록보기]</a>
</body>
</html>









