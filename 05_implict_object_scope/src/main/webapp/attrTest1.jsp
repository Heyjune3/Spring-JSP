<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrTest1.jsp</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		// 작성한 값이 존재 할 때
		if(id != null && !id.equals("")){
			pageContext.setAttribute("pageId", id);
			application.setAttribute("appId" , id);
		}
	%>
	<h3>pageContext id : <%=pageContext.getAttribute("pageId")%></h3>
	<h3>application id : <%=application.getAttribute("appId")%></h3>
	<hr/>
	<form action="attrTest2.jsp" method="POST">
		이메일 : <input type="email" name="email" required />
		<button>확인</button>
	</form>
	
</body>
</html>