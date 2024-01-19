<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "common/header.jsp" %>
<section>
	<h3>SECOND JSP</h3>
	<article>
		<textarea><%=s%></textarea>
	</article>
</section>
<!-- result cannot be resolved to a variable -->
<!-- result 변수는 index에 있는 변수여서 index.jsp를 추가 하지 않으면 적용되지 못함 -->
<%@ include file="common/footer.jsp" %>