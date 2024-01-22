<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, vo.MemberVO"%>
<!-- loginCheck.jsp -->
<%
	List<MemberVO> memberList 
			= (List<MemberVO>)application.getAttribute("memberList");
	// 등록된 회원 정보가 존재 하는지 확인
	if(memberList == null || memberList.isEmpty()){
%>
	<!-- 등록된 회원이 존재하지 않음 -->
	<script>
		alert("등록된 회원정보가 없습니다. 회원가입부터 진행해주세요.");
		location.href='join.jsp';
	</script>
<%
		return; // 등록된 회원정보가 없을시 출력 후 로그인 요청 처리 종료
	}
	
	// 등록된 회원이 존재하므로 전달받은 파라미터 값을 이용하여 
	// 인증된 사용자 정보 로그인 요청 처리
	// 회원목록을 순회 하면서 파라미터로 전달된 id와 pass 정보가 일치하는 사용자 정보 검색
	
	// 로그인 요청 파라미터
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	for(MemberVO m : memberList){
		if(m.getId().equals(id) && m.getPass().equals(pass)){
			// 요청이 들어온 사용자 별로 생성이되는 session 객체를 이용해서
			// 브라우저가 종료되기 전까지 로그인 요청 처리가 정상적으로 수행된
			// 사용자 정보를 저장하고 활용
			session.setAttribute("loginMember",m);
			
			// 자동로그인 요청 처리 추가
			// checked 상태면 datda 존재, checked가 아니면 null
			String rememberMe = request.getParameter("rememberMe");
			if(rememberMe != null){
				Cookie cookie = new Cookie("rememberMe",m.getId());
				// 사용자 브라우저에 쿠키 정보를 15일간 저장
				cookie.setMaxAge(60*60*24*15);
				// 응답객체에 브라우저가 저장할 쿠키 정보 저장
				response.addCookie(cookie);
			}// 자동 로그인용 쿠키 등록 완료
%>
	<script>
		alert('<%= m.getName()+"님 로그인 성공!"%>');
		location.href='index.jsp';
	</script>
<%			
			return; // 일치하는 사용자를 찾았다면 session에 정보 추가하고 응답 종료
		} // end if - id와 pass가 일치하는 사용자 조건 비교
	} // end for - 회원 목록 순회
%>
<script>
	alert('로그인 실패');
	// 이전 페이지로 이동
	history.back();
</script>









