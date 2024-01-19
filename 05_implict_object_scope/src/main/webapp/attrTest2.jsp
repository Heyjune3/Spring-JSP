<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrTest2</title>
</head>
<body>
	<%
		String email = request.getParameter("email");
		// 새로운 요청 이므로 id는 존재하지 않음
		String id = request.getParameter("id");
		
		if(email != null){
			request.setAttribute("requestEmail", email);
			session.setAttribute("sessionEmail", email);
		}
	%>
	<h3>request param email<%=email%></h3>
	<h3>request param id<%=id%></h3>
	
	<h3>application id : <%=application.getAttribute("appId")%></h3>
	<h3>pageContext id : <%=pageContext.getAttribute("pageId")%></h3>
	<h3>request email : <%=request.getAttribute("requestEmail")%></h3>
	<h3>session email : <%=session.getAttribute("sessionEmail")%></h3>
	<hr/>
	<a href="attrTest3.jsp">확인하기</a>
</body>
</html>