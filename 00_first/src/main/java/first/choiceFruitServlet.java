package first;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class choiceFruitServlet
 */
public class choiceFruitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// method 전송 방식 get 방식일 때 서버에서 호출 되는 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// fruits=apple.png&fruits=banana.png&fruits=mango.png&fruits=rice.png
		String[] fruits = request.getParameterValues("fruits");
		System.out.println(Arrays.toString(fruits));
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		if(fruits != null) {
			// 선택한 과일 존재
			// [apple.png, banana.png, mango.png, rice.png]
			for(String fruit : fruits) {
				out.println("Choice Fruit : " + fruit + "<br/>");
				out.println("<img src='resources/img/"+fruit+"'/>");
				out.println("<br/> <a href='home.html'>home<a>");
			}
		}else {
			// 선택한 과일 없음
			out.println("<script>");
			out.println("alert('선택된 과일이 없습니다.');");
			out.println("history.go(-1)");
			out.println("</script>");
		}
	}

}






