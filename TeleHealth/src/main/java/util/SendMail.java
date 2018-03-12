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

public class SendMail {
	public static String send(String account, String mailTitle, String mailContent) {
				
			String host = "smtp.gmail.com";
		  int port = 465;
		  final String username = "mailTeleHealth@gmail.com";
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
		   message.setFrom(new InternetAddress("mailTeleHealth@gmail.com"));
		   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(account));
		   if(mailTitle != null || mailTitle.trim().length() > 0) {
			   message.setSubject(mailTitle);
		   } else {
			   message.setSubject("牽伴健康諮詢平台聯絡信件");
		   }
		   if(mailContent != null || mailContent.trim().length() > 0) {
			   message.setText(mailContent);
		   }
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
