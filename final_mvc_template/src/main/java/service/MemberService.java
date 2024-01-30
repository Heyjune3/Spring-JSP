package service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface MemberService {

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
		
	}
}
