package util;

public class textEmail {


	public static void main(String[] args) {
		String account1 ="sssbx6123@gmail.com";
		String pwd2 ="FQQQQQ";
		
		String select = PwdGmail.GoMail(account1, pwd2);
		if(select.equals("2")) {
			System.out.println("發送成功");
		}else {
			System.out.println("失敗");
		}
	}
	
	
	
}
