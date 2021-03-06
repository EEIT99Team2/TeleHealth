package register.model;

import java.util.Date;
import java.util.List;

import org.apache.struts2.components.Bean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import register.model.dao.MemberDAOHibernate;
import util.ChangePwd;
import util.GlobalService;
import util.PwdGmail;
import util.SendMail;

@Service
@Transactional
public class LoginService {
	@Autowired
	private MemberDAOHibernate memberDAO;

	@Transactional
	public boolean UpdatePasword(MemberBean member, String pwd) {
		if (member != null) {
			pwd = GlobalService.getMD5Endocing(GlobalService.encryptString(pwd));
			member.setPwd(pwd);
			if (memberDAO.update(member) != null) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

	@Transactional(readOnly = true)
	public MemberBean login(String account, String MD5pwd) {
		List<MemberBean> beans = memberDAO.selectByAccount(account);
		if (!beans.isEmpty()) {
			if (MD5pwd != null && MD5pwd.length() != 0) {
				String temp = MD5pwd; // 使用者輸入
				MemberBean member = beans.get(0);
				String password = member.getPwd();
				if (temp.equals(password)) {
					return member;
				} else {
					return null;
				}
			}
		}
		return null;
	}

	@Transactional
	public String forgetPwd(String account) {
		List<MemberBean> bean = memberDAO.selectByAccount(account);
		if (!bean.isEmpty()) {
			if (account != null && account.length() != 0) {
				String ForgetPwd = account; // 使用者輸入
				MemberBean member = bean.get(0);
				String LookEmail = member.getAccount();

				if (ForgetPwd.equals(LookEmail)) {
					return LookEmail;
				} else {
					return null;
				}
			}
		}
		return null;
	}

	@Transactional
	public String GetPwd(String account) {
		List<MemberBean> bean = memberDAO.selectByAccount(account);

		if (!bean.isEmpty()) {
			MemberBean member = bean.get(0);
			String Pwd = member.getPwd();
			if (Pwd != null && Pwd.length() != 0) {

				return null;
			} else {
				return null;
			}
		}
		return null;
	}

	public String UpdatePwd(String account) {
		List<MemberBean> bean = memberDAO.selectByAccount(account);
		return account;
	}

	@Transactional
	public MemberBean selectById(String memberId) {
		if (memberId != null && memberId.trim().length() > 0) {
			return memberDAO.selectById(memberId.trim());
		}
		return null;
	}

	@Transactional
	public MemberBean selectByAccount(String account) {
		if (account != null && account.trim().length() > 0) {
			List<MemberBean> list = memberDAO.selectByAccount(account.trim());
			return list.get(0);
		}
		return null;
	}

	@Transactional
	public boolean UpdatePassword(String account) {
		List<MemberBean> members = memberDAO.selectByAccount(account);
		if (members != null && members.size() > 0) {
			MemberBean member = members.get(0);
			String pwd = ChangePwd.getNewRandomPwd(); // 新的亂數密碼
			String newPwd = GlobalService.getMD5Endocing(GlobalService.encryptString(pwd));

			// boolean ChangePw = memberDAO.UdPwd(NewPwd, ChangeAccount);

			member.setPwd(newPwd);
			if (memberDAO.update(member) != null) {
				boolean flag = SendMail.send(account, "牽伴健康諮詢平台-重設密碼信件",
						"親愛的會員您好，\n您的新密碼為:" + pwd + "\n牽伴健康諮詢平台全體同仁關心您！" + "\n時間:" + (new Date()).toString());
				if (member != null && flag) {
					return true;
				}
			}
		}
		return false;
	}
}
