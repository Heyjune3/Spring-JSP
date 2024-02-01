package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MemberService;
import service.MemberServiceImpl;
import util.FactoryUtil;

public class MemberController extends HttpServlet {
	
	MemberService ms = new MemberServiceImpl();
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestPath = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestPath.substring(contextPath.length()+1);
		System.out.println("mc - requestPath : " + requestPath);
		System.out.println("mc - contextPath : " + contextPath);
		// 해당 서블릿으로 전달된 요청
		System.out.println("mc - command : " + command);
		
		// cookie를 이용한 자동로그인 체크
		MemberService.loginCheck(request);
		
		String view = "";
		
		if(command.equals("login.mc")) {
			// 로그인 화면 요청
			view = "/member/login.jsp";
		}else if(command.equals("join.mc")) {
			view = "/member/join.jsp";
		}else if(command.equals("logOut.mc")) {
			// 로그아웃 요청 처리
			ms.logOut(request, response);
			view = "/common/main.jsp";
		}else if(command.equals("info.mc")){
			
			System.out.println("내 회원 정보 보기 페이지 요청");
			view = "/member/info.jsp";
			
		}else if(command.equals("withdraw.mc")){
			// 회원 탈퇴 요청 페이지 호출
			// 비밀번호를 다시 입력받아 일치할 경우 탈퇴 처리
			view = "/member/withdraw.jsp";
		}else if(command.equals("findPass.mc")){
			// 비밀번호 찾기 페이지 요청
			view = "/member/findPass.jsp";
		}else {
			System.out.println("*.mc GET 방식으로 처리할 수 없는 요청");
			response.sendError(405,"정상적인 요청이 아닙니다.");
		}
		
		if(!view.equals("")) {
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = FactoryUtil.getCommand(request);
		System.out.println("mc post - command : " + command);
		// joinSubmit.mc - 회원가입 요청 처리
		
		String view = "";
		
		if(command.equals("joinSubmit.mc")) {
			System.out.println("회원 가입 처리 요청");
			ms.memberJoin(request, response);
		}else if(command.equals("login.mc")) {
			System.out.println("post 로그인 요청 처리");
			boolean isLogin = ms.memberLogin(request, response);
			if(isLogin) {
				request.setAttribute("msg", "로그인 성공");
				view = "/index.jsp";
			}else {
				request.setAttribute("msg", "로그인 실패");
				view = "/member/login.jsp";
			}
		}else if(command.equals("withdraw.mc")) {
			System.out.println("회원 탈퇴 요청 처리 - POST");
			ms.withDraw(request, response);
		}else if(command.equals("findPass.mc")) {
			// 이메일 아이디와 사용자 이름으로 비밀번호 찾기 메일 전송 요청 - POST
			ms.findPassSubmit(request, response);
		}else if(command.equals("passAccept.mc")){
				// 메일을 통해서 email(id) 와 코드로 비밀번호 찾기 페이지 요청
			ms.changePassCode(request, response);
		}else if(command.equals("changePass.mc")){
				// 새로운 비밀번호로 변경 요청
			ms.changePass(request, response);
		}else {
			response.sendError(404);
		}
		FactoryUtil.nextPage(request, response, view);
	}

}









