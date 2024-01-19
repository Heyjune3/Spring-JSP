<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- joinCheck.jsp -->
<%request.setCharacterEncoding("utf-8");%>

<%
	// application에 회원 목록 저장 리스트 생성
	List<MemberVO> memberList = (List<MemberVO>)application.getAttribute("memberList");
	if(memberList == null){
		memberList = new ArrayList<>();
		application.setAttribute("memberList", memberList);
	}
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	int age = Integer.parseInt(request.getParameter("age"));
	
	// VO에 등록할 신규 회원 정보
	MemberVO joinMember = new MemberVO(id, pw, name, addr, phone, gender, age);
	
	String method = request.getMethod();
	String message = "정상적인 접근 방식이 아닙니다.";
	String nextPage = "join.jsp";
	// 회원가입 POST만 가능
	if(!method.equalsIgnoreCase("GET")){
		boolean isCheck = false;
		for(MemberVO m : memberList){
			if(m.getId().equals(id)){
			isCheck = true;
			break;
			}
		}
		// 중복처리 및 회원가입 완료
		if(isCheck){
			message = "이미 사용중인 아이디입니다.";
			nextPage = "join.jsp";
		}else{
		memberList.add(joinMember);
		message = "회원 가입 완료!";
		nextPage = "login.jsp";
		}
	}// GET or POST 요청 처리 완료
	
	request.setAttribute("message", message);
	request.getRequestDispatcher(nextPage).forward(request, response);
	
%>







