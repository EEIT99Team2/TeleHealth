package healthpassport.model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import healthpassport.model.BloodSugarBean;

@Repository
public class BloodSugarDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public BloodSugarBean insert(BloodSugarBean bean) {
		this.getSession().save(bean);
		return bean;
	}
}
