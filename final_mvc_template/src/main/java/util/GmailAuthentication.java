package util;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;

public class GmailAuthentication extends Authenticator {
	
	private PasswordAuthentication passwordAuthentication;
	
	public GmailAuthentication() {
		try {
			Properties prop = new Properties();
			prop.load(new FileReader(getClass().getResource("../prop/gmail.properties").getPath()));
			System.out.println(prop);
			String id = prop.getProperty("id");
			String pw = prop.getProperty("pw");
			passwordAuthentication = new PasswordAuthentication(id, pw);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}
	
	public Properties getProp() {
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");
		return prop;
	}
	
}






