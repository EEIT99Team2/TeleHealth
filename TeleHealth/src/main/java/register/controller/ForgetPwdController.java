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
import util.PwdGmail;

@Controller
public class ForgetPwdController {

	@Autowired
	private LoginService loginService;

	@RequestMapping(path = { "/ForgetPwd.controller" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String method(String account, Model model, HttpSession session) {

		Map<String, String> errorMsg = new HashMap<>();
		model.addAttribute("MsgMap", errorMsg);

		if (account == null || account.trim().length() == 0) {
			errorMsg.put("errorAccount", "請填寫您的帳號(即為Email)");
			return "forgetPwd.error";
		}

		String ForgetEmail = loginService.forgetPwd(account);
		if (ForgetEmail == null) {
			errorMsg.put("errorAccount", "查無此帳號，請重新輸入");
			return "forgetPwd.error";
		} else {
			if (ForgetEmail != null && ForgetEmail.length() > 0) {
				if (ForgetEmail.equals(account)) {

					// 要記新密碼給會員 然後 Update資料庫的舊密碼
					// String Password = loginService.GetPwd(ForgetEmail);
					Boolean a = loginService.UpdatePassword(account);

					if (a == true) {
						return "forgetPwd.success";
					} else {
						errorMsg.put("errorAccount", "寄信失敗!!");
						return "forgetPwd.error";
					}

				}
			}
		}
		return ForgetEmail;
	}

}
