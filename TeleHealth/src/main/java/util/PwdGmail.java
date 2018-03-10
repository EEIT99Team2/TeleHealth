package util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class PwdGmail {
	public static String GoMail(String account, String pwd) {
				
			String host = "smtp.gmail.com";
		  int port = 465;
		  final String username = "eeit9904@gmail.com";
		  final String password = "zxcv5566";//your password
		  
		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.starttls.enable", "true");
		  props.put("mail.smtp.port", port);
		  props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		  Session session = Session.getInstance(props, new Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(username, password);
		   }
		  });

		  try {
			 String a= "1";
		   Message message = new MimeMessage(session);
		   message.setFrom(new InternetAddress("eeit9904@gmail.com"));
		   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(account));
		   message.setSubject("TeleHealth遠端照護系統-忘記密碼");
		   message.setText("親愛的會員您好，"+"\n"+"您的新密碼為:"+pwd+"\n"+"\n"+"TeleHealth遠端照護系統全體同仁關心您"+"\n"+"時間:"+(new Date()).toString());
//		   message.setText("时间: "+(new Date()).toString());
		   
		   Transport transport = session.getTransport("smtp");
		   transport.connect(host, port, username, password);
		   if(a.equals("1")) {
		  Transport.send(message);
		  a="2";
		   }
		   System.out.println("寄送email結束.");
				return a;
		  } catch (MessagingException e) {
		   throw new RuntimeException(e);
		  }		
		 }
}
