package util;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface FactoryUtil {
	
	/**
	 * @param request - 요청 정보
	 * @return - 전체 요청 정보에서 특정 요청에 대한 구분 문자열만 반환
	 */
	public static String getCommand(HttpServletRequest request) {
		return request.getRequestURI().substring(request.getContextPath().length()+1);
	}

	/**
	 * RequestDispatcher 를 이용하여 유효한 페이지 일 경우
	 * forward로 출력 페이지 전환
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public static void nextPage(
			HttpServletRequest request, 
			HttpServletResponse response, 
			String next) throws ServletException, IOException {
		if(next != null && !next.trim().equals("")) {
			request.getRequestDispatcher(next).forward(request, response);
		}
	}
}






