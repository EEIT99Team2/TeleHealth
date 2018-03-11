package register.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import register.model.dao.MemberDAOHibernate;

@Service
public class OpenUpToAccountService {
	@Autowired
	private MemberDAOHibernate memberDAO;
	
	@Transactional
	public MemberBean openUpToAccount(String id) {
		MemberBean temp = new MemberBean();
		temp.setMemberId(id);
		temp.setStatus("Y");
		return memberDAO.update(temp);
	}
}
