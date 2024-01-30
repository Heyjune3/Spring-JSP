package service;

import java.io.IOException;
import java.io.PrintWriter;

import beans.MemberVO;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repositories.MemberDAO;
import repositories.MemberDAOImpl;

public class MemberServiceImpl implements MemberService {
	
	MemberDAO dao = new MemberDAOImpl();

	@Override
	public void memberJoin(HttpServletRequest request, HttpServletResponse response) {
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String rePass = request.getParameter("re_pass");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		
		MemberVO vo = new MemberVO(id,pass,name,age,gender);
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.print("<script>");
			if(!pass.equals(rePass)) {
				pw.println("alert('비밀번호가 일치하지 않습니다.');");
				pw.println("history.go(-1);");
				pw.print("</script>");
				return;
			}
			// 중복 아이디 체크
			MemberVO member = dao.getMemberById(id);
			if(member != null) {
				pw.println("alert('이미 사용중인 아이디 입니다.');");
				pw.println("history.go(-1);");
				pw.print("</script>");
				return;
			}
			
			// 사용 가능한 사용자 정보 - 회원 등록 처리
			boolean isSuccess = dao.memberJoin(vo);
			if(isSuccess) {
				// 회원 가입 성공
				pw.println("alert('회원 가입 성공');");
				pw.println("location.href='login.mc';");
			}else {
				pw.println("alert('회원 가입 실패');");
				pw.println("history.back();");
			}
			pw.print("</script>");
		}catch(Exception e) {}
	}

	@Override
	public boolean memberLogin(HttpServletRequest request, HttpServletResponse response) {
		boolean isLogin = false;
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String check = request.getParameter("login");
		
		MemberVO member = dao.memberLogin(id, pass);
		if(member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			isLogin = true;
			// 로그인 인증 성공 시 로그인 상태 유지 요청 체크
			if(check != null) {
				Cookie cookie = new Cookie("id",id);
				cookie.setMaxAge(60*60*24*15);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
		}
		return isLogin;
	}

	@Override
	public void memberUpdate(HttpServletRequest request, HttpServletResponse response) {
		
	}

	@Override
	public void logOut(HttpServletRequest request, HttpServletResponse response) {
		// 로그인 된 사용자 정보 - session에서 member 제거
		request.getSession().removeAttribute("member");
		// 혹시라도 쿠키가 등록 되어 있으면 삭제
		Cookie cookie = new Cookie("id","");
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}

	@Override
	public void withDraw(HttpServletRequest request, HttpServletResponse response) {
		String tempPass = request.getParameter("tempPass");
		
		MemberVO member = (MemberVO)request.getSession().getAttribute("member");
		
		response.setContentType("text/html;charset=utf-8");
		
		try {
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			if(member != null && member.getPass().equals(tempPass)) {
				// db에서 회원 탈퇴 정보 처리
				dao.withDrawMember(member.getNum());
				// session에서 member 삭제 및 쿠키 정보 삭제
				logOut(request,response);
				pw.println("alert('회원탈퇴 요청 처리 완료');");
				pw.println("location.href='index.jsp';");
			}else {
				pw.println("alert('회원탈퇴 요청 처리 실패');");
				pw.println("history.back();");
			}
			pw.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}




