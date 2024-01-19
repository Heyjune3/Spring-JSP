<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- buffer='8kb' autoFlush="true" -->
    <!-- 1024 -->
    <%-- <%@ page buffer="1kb" autoFlush="false"%> --%> <!-- 1kb 이상 buffer가 될 시 에러 -->
    <%@ page buffer="1kb" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 전체 버퍼 크기 -->
	Buffer size = <%= out.getBufferSize() %> <br/> 
	<!-- 버퍼에 남은 크기, 잔존하는 양 -->
	Remaining size = <%= out.getRemaining() %> <br/>
	
	<%
		for(int i = 0; i < 1000; i++){
			out.println("   1234   ");
			int bytes = out.getRemaining();
			out.println("("+bytes+")");
		}
	%>
</body>
</html>