<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestResult.jsp</title>
</head>
<body>
	<%
		/* tomcat-10 이전 버전에서는 개발자가 직접 인코딩 지정 */
		request.setCharacterEncoding("UTF-8");
		
		// request로 전달된 data를 처리할 문자셋 정보 확인
		String encoding = request.getCharacterEncoding();
		out.println("encoding : " + encoding + "<br/>");
		
		// 요청 파라미터 값 확인
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		
		if(gender != null){
		gender = gender.equals("male") ? "남성" : "여성";
		}
		
		out.println("name : " + name + "<br/>");
		out.println("gender : " + gender + "<br/>");
		out.println("hobbys : " + Arrays.toString(hobbys) + "<br/>");
		
		// 요청한 client 원격지 아이피 주소
		String ip = request.getRemoteAddr();
		out.println("ip : " + ip + "<br/>");
		
		// 요청이 전달된 사용자의 요청 전송 방식
		String method = request.getMethod();
		out.println("전송방식 : " + method + "<br/>");
		
		// 요청 경로 - 현재 서버의 프로젝트별 전체 요청 경로
		// /05_implict_object_scope/request_test/requestResult.jsp
		String requestURI = request.getRequestURI();
		out.println("requestURI : " + requestURI + "<br/>");
		
		// 주소줄의 URL 요청 정보
		// http://localhost:8080/05_implict_object_scope/request_test/requestResult.jsp
		StringBuffer requestURL = request.getRequestURL();
		out.println("requestURL : " + requestURL + "<br/>");
		
		// contextPath
		// WAS(Web Application Server) 에서
		// 웹 Application(프로젝트)를 구분하기 위한 경로(Path)
		// /05_implict_object_scope
		String contextPath = request.getContextPath();
		out.println("contextPath : " +contextPath + "<br/>");
		
		// queryString - GET 방식으로 전달된 parameters
		// %EC%9D%B4 | %EC%A4%80 | %ED%98%B8 = 이 | 준 | 호 = 1byte 씩 3byte 당 1글자
		String queryString = request.getQueryString();
		out.println("queryString : " +queryString+ "<br/>");
		
		// 요청 content type
		// GET 방식 = null로 표시
		// POST 방식 = application/x-www-form-urlencoded
		String contentType = request.getContentType();
		out.println("contentType : " +contentType+ "<br/>");
	%>
	<h1>Parameter Names</h1>
	<%
		// 열거형
		// 동일한 데이터 타입을 나열하여 저장하는 class
		// 저장된 각 데이터를 요소(element) 라고 한다.
		Enumeration<String> names = request.getParameterNames();
	
		// name에서 읽을 요소가 존재하면 true, 존재하지 않으면 false
		while(names.hasMoreElements()){
			//name 열거형에서 저장된 요소를 읽고 다음 요소로 이동
			String keyName = names.nextElement();
			if(keyName.equals("hobby")){
				String[] hobbyValues = request.getParameterValues(keyName);
				out.println(keyName+" : " + Arrays.toString(hobbyValues) + "<br/>");
			}else{
				String value = request.getParameter(keyName);
				out.println(keyName+" : " + value + "<br/>");
			}
		}
	%>
	
	<h1>모든 파라미터 묶음</h1>
	<%
		/* 모든 String값을 들고 옴 String[] */
		Map<String, String[]> map = request.getParameterMap();
		for(String key : map.keySet()){
			out.println(key + " : ");
			out.println(Arrays.toString(map.get(key)));
			out.println("<br/>");
		}
	%>
</body>
</html>


















