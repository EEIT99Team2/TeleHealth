package register.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import employees.model.EmployeesBean;
import employees.model.EmployeesService;
import register.model.LoginService;
import register.model.MemberBean;
import util.GlobalService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	@Autowired
	private EmployeesService employeesService;

	@RequestMapping(path = { "/login.controller" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String method(String username, String pwd, Model model, String remember, HttpServletResponse response,
			String login, HttpSession session) {
		Map<String, String> errorMsg = new HashMap<>();
		model.addAttribute("MsgMap", errorMsg);
		boolean status = username.contains("@");
		if (status) {
			if (username == null || username.trim().length() == 0) {
				errorMsg.put("errorUserName", "帳號欄位不能空白");
			}
			if (pwd == null || pwd.trim().length() == 0) {
				errorMsg.put("errorPwd", "密碼欄位不能空白");
			}
			if (errorMsg != null && !errorMsg.isEmpty()) {
				return "login.error";
			}
			Cookie cookieUser = null;
			Cookie cookiePassword = null;
			Cookie cookieRememberMe = null;

			String MD5pwd = GlobalService.getMD5Endocing(GlobalService.encryptString(pwd));
			MemberBean bean = loginService.login(username, MD5pwd);

			if (bean == null) {
				errorMsg.put("errorPwd", "帳號或密碼不正確");
				return "login.error";
			} else {
				String a = bean.getStatus();
				if (a.equals("N")) {
					errorMsg.put("errorPwd", "此帳號未開通");
					return "login.error";
				} else if (a.equals("Y")) {
					session.setAttribute("LoginOK", bean);
					if (remember != null) { // rm存放瀏覽器送來之RememberMe的選項
						cookieUser = new Cookie("user", username);
						cookieUser.setMaxAge(30 * 60 * 60);
						cookieUser.setPath("/TeleHealth/home.jsp");
						String encodePassword = GlobalService.encryptString(pwd);
						cookiePassword = new Cookie("password", encodePassword);
						cookiePassword.setMaxAge(30 * 60 * 60);
						cookiePassword.setPath("/TeleHealth/home.jsp");
						cookieRememberMe = new Cookie("rememberMe", "true");
						cookieRememberMe.setMaxAge(30 * 60 * 60);
						cookieRememberMe.setPath("/TeleHealth/home.jsp");
					} else {
						cookieUser = new Cookie("user", username);
						cookieUser.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
						cookieUser.setPath("/TeleHealth/index.jsp");
						// String encodePassword =
						// DatatypeConverter.printBase64Binary(password.getBytes());
						String encodePassword = GlobalService.encryptString(pwd);
						cookiePassword = new Cookie("password", encodePassword);
						cookiePassword.setMaxAge(0);
						cookiePassword.setPath("/TeleHealth/index.jsp");
						cookieRememberMe = new Cookie("rememberMe", "false");
						cookieRememberMe.setMaxAge(30 * 60 * 60);
						cookieRememberMe.setPath("/TeleHealth/index.jsp");
					}
					response.addCookie(cookieUser);
					response.addCookie(cookiePassword);
					response.addCookie(cookieRememberMe);

					return "login.success";
				}
			}
			return "login.error";
		} else {
			if (username == null || username.trim().length() == 0) {
				errorMsg.put("errorUserName", "帳號欄位不能空白");
			}
			if (pwd == null || pwd.trim().length() == 0) {
				errorMsg.put("errorPwd", "密碼欄位不能空白");
			}
			if (errorMsg != null && !errorMsg.isEmpty()) {
				return "login.error";
			}
			Cookie cookieUser = null;
			Cookie cookiePassword = null;
			Cookie cookieRememberMe = null;
			String MD5pwd = GlobalService.getMD5Endocing(GlobalService.encryptString(pwd));
			EmployeesBean bean = employeesService.checkAccountEmp(username, MD5pwd);
			if (bean == null) {
				errorMsg.put("errorPwd", "帳號或密碼不正確");
				return "login.error";
			} else {
				String EmpStatus = bean.getEmpStatus();
				if (EmpStatus.equals("N")) {
					errorMsg.put("errorPwd", "帳號或密碼不正確");
					return "login.error";
				} else if (EmpStatus.equals("E")) {
					session.setAttribute("empLoginOK", bean);
					if (remember != null) { // rm存放瀏覽器送來之RememberMe的選項
						cookieUser = new Cookie("user", bean.getAccount());
						cookieUser.setMaxAge(30 * 60 * 60);
						cookieUser.setPath("/TeleHealth/home.jsp");
						String encodePassword = GlobalService.encryptString(pwd);
						cookiePassword = new Cookie("password", encodePassword);
						cookiePassword.setMaxAge(30 * 60 * 60);
						cookiePassword.setPath("/TeleHealth/home.jsp");
						cookieRememberMe = new Cookie("rememberMe", "true");
						cookieRememberMe.setMaxAge(30 * 60 * 60);
						cookieRememberMe.setPath("/TeleHealth/home.jsp");
					} else {
						cookieUser = new Cookie("user", username);
						cookieUser.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
						cookieUser.setPath("/TeleHealth/index.jsp");
						// String encodePassword =
						// DatatypeConverter.printBase64Binary(password.getBytes());
						String encodePassword = GlobalService.encryptString(pwd);
						cookiePassword = new Cookie("password", encodePassword);
						cookiePassword.setMaxAge(0);
						cookiePassword.setPath("/TeleHealth/index.jsp");
						cookieRememberMe = new Cookie("rememberMe", "false");
						cookieRememberMe.setMaxAge(30 * 60 * 60);
						cookieRememberMe.setPath("/TeleHealth/index.jsp");
					}
					response.addCookie(cookieUser);
					response.addCookie(cookiePassword);
					response.addCookie(cookieRememberMe);

					return "login.success";
				}
			}
			return "login.error";
		}
	}
	
	
	@RequestMapping(path = { "/logout.controller" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) {
		if (session.getAttribute("LoginOK") != null) {
			session.removeAttribute("LoginOK");
		} else if (session.getAttribute("empLoginOK") != null) {
			session.removeAttribute("empLoginOK");
		}
		return "logout.success";
	}

}
