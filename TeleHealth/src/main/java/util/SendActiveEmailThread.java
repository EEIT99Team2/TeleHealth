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

import register.model.MemberBean;

public class SendActiveEmailThread {
	public static String GoMail(String account, String memberId) {

		String host = "smtp.gmail.com";
		int port = 465;
		final String username = "mailTeleHealth@gmail.com";
		final String password = "zxcv5566";// your password

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
			String a = "1";
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("mailTeleHealth@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(account));
			message.setSubject("TeleHealth遠端照護系統-會員開通");
			message.setText("親愛的會員您好，\n歡迎您使用健康諮詢平台的服務！\n\n請在 24 小時之內，點選以下網址完成 Email 認證，以啟用您的帳號:：\n"
					+ "https://localhost:8443/TeleHealth/openup.controller?openup=" + memberId+"\n\n請保留此封電子郵件，以便往後查詢\n若您有任何使用上的問題，請至會員中心說明網站查詢：https://localhost:8443/TeleHealth/Members/Members02.jsp \n 時間:"+(new Date()).toString());
			// message.setText("时间: "+(new Date()).toString());

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);
			if (a.equals("1")) {
				Transport.send(message);
				a = "2";
			}
			System.out.println("寄送email結束.");
			return a;
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
