<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,vo.MemberVO"%>
<!-- loginCheck.jsp -->
<%
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	
	List<MemberVO> memberList = (List<MemberVO>)application.getAttribute("memberList");
	if(memberList == null){
		request.setAttribute("message", "등록된 회원정보가 없습니다. 회원가입부터...");
		request.getRequestDispatcher("join.jsp").forward(request,response);
		return;
	}
	
	MemberVO loginMember = null;
	if(uid != null && upw != null){
		for(MemberVO m : memberList){
			if(uid.equals(m.getUid()) && upw.equals(m.getUpw())){
				loginMember = m;
				break;
			}
		}
	} // login 요청에 전달된 아이디와 패스워드가 일치하는 사용자 검색
	if(loginMember == null){
		// 일치하는 사용자가 존재하지 않음
		request.setAttribute("message", "로그인 정보가 일치하지 않습니다.");
		request.getRequestDispatcher("login.jsp").forward(request,response);
	}else{
		// 로그인 성공 - 일치하는 사용자 존재
		session.setAttribute("loginMember", loginMember);
		// 로그인 정보 저장 or 로그인 상태 유지 check 여부 확인
		String rememberMe = request.getParameter("rememberMe");
		System.out.println("rememberMe : " +rememberMe);
		if(rememberMe != null){
			// 로그인 정보 저장 체크박스 체크
			Cookie cookie = new Cookie("uid",loginMember.getUid());
			cookie.setMaxAge(60*60*24*15); // 초단위
			cookie.setPath("/"); // 모든 경로 (어떤 경로로 들어오든 상관 없이)
			// 사용자 브라우저에 cookie 정보 등록
			response.addCookie(cookie);
			
		}
		
		// 로그인 완료 시 메인으로 페이지 이동
		response.sendRedirect(request.getContextPath());
		
	}


%>




