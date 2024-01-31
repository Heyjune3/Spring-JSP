<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Standard Tag Library</title>
</head>
<body>
	<h1>JSP Standard Tag Library</h1>
	<!-- set : 특정 영역객체에 속성 값을 태그 형식으로 추가 -->
	<!-- scope : page < request < session < application -->
	<c:set var="varPage" value="page 영역" scope="page"/>
	<c:set var="numPage" value="10" scope="page" />
	<h3>EL : ${varPage} </h3>
	<h3>EL : ${numPage} </h3> 
	<%-- <h3>EL : ${varPage + 11}</h3> NumberFormatException 발생--%>
	<!-- 산술 연산을 처리하기 위해서 영역 객체에 저장된 data를 숫자 타입으로 변경 --> 
	<h3>EL : ${numPage + 11}</h3>
	
	<c:set var="request1" value="request 영역" scope="request" />
	<c:set var="session1" value="session 영역" scope="session" />
	<c:set var="application1" value="application 영역" scope="application" />
 	<!-- EL은 영역 객체에 있는 것만 읽어 올 수 있음 -->
	<h4>request1 : ${request1}</h4>
	
	<c:remove var="request1" scope="request"/>
	
	<h4>request1 : ${request1}</h4>
	<!-- jsp 페이지에 value로 지정된 data 출력 -->	
	<h4><c:out value="${session1}"/></h4>
	<c:set var="test1" value="<script>alert('메롱메롱!');</script>"/>
	
	<%-- ${test1}<br/> alert 작동됨 --%>
	<!-- escapeXml을 이용하면 특수문자를 다 치환함 ex) > == &lt; -->
	<!-- escapeXml='true' 기본값이 true -->
	<c:out value='${test1}' escapeXml='true'/><br/>
	<c:out value='${test2}' default="test2의 값이 존재하지 않습니다."/><br/>
	<c:out value="${test2}" escapeXml='false'>
		<h3>test2는 존재하지 않습니다.</h3>
	</c:out>
	
	<hr/>
	<br/>
	<br/>
	
	<a href="/index.jsp">index.jsp</a> <%-- <%= request.getContextPath() %>가 필요 --%>
	<c:url var="pageLink" value="/index.jsp"/>
	<h3>pageLink : ${pageLink}</h3>
	<a href="${pageLink}">메인으로</a><br/>
	<a href="<c:url value='/index.jsp'/>">베인으로</a><br/>
	<br/>
	<br/>
	<br/>
		<div>
			<c:import url="index.jsp"/>
		</div>
	<br/>
		<div>
			<!-- 하나의 서블릿으로 합쳐야되는데 외부는 안됨 -->
			<%-- <%@ include file="https://www.nate.com" %> --%>
			<!-- c:import는 외부페이지 가능 = css는 포함되지 않기 때문에 문자열로 들고와짐 -->
			<textarea>
			<c:import url="https://www.nate.com"/>
			</textarea>
		</div>
	<br/>
	<br/>
</body>
</html>













