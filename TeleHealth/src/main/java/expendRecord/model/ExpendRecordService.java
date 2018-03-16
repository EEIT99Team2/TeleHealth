package expendRecord.model;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import expendRecord.model.dao.ExpendRecordDAO;

@Service
@Transactional
public class ExpendRecordService {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	@Autowired
	private ExpendRecordDAO expendRecordDAO;
	
	public ExpendRecordBean selectOne(String memberId,String MomentId) {
		ExpendRecordBean result=null;
		if(memberId!=null && memberId.trim().length()!=0 && MomentId!=null && MomentId.trim().length()!=0) {
			result = expendRecordDAO.selectOne(memberId, MomentId);			
		}		
	return result;
	}
	
	public List<ExpendRecordBean> selectByMemId(String memberId) {
		List<ExpendRecordBean> result =null;
		if(memberId!=null && memberId.trim().length()!=0) {
			result =expendRecordDAO.selectByMemId(memberId);
		}
		return result;
	}
	
	
	public ExpendRecordBean insert(ExpendRecordBean bean) {
		if(bean!=null) {
			ExpendRecordBean result=expendRecordDAO.insert(bean);
			return result;
		}
		return null;
	}
	
	public boolean update(ExpendRecordBean bean) {
		if(bean !=null && bean.getMemberId()!=null) {
			boolean result=expendRecordDAO.update(bean);
			return result;
		}		
		return false;
	}
}
