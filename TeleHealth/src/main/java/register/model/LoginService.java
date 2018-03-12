package register.model;

import java.util.Date;
import java.util.List;

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
	
	@Transactional(readOnly=true)
	public boolean UpdatePasword (String account,String pwd) {
		List<MemberBean> Account = memberDAO.selectByAccount(account);
		String ChangeAccount= Account.get(0).getAccount();		
		if(ChangeAccount!=null) {
			String NewPwd = GlobalService.getMD5Endocing(GlobalService.encryptString(pwd));
			
			System.out.println("ChangePwd="+NewPwd);
			
			boolean ChangePw = memberDAO.UdPwd(NewPwd, ChangeAccount);		
			if(ChangePw==true) {
				System.out.println("新密碼修改完成");
				return	true;
			}else {
				System.out.println("修改失敗");
				return false;
			}
		}
		return false;	
	}
	
	@Transactional(readOnly=true)
	public MemberBean login(String account, String MD5pwd) {
		List<MemberBean> beans = memberDAO.selectByAccount(account);
		if (!beans.isEmpty()) {			
			if(MD5pwd!=null && MD5pwd.length()!=0) {			
				String temp = MD5pwd; //使用者輸入
				MemberBean member = beans.get(0);
				String password = member.getPwd();
				if(temp.equals(password)) {
					return member;
				}else {					
					return null;
				}
			}
		}
		return null;		
	}
	
	@Transactional(readOnly=true)
	public String forgetPwd(String account) {
		List<MemberBean> bean = memberDAO.selectByAccount(account);
		if(!bean.isEmpty()) {
			if(account!=null && account.length()!=0) {
				String ForgetPwd = account; //使用者輸入
				MemberBean member =bean.get(0);
				String LookEmail = member.getAccount();								
				
				if(ForgetPwd.equals(LookEmail)) {
					return LookEmail;
				}else {
					return null;
				}
			}  
		}
		return null;		
	}
	
	@Transactional(readOnly=true)
	public String GetPwd(String account) {
		List<MemberBean> bean = memberDAO.selectByAccount(account);
		
		if(!bean.isEmpty()) {
			MemberBean member =bean.get(0);
			String Pwd = member.getPwd();
			System.out.println("Pwd=============="+Pwd);
			if(Pwd!=null && Pwd.length()!=0) {									
			
				return null;
			}else {
				return null;
			}
		}
		return null;				
	}
	
	@Transactional(readOnly=true)
	public String UpdatePwd(String account) {
		List<MemberBean> bean = memberDAO.selectByAccount(account);
		System.out.println("qoo="+bean);
		return account;				
	}

	@Transactional(readOnly=true)
	public boolean UpdatePassword (String account) {
		List<MemberBean> Account = memberDAO.selectByAccount(account);
		String ChangeAccount= Account.get(0).getAccount();		
		if(ChangeAccount!=null) {
			String pwd = ChangePwd.GoPwd(); //新的亂數密碼	
			String NewPwd = GlobalService.getMD5Endocing(GlobalService.encryptString(pwd));
			
			System.out.println("ChangePwd="+NewPwd);
			
			boolean ChangePw = memberDAO.UdPwd(NewPwd, ChangeAccount);
			String sendEmail = SendMail.send(ChangeAccount,"TeleHealth遠端照護系統-忘記密碼","親愛的會員您好，\n您的新密碼為:" + pwd + "\n牽伴健康諮詢平台全體同仁關心您！"
					+ "\n時間:" + (new Date()).toString());
			if(ChangePw==true && sendEmail!=null ) {
				System.out.println("新密碼已寄到信箱");
				return true;
			}
		}
		return false;	
	}
}
