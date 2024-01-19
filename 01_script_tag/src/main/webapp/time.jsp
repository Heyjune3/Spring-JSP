<!-- webapp/time.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- 선언부, 선언문  -->
<%! 
	private String s = "test";
	private int count = 0;
	
	public String getText(String str){
		s += str;
		count++;
		return s;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 태그</title>
</head>
<body>
<!-- 
새로고침 누를 때 마다 계속해서 count가 올라가는데
파일을 수정할 시 재컴파일 되어 count가 1부터 다시 시작
 -->
	<h1>TIME JSP</h1>
	<%
		out.println(getText("최기근 천재!"));
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd hh:mm:ss"
				);
		String date = sdf.format(new java.util.Date());
		out.println("<br/>");
		out.println(count);
	%>
	<br/>
	현재시간: <%= date %> <br/>
	<%= getText("최기근 천재!") %> <br/>
	<%= count %>
	
	
	
	
	
</body>
</html>











