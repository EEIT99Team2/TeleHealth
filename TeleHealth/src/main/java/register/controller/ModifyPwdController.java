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
import register.model.RegisterService;
import util.GlobalService;

@Controller
public class ModifyPwdController {
	
	@Autowired
	private RegisterService registerService =null;
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(
			path={"/ModifyPwd.controller"},
			method={RequestMethod.GET, RequestMethod.POST}
	)
	public String method(String cellphone,String Newpwd,String oldpwd,String pwdCheck,Model model,HttpSession session) {
		
		Map<String, String> errorMsg = new HashMap<>();
		model.addAttribute("MsgMap", errorMsg); 
		
		
		MemberBean member = (MemberBean)session.getAttribute("LoginOK");	
		if(member==null) {
			return "login.error";
		}
		String Email = member.getAccount();
					
		if(oldpwd ==null|| oldpwd.trim().length()==0) {
			errorMsg.put("errorOldPwd", "會員密碼欄位不能空白");
		}else if(oldpwd!=null && oldpwd.trim().length()>1) {
				String Password = member.getPwd(); //LOGINOK取出的密碼
				
				//會員輸入的密碼加密
				String Pwd = GlobalService.getMD5Endocing(GlobalService.encryptString(oldpwd));
				
			if(Pwd.equals(Password)) {
				System.out.println("舊的密碼與資料庫密碼相同");
			
			}else {
				errorMsg.put("errorOldPwd", "會員密碼錯誤");
			}										
		}
		if(pwdCheck==null||pwdCheck.trim().length()==0) {
			errorMsg.put("errorPwdCheck","確認密碼不能空白");
		}	
		
		if(Newpwd ==null|| Newpwd.trim().length()==0) {
			errorMsg.put("errorNewpwd", "新的會員密碼欄位不能空白");	
		}else{
			if(Newpwd.matches("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$")) {
				System.out.println("新的會員密碼格式正確");				
					if(pwdCheck.equals(Newpwd)) {
						Boolean a = loginService.UpdatePasword(Email, Newpwd);
						if(a==true) {
							System.out.println("新密碼修改完成");
							return "forgetPwd.success";
						}else {
							System.out.println("修改失敗");
//							return "ModifyPwdController.error";
						}									
					}else {
						errorMsg.put("errorPwdCheck", "與上面輸入值不符合");
					}
														
			}else {
				errorMsg.put("errorNewpwd", "新的會員密碼欄位格式錯誤");
			}					
		}
		
		if (errorMsg != null && !errorMsg.isEmpty()) {
			return "ModifyPwdController.error";
		}else {
			return "register.success";	
		}
		
		
	}
	
}
