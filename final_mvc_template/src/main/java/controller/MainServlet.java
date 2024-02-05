package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MemberService;
import util.FactoryUtil;

import java.io.IOException;

public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 자동 로그인 체크
		MemberService.loginCheck(request);
		
		request.setAttribute("test", "Main Page");
		FactoryUtil.nextPage(request, response, "/common/main.jsp");
	}

}











