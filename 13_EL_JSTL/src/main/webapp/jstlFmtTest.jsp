<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>날짜 형식 지정</h2>
	<h3>${param.selectedDate}</h3>
	<%
		Date now = new Date();
		request.setAttribute("now", now);
	%>
	<!-- 
	type:
	date(날짜) / time(시간) / both(둘다)
	
	Style:
	full / long / medium(default) / short
	-->
	
	<f:formatDate value="${now}" type="date" dateStyle="full"/><br/>
	<f:formatDate value="${now}" type="time" timeStyle="full"/><br/>
	<f:formatDate value="${now}" type="both" dateStyle="short" timeStyle="long"/><br/>
	
	<h3>pattern</h3>
	<f:formatDate value="${now}" pattern="yyyy-MM-dd E hh:mm:ss"/>
	<br/>
	<!-- 문자열로 이루어진 데이터 형식의 텍스트를 Date 타입으로 변경 -->
	<f:parseDate var="n" value="${param.selectedDate}" pattern="yyyy-MM-dd"/><br/>
	<f:formatDate value="${n}" pattern="yyyy년MM월dd일"/><br/>
	
</body>
</html>














