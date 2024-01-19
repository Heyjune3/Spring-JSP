<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 요청 처리 확인</title>
</head>
<body>
	<h3>로그인 요청 처리</h3>
	<%
	// 자바 사용 가능
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		out.println("uid : " + uid);
		out.println("upw : " + upw);
	%>
	<!-- 
	CATALINA_BASE
	C:\Users\admin\Desktop\yes_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0
	
	== jsp 파일이 class와 java파일을 만든 위치
	 -->
</body>
</html>