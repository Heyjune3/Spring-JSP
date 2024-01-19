<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 브라우저에서 요청을 전달할때마다 해당 사이트에 등록된 쿠키정보를 전달
	// 쿠키는 request 객체에 저장되어서 전달된다.
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c : cookies){
			// cookie를 구분하는 key값 == name
					String name = c.getName();
					String value = c.getValue();
					out.println(name+":"+value+"<br/>");
		}
	}else{
		out.println("등록된 쿠키 정보가 없습니다.");
	}
%>
<hr/>
<%
	// 현재 요청이 들어온 사용자의 Session 객체의 구분값 == id
	String sessionId = session.getId();
	out.println("Session ID : " + sessionId + "<br/>");
	
	// 현재 요청에서 새로 생성된 session 객체인지 여부 확인
	// 현재 요청에서 새로 생성된 session 객체 이면 true 아니면 false
	boolean isNew = session.isNew();
	out.println("Session isNew : " + isNew + "<br/>");
%>

<h3><%="session uid : " + session.getAttribute("uid") %></h3>

<hr/>















