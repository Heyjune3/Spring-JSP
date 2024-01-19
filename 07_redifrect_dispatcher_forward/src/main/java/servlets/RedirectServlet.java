package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet class가 지정한 요청이 최초에 요청을 받게 되면
 * ServletClass 생성 -> init(); 호출(최초에 한번)
 * 
 * 그 다음 요청이 들어올때마다
 * service -> doGet OR doPost 호출
 */

public class RedirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	// Service를 직접 정의해놔서 아무것도 하지 않으면 doGet이나 doPost를 호출하지 못하고 Service에서 끝나버림
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Redirect Service 호출");
		// super.service(request, response);
		String method = request.getMethod();
		System.out.println("요청 전송 방식 : " + method);
		if(method.equalsIgnoreCase("POST")) {
			response.sendError(405,"처리할 수 없는 요청 방식 입니다.");
			return;
		}
		doGet(request,response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Redirect doGet 호출");
		String id = request.getParameter("id");
		System.out.println("Param id : " + id);
		request.setAttribute("attrID", id);
		response.setStatus(302);
		response.setHeader("Location", "response.jsp");
		// == response.sendRedirect("response.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Redirect doPost 호출");
	}

}
