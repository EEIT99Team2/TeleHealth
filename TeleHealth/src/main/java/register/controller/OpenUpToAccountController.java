package register.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import register.model.MemberBean;
import register.model.OpenUpToAccountService;

@Controller
public class OpenUpToAccountController {

	@Autowired
	private OpenUpToAccountService openUpService=null;

	@RequestMapping(
			path={"/openup.controller"},
			method={RequestMethod.GET, RequestMethod.POST}
			)
	public String method(String openup, HttpSession session){
		System.out.println("hahahaahaha");
		MemberBean member = openUpService.openUpToAccount(openup);
		if(member != null) {
			return "login.error";
		} else {
			return "register.error";
		}
	}
	
}
