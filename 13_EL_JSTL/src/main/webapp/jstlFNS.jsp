<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="test" value="Hello, Java Server Pages!"/>
	EL test : ${test} <br/>
	EL upper case : ${fn:toUpperCase(test)} <br/>
	EL lower case : ${fn:toLowerCase(test)} <br/>
	<!-- Content-Type : MINE Type 한 종류 -->
	<c:set var="file" value="image/png" />
	<c:if test="${fn:startsWith(file,'image')}">
		이미지 파일입니다.<br/>
	</c:if>
	<c:set var="text" value="read.txt"/>
	<c:if test="${!fn:endsWith(text,'.txt')}">
		텍스트 파일이 아닙니다.<br/>
	</c:if>
	<%-- <c:set var="test" value="Hello, Java Server Pages!"/> --%>
	<hr/>
	contains : ${fn:contains(test,'java')} <br/>
	containsIgnoreCase : ${fn:containsIgnoreCase(test,'java')}<br/>
	<hr/>
	indexOf : ${fn:indexOf(test,'Java')} <br/>
	substringBefore : ${fn:substringBefore(test,"Java")}<br/>
	substringAfter : ${fn:substringAfter(test,"Java")}<br/>
	test length : ${fn:length(test)}<br/>
	<!-- substring(잘라낼 문자열, 시작 인덱스, 마지막 인덱스(-1)) -->
	substring : ${fn:substring(test,fn:indexOf(test,"Java"),fn:length(test)-1)}<br/>
	
	<%-- <c:set var="test" value="Hello, Java Server Pages!"/> 공백으로 구분자 --%>
	<c:set var="strs" value="${fn:split(test,' ')}"/>
	${strs}<br/>
	<c:forEach var="str" items="${strs}">
		${str}<br/>
	</c:forEach>
	${fn:join(strs,'|')}<br/>
	
	<hr/>
	<div style="border:1px solid red">안녕하세요</div>
	<c:set var="tag" value="<div style='border:1px solid red'>안녕하세요</div>" />
	${tag} <hr/><br/>
	escapeXml : ${fn:escapeXml(tag)}<br/>
	<hr/>
	${fn:replace(tag, '<','&lt;')}<br/>
	&lt;div style="border:1px solid red">안녕하세요&lt;/div>
</body>
</html>











