package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.regex.Pattern;

import beans.MemberVO;
import jakarta.mail.Message;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repositories.MemberDAO;
import repositories.MemberDAOImpl;
import util.FactoryUtil;
import util.GmailAuthentication;

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
			
			// /는 script에서 표현
			String regex = "^([\\w-]+(?:\\.[\\w-]+)*)@((?:[\\w-]+\\.)*\\w[\\w-]{0,66})\\.([a-z]{2,6}(?:\\.[a-z]{2})?)$";
			
			// 아이디가 이메일 형식인지 확인
			if(Pattern.matches(regex, id)) {
				System.out.println("이메일 형식 일치");
			}else {
				pw.println("alert('이메일 형식이 아닙니다.');");
				pw.println("history.go(-1);");
				pw.print("</script>");
				return;
				
			}
			
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

	@Override
	public void findPassSubmit(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		// db mvc_member 테이블에서 id와 이름이 일치하는 사용자가 존재하는지 체크
		boolean isCheck = dao.checkMember(id, name);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(!isCheck) {
				System.out.println("일치하는 정보 없음");
				throw new NullPointerException("일치하는 사용자 정보 없음");
			}
			
			// 5자리의 숫자 코드 생성
			StringBuilder sb = new StringBuilder();
			for(int i = 0; i < 5; i++) {
				int random = (int)(Math.random()*10);
				sb.append(random);
			}
			String code = sb.toString();
			System.out.println("발송 코드 : " + code);
			
			// 메일로 발송될 코드 DB에 저장
			dao.addPassCode(id, code);
			System.out.println("등록 완료");
			
			// 메일 발송
			GmailAuthentication ga = new GmailAuthentication();
			Session session = Session.getDefaultInstance(ga.getProp(),ga);
			// MimeMessage : 메일 발송 정보를 저장해줌
			MimeMessage msg = new MimeMessage(session);
			InternetAddress fromAddress = new InternetAddress(
				"master@bitc.com","MASTER"	
			);
			InternetAddress toAddress = new InternetAddress(id);
			// 발송 시간
			msg.setSentDate(new Date());
			msg.setHeader("Content-Type", "text/html;charset=utf-8");
			msg.setRecipient(Message.RecipientType.TO, toAddress);
			msg.setFrom(fromAddress);
			msg.setSubject("비밀번호 찾기 요청","utf-8");
			
			StringBuilder mail = new StringBuilder();
			mail.append("<!DOCType html>");
			mail.append("<html>");
			mail.append("<head>");
			mail.append("<meta charset='utf-8'>");
			mail.append("</head>");
			mail.append("<body>");
			mail.append("<h1> @@@ 사이트 비밀번호 찾기 이메일 인증! </h1>");
			mail.append("<form action='http://10.100.205.95:8080");
			mail.append(request.getContextPath());
			mail.append("/passAccept.mc' method='POST' ");
								  //매개변수 open할 창, 이름
			mail.append(" onsubmit='window.open(\"\",\"w\")' target='w'>");
			mail.append("<input type='hidden' name='id' value='"+id+"'>");
			mail.append("<input type='hidden' name='code' value='"+code+"'>");
			mail.append("<input type='submit' value='이메일 인증 완료'>");
			mail.append("</form>");
			mail.append("</body>");
			mail.append("</html>");
			
			String content = mail.toString();
			System.out.println(content);
			msg.setContent(content,"text/html;charset=utf-8");
			// blocking
			Transport.send(msg);
			
			out.println("<script>");
			out.println("alert('메일이 정상적으로 전송되었습니다.\\n메일함을 확인해주세요.');");
			out.println("location.href='main';");
			out.println("</script>");
			
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<script>");
			out.println("alert('서비스에 문제가 있습니다. 다시 이용해주세요\\n"+e.getMessage()+"');");
			out.println("location.href='login.mc';");
			out.println("</script>");
		}
	}

	@Override
	public void changePassCode(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");			// email
		String code = request.getParameter("code");		// code
		System.out.println(id + " : " + code);
		
		boolean isCheck = dao.checkPassCode(id, code);
		try {
		if(isCheck) {
			System.out.println("일치");
			request.setAttribute("id", id);
			FactoryUtil.nextPage(request, response, "/member/changePass.jsp");
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.print("<script>");
			pw.print("alert('잘못된 요청입니다.');");
			pw.print("location.href='login.mc';");
			pw.print("</script>");
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void changePass(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		dao.changePass(id, pass);
		
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter pw = response.getWriter();
			pw.print("<script>");
			pw.print("alert('비밀번호가 변경되었습니다.');");
			pw.print("location.href='login.mc';");
			pw.print("</script>");
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}




