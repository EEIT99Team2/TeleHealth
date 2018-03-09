package healthpassport.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import healthpassport.model.BMIBean;

@Repository
public class BMIDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public BMIBean insert(BMIBean bean) {
		this.getSession().save(bean);
		return bean;
	}
	String memid = "select *from BMIRecords where memberid = ?";
	public List<BMIBean> selectMemberId(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(memid);
		query.setParameter(1,memberid);
		query.addEntity(BMIBean.class);
		List<BMIBean> data = (List<BMIBean>) query.uniqueResult();
		return data;
	}
}
