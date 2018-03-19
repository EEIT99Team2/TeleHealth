package expendRecord.model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import expendRecord.model.ExpendRecordBean;

@Repository
public class ExpendRecordDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public ExpendRecordBean selectOne(String memberId,String MomentId) {
		Query<ExpendRecordBean> query = this.getSession().createQuery("FROM ExpendRecordBean WHERE memberId=? AND advisoryMomentId=?",ExpendRecordBean.class);
		query.setParameter(0, memberId);
		query.setParameter(1, MomentId);
		ExpendRecordBean result =query.uniqueResult();
	return result;
	}
	
	public List<ExpendRecordBean> selectByMemId(String memberId) {
			Query<ExpendRecordBean> query = this.getSession().createQuery("FROM ExpendRecordBean WHERE memberId=?",ExpendRecordBean.class);
			query.setParameter(0, memberId);
			List<ExpendRecordBean> result =query.list();
		return result;
	}
	
	public ExpendRecordBean insert(ExpendRecordBean bean) {
		if(bean!=null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}
	
	public boolean update(ExpendRecordBean bean) {
		ExpendRecordBean data =this.selectOne(bean.getMemberId(),bean.getAdvisoryMomentId());
		if(data!=null && data.getMemberId()!=null) {			
			data.setMemberId(bean.getMemberId());
			data.setRecord(bean.getRecord());
			data.setModifytime(new Date());
			data.setAdvisoryMomentId(bean.getAdvisoryMomentId());
			return true;
		}		
		return false;
	}
}
