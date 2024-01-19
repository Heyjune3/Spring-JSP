<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,vo.MemberVO"%>
<!-- 
    pageContext	- jsp page
    request		- 요청
    session		- browser
    application - Server
-->

<%
	// application 에 등록된 회원 목록 정보를 저장할 리스트
	// memberList라는 key값으로 관리
	List<MemberVO> memberList = (List<MemberVO>)application.getAttribute("memberList");
	if(memberList == null){
		memberList = new ArrayList<>();
		application.setAttribute("memberList", memberList);
	}
	
	// join.jsp에서 전달된 회원가입에 필요한 파라미터 정보
	String uid = request.getParameter("uid");
	String upw= request.getParameter("upw");
	String uname = request.getParameter("uname");
	
	// 회원목록에 등록할 신규 회원 정보
	MemberVO joinMember = new MemberVO(uid,upw,uname);
	
	// 회원가입은 POST 로만 처리
	String method = request.getMethod();
	
	String message = "정상적인 접근이 아닙니다";
	String nextPage = "join.jsp";
		// POST 요청 방식 일 때 회원 가입 처리
	if(!method.equalsIgnoreCase("GET")){
		// 이미 사용중인 아이디 인지 여부를 저장할 변수
		boolean isCheck = false;
		for(MemberVO member : memberList){
			if(member.getUid().equals(uid)){
				// 이미 사용중인 아이디
				isCheck =true;
				break;
			}
		}// 일치하는 id 사용자 검색 종료
		
		if(isCheck){
			message = "이미 사용중인 아이디입니다.";
			nextPage ="join.jsp";
		}else{
		// application 저장된 회원 목록에 신규 추가
		memberList.add(joinMember);
		message = "회원가입 완료";
		nextPage ="login.jsp";
		}
	}
	// end get or post 요청 처리
	
	request.setAttribute("message", message);
	request.getRequestDispatcher(nextPage).forward(request,response);
			
%>























