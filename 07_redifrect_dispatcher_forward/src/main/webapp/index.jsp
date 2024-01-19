<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>index.jsp</h1>
	<!-- 
		jsp or servlet class에서
		자바 code를 통해 페이지를 전한하는 방법
	 	
	 	- Redirect = 고객센터 상담사에게 이러한 문제가 있다하니 다른 부서로 연결시켜줘서 다시 설명하고 해결받음
	 	
	 	1. response 응답 객체 이용
	 	요청에 따른 처리가 완료된 후에 응답을 받은 브라우저에게
	 	지정한 페이지로 새롭게 요청(redirection)하라고 send
	 	response.sendRedirect("이동할 페이지를 문자열로 전달");
	 	
	 	- forward = 고객센터 상담사에게 이러한 문제가 있다하니 상담사가 옆에 사람에 물어봐서 처리받음
	 	- 데이터가 재요청 들어오는 방식은 forward에 맞지 않음 = 원래 있던 데이터와 중복되어 오류가 날 수 있음
	 	2. request 객체를 이용해 포워드 하는 방식
	 	request -> RequestDispatcher -> forward
	 	요청을 받아 응답으로 출력하는 jsp페이지를 지정된 페이지로 변경하여 출력하는 방법
	 	request.getRequestDispatcher("출력할 페이지를 문자열로 전달").forward(request,response);
	 -->
	 
	<%
		pageContext.setAttribute("index", "temp1");
		request.setAttribute("index", "temp2");
	%>	 
	 
	<h3>pageContext : <%=pageContext.getAttribute("index") %></h3>
	<h3>request : <%=request.getAttribute("index") %></h3>
	
	<a href="result.jsp">result</a>
</body>
</html>













