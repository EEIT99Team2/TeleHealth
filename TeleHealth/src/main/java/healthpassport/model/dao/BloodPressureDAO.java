package healthpassport.model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import healthpassport.model.BloodPressureBean;

@Repository
public class BloodPressureDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public BloodPressureBean insert(BloodPressureBean bean) {
		this.getSession().save(bean);
		return bean;
	}
	
	
}
