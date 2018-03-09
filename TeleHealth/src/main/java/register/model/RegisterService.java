package register.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import register.model.dao.MemberDAOHibernate;

@Service
@Transactional
public class RegisterService {
	@Autowired
	private MemberDAOHibernate memberDAO;
	
	@Transactional(readOnly=true)
	public List<MemberBean> selectAll() {
		List<MemberBean> result = null;
		result = memberDAO.selectAll(); 
		return result;
	}
	
	@Transactional(readOnly=true)
	public MemberBean selectByAccount(String account) {
		MemberBean result = null;
		List<MemberBean> list = memberDAO.selectByAccount(account);
		if(list != null && list.size() > 0) {
			result = list.get(0);
		}
		return result;
	}
	
	public MemberBean insert(MemberBean bean) {
		MemberBean result = null;
		if(bean!=null) {
			List<MemberBean> list = memberDAO.selectByAccount(bean.getAccount());
			MemberBean temp = null;
			if(list != null && list.size() > 0) {
				temp = list.get(0);
			}					
			if(temp==null) {
				result = memberDAO.insert(bean);
			}
		}
		return result;
	}
	
	public MemberBean Update(MemberBean bean) {
		MemberBean result = null;
		if(bean!=null) {
			result = memberDAO.update(bean);
		}
		return result;
	}

//	public boolean update(MemberBean bean) {
//		boolean result = false;
//		if(bean!=null) {
//			result = memberDAO.update(bean.getMemName(),bean.getPhone(),bean.getCellphone(),
//			bean.getBirth(),bean.getMemHeight(),bean.getMemWeight(),bean.getBloodType(),
//			bean.getAddress(),bean.getPwd(),bean.getMedicine(),bean.getPhoto(),bean.getFileName(),bean.getMedicalHistory(),bean.getAccount());
//			return true;
//		}
//		return result;
//	}
}
