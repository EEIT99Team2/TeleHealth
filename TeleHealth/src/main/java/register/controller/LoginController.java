package register.controller;

import java.util.HashMap;
import java.util.List;
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
								
			//根據model執行結果呼叫view元件
			if(bean==null) {
				errorMsg.put("errorPsw", "帳號或密碼不正確");
				return "login.error"; 
			}else {
				session.setAttribute("LoginOK",bean);
				return "login.success";
			}			

	}
}
