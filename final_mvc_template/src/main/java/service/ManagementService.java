package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import beans.MemberVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface ManagementService {

	// 페이징 처리된 회원 목록
	/**
	 * @param request - page
	 * @return 회원목록 - List
	 */
	ArrayList<MemberVO> getMemberList(HttpServletRequest request);
	
	/**
	 * @param - 수정할 회원 정보
	 * @return 성공 여부
	 */
	boolean updateMember(HttpServletRequest request);
	
	/**
	 * @param - 삭제할 회원 정보
	 * @return 성공 여부
	 */
	boolean deleteMember(HttpServletRequest request);

	/**
	 * 관리자 여부 확인
	 */
	static boolean checkAdmin(HttpServletRequest request, HttpServletResponse response) {
		return false;
	}

}
