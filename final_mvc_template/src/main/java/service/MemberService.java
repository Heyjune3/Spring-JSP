package service;

import beans.MemberVO;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repositories.MemberDAO;
import repositories.MemberDAOImpl;

public interface MemberService extends FindPassService{

	/**
	 * 회원가입 처리
	 */
	void memberJoin(HttpServletRequest request, HttpServletResponse response);

	
	/**
	 * 로그인 처리
	 * @return true - 로그인 성공
	 * @return false - 로그인 실패
	 */
	boolean memberLogin(HttpServletRequest request, HttpServletResponse response);

	/**
	 * 회원 정보 수정
	 * @param request,response
	 */
	void memberUpdate(HttpServletRequest request, HttpServletResponse response);

	/**
	 * 로그아웃
	 * @param request, response
	 */
	void logOut(HttpServletRequest request, HttpServletResponse response);

	/**
	 * 회원 탈퇴
	 * @param request, response
	 */
	void withDraw(HttpServletRequest request, HttpServletResponse response);

	/**
	 * 자동 로그인 체크
	 * @param request
	 */
	static void loginCheck(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null && cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("id")) {
					String id = c.getValue();
					MemberDAO dao = new MemberDAOImpl();
					MemberVO member = dao.getMemberById(id);
					if(member != null) {
						session.setAttribute("member", member);
					}
					break; // for문 종료
				}
			}
		}
	}
}





