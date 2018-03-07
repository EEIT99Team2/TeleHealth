package util;

public class textPwd {


	//亂數密碼
//	public static void main(String[] args) {
//		 String a = ChangePwd.GoPwd();
//		System.out.println("a="+a);
//	}
	

	public static void main(String[] args) {
		String a = "GYM123";
		
		String account = "aaa123@gmail.com";
		String MD5pwd = GlobalService.getMD5Endocing(GlobalService.encryptString(a));
	
		
	}
	
}
