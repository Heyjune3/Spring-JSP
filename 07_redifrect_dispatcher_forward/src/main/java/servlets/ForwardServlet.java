package servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 배포서술자에 굳이 등록하지 않고 어노테이션으로 Servlet 등록 방법
@WebServlet("/forward")
public class ForwardServlet extends HttpServlet{

	private static final long serialVersionUID = 7396539970228569232L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("FORWARD doGET 호출");
		String id = request.getParameter("id");
		System.out.println("forward param : " + id);
		request.setAttribute("attrID", id);
		
		// forward 방식으로 화면 전환
		RequestDispatcher rd = request.getRequestDispatcher("response.jsp");
		// 출력되는 페이지의 request, response가 필요
		rd.forward(request, response);
	}

	
}
