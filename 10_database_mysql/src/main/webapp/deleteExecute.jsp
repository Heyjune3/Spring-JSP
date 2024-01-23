<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 삭제 요청 처리</title>
</head>
<body>
	<h1>회원정보 삭제</h1>
	<%
		String method = request.getMethod().toLowerCase();
		String message = "";
		if(method.equals("GET")){
			message = "올바른 요청이 아닙니다.";
		}else{
			// POST 방식의 정상적인 요청
			String num = request.getParameter("num");
			int paramNum = 0;
			if(num != null){
				paramNum = Integer.parseInt(num);
			}
			
			PreparedStatement pstmt = conn.prepareStatement(
				"DELETE FROM member WHERE num =?"
			);
			pstmt.setInt(1, paramNum);
			// 쿼리 실행 후 table에서 삭제된 행의 개수 반환
			int result = pstmt.executeUpdate();
			if(result == 1){
				message = "회원 정보 삭제 완료";
			}else{
				message = "회원 정보 삭제 실패";
			}
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
	%>
	
	<h3><%=message %></h3>
	<h4><a href="memberList.jsp">회원목록</a></h4>
</body>
</html>















