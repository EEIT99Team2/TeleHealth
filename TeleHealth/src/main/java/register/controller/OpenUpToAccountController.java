package register.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import register.model.MemberBean;
import register.model.OpenUpToAccountService;
import register.model.dao.MemberDAOHibernate;

@Controller
public class OpenUpToAccountController {

	@Autowired
	private OpenUpToAccountService openUpService = null;

	@Autowired
	private MemberDAOHibernate memberDAO;

	@RequestMapping(path = { "/openup.controller" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String method(String openup, HttpSession session) {

		MemberBean data = memberDAO.selectById(openup);
		String status = data.getStatus();
		if (status.equals("N")) {
			MemberBean member = openUpService.openUpToAccount(openup);
			if (member != null) {
				return "AccountSuccess.success";
			} else {
				return "login.error";
			}
		} else {
			return "login.error";
		}

	}

}
