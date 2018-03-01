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
			result = memberDAO.insert(bean);
		}
		return result;
	}
	
	
	
	
//	public MemberBean update(MemberBean bean) {
//		MemberBean result = null;
//		if(bean!=null) {
//			result = memberDAO.update(bean.getMemName(),bean.getPhone(),bean.getCellphone(),);
//			String memName,String phone,
//            String cellphone,String gender,java.util.Date birth,
//            double memHeight, double memWeight, String bloodType,
//            String address,String pwd,String medicine,Blob photo,String fileName,String medicalHistory,int cancelCount,int negCount,int point,int expendRecord,String account
//		}
//		return result;
//	}
}
