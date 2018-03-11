package register.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import register.model.LoginService;
import register.model.MemberBean;
import util.GlobalService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService=null;
	
	@RequestMapping(
			path={"/login.controller"},
			method={RequestMethod.GET, RequestMethod.POST}
			)
	public String method(String usrname,
			String psw, 
			Model model,
			String ststus,
			HttpSession session){
		//接收資料
		//驗證資料
		Map<String, String> errorMsg = new HashMap<>();
		model.addAttribute("MsgMap", errorMsg); 
		if(usrname ==null || usrname.trim().length()==0) {
			errorMsg.put("errorUsrName", "帳號欄位不能空白");
		}
		if(psw ==null || psw.trim().length()==0) {
			errorMsg.put("errorPsw", "密碼欄位不能空白");
		}
		if(errorMsg!=null && !errorMsg.isEmpty()) {
			return "login.error";
		}

//呼叫model
		
//		String pswGo = GlobalService.getMD5Endocing(GlobalService.encryptString(psw));
//		pswGo = GlobalService.decryptString(key, stringToDecrypt)
		
		String MD5pwd = GlobalService.getMD5Endocing(GlobalService.encryptString(psw));
		System.out.println("MD5pwd="+MD5pwd);
		MemberBean bean = loginService.login(usrname, MD5pwd);	
//		String checkaccount = bean.getStatus();
								
					if(bean==null) {
					errorMsg.put("errorPsw", "帳號或密碼不正確");
					return "login.error"; 
				}else {
					String a = bean.getStatus();
					if(a.equals("N")) {
						errorMsg.put("errorPsw", "此帳號未開通");
						return "login.error"; 
					}else if(a.equals("Y")) {
						System.out.println("帳號已開通");
						session.setAttribute("LoginOK",bean);
						return "login.success";
						}													
				}
				return "login.error";
			
			
//			if(checkaccount.equals("N")) {
//				errorMsg.put("errorPsw", "此帳號未開通");
//				}else if(checkaccount.equals("Y")) {
//					if(bean==null) {
//						errorMsg.put("errorPsw", "帳號或密碼不正確");
//						return "login.error"; 
//					}else {
//						session.setAttribute("LoginOK",bean);
//						return "login.success";
//					}								
//				}				
	}
}
