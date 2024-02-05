package controller;

import java.io.IOException;
import java.util.Properties;

import jakarta.mail.Message;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.MyAuthentication;
import util.GmailAuthentication;

public class GoogleMailTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Google 메일 발송 처리
		MyAuthentication ma = new MyAuthentication();
		// 연결할 메일서버 정보를 저장하는 Properties 객체
		Properties prop = new Properties();
		
		// TLS Transfer Layer Security - 587
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.port", "587");
		
		// SSL Secure Socket Layer - 465
//		prop.put("mail.smtp.host", "smtp.gmail.com");
//		prop.put("mail.smtp.auth", "true");
//		prop.put("mail.smtp.port", "465");
//		prop.put("mail.smtp.ssl.enable", "true");
//		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
// 		Session session = Session.getDefaultInstance(prop, ma);
		
		// 메일 발송을 위한 메일 서버와 연결 정보
		GmailAuthentication gm = new GmailAuthentication();
		Session session = Session.getDefaultInstance(gm.getProp(), gm);
		
		
		// 수취인 - 받는 사람
		// 메일 제목
		// 발신자 
		// 메일 내용
		try {
			MimeMessage msg = new MimeMessage(session);
			// 받는 사람
			InternetAddress to = new InternetAddress("hap0p9y@nate.com");
			// Recipient - 받는 사람
			msg.setRecipient(Message.RecipientType.TO, to);
			// TO - 받는사람
			// CC - 참조
			// BCC - 숨은 참조
			InternetAddress from = new InternetAddress("master@bitc.com","MASTER");
			// 발신자 정보 등록
			msg.setFrom(from);
			
			// 제목
			msg.setSubject("메일 발송 테스트","UTF-8");
			// 내용 형식 지정
			// msg.setHeader("Content-Type", "text/html;charset=utf-8");
			msg.setContent("<h1>테스트 내용입니다.<h1>","text/html;charset=utf-8");
			
			// 메일 발송 요청
			// 메일 발송이 완료 되거나 메일 발송 실패 확인 까지 blocking
			Transport.send(msg);
			System.out.println("메일 발송완료");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("메일 정송 실패");
		}
		
		response.sendRedirect(request.getContextPath()+"/main");
	} // end doGet

}












