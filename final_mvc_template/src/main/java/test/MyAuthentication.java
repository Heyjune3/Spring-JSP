package test;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;
/**
 * 메일 발송 인증에 필요한 정보를 저장하는 객체
 * 메일 발송 시 필요한 사용자 계정 정보를 저장하고
 * 지정된 메소드를 호출 하여 추가 
 */
public class MyAuthentication extends Authenticator{
	
	private PasswordAuthentication passwordAuthentication;
	
	public MyAuthentication() {
	String id = "kfd45674@gmail.com";
	String pw = "ayyyskggoalqwmhp";
	passwordAuthentication = new PasswordAuthentication(id,pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}
}
