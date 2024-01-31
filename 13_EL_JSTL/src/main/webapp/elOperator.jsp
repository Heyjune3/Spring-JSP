<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elOperator.jsp</title>
</head>
<body>
	<%-- ${연산} --%>
	<h2>EL 내부에서의 연산</h2>
	<h3>\${5+7} : ${5+7}</h3>
	<h3>\${5 == 7} : ${5 == 7}</h3>
	<h3>\${5 &lt; 7} : ${5 < 7}</h3>
	<h3>\${5 + 7 > 8 ? '크다' : '작다'} : ${5 + 7 > 8 ? '크다' : '작다'}</h3>
	
	<h2>비교 연산</h2>
	<%
	String s = "a";
	String s1 = new String("hi");
	String s2 = new String("test");
	String s3 = new String("test");
	request.setAttribute("s", s);
	request.setAttribute("s1", s1);
	request.setAttribute("s2", s2);
	request.setAttribute("s3", s3);
	%>
	<!-- EL 내부에서의 비교 연산은 equals method를 이용하여 비교 -->
	<h3>\${s2 == s3} : ${s2 == s3}</h3><!-- true -->
	<h3>\${s1 == s3} : ${s1 == s3}</h3><!-- false -->
	<h3>\${s1 != s3} : ${s1 != s3}</h3><!-- true -->
	<h3>\${s2 eq s3} : ${s2 eq s3}</h3><!-- true	eq = equals -->
	<h3>\${s2 ne s3} : ${s2 ne s3}</h3><!-- false	ne = not equals -->
	<hr/>
	<h3>\${s != s1 && s2 == s3} : ${s != s1 && s2 == s3}</h3>
	<h3>\${s != s1 and s2 == s3} : ${s != s1 and s2 == s3}</h3>	
	<h3>\${s != s1 || s2 == s3} : ${s != s1 || s2 == s3}</h3>
	<h3>\${s != s1 or s2 == s3} : ${s != s1 or s2 == s3}</h3>
	
	<%
		ArrayList<String> list = null;
		request.setAttribute("list", list);
	%>
	
	<h3>\${empty list} : ${empty list}</h3>
	
	<%
		list = new ArrayList<>();
		out.println(list.isEmpty());
		request.setAttribute("list", list);
	%>
	<h2>리스트 생성 등록</h2>
	<h3>\${empty list} : ${empty list}</h3><!-- 생성만 되어 있지 요소는 x -->
	
	<%
		list.add("네 보고 있습니다.");
	%>
	<h3>\${empty list} : ${empty list}</h3><!-- 요소가 add 됐기 때문에 false -->
	<!-- list 객체가 생성되어 있고 내부에 요소가 비어 있지 않으면 -->
	<h3>\${!empty list} : ${!empty list}</h3>
	<h3>\${not empty list} : ${not empty list}</h3>
	<h3>\${list} : ${list}</h3>
</body>
</html>










