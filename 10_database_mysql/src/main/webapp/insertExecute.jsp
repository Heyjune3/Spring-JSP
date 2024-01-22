<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록요청 처리</title>
</head>
<body>
	<h1>JDBC CONNECTION &amp; INSERT TEST</h1>
	<%
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		
		// 인증된 계정 정보로 지정된 위치에 있는 데이터베이스에
		// 연결된 정보를 저장하는 객체
		Connection conn = null;
		
		// 연결된 데이터베이스에 질의 작업을 수행하고 결과를 반환하는 객체
		// 	 정적쿼리 	 	   동적쿼리           procedure
		// Statement, PreparedStatement, CallStatement
		
		PreparedStatement pstmt = null;
		
		try{
			// connector Driver class load
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/develop",
					"developer",
					"12345"
					);
					out.println("<h3>DB 연결 성공</h3>");
					//												   1,2
					String sql = "INSERT INTO member(name,addr) VALUES(?,?);";
					pstmt = conn.prepareStatement(sql);
					// 순서는 상관없음
					pstmt.setString(2,addr);
					pstmt.setString(1,name);
					// table에 저장된 정보를 변경하고 난 후
					// 실행된 행의 개수를 int 타입으로 반환
					int result = pstmt.executeUpdate();
					if(result==1){
						out.println("회원정보 등록 완료");
					}else{
						out.println("회원정보 등록 실패");
					}
					out.println("-" + result);
		}catch(Exception e){
			out.println("<h3>DB 연결 실패</h3>");
			out.println("<h3>"+e.toString()+"</h3>");
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
	<a href="index.jsp">메인으로</a>
</body>
</html>












