package healthpassport.model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import healthpassport.model.BloodPressureRecordsBean;

@Repository
public class BloodPressureRecordsDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public BloodPressureRecordsBean insert(BloodPressureRecordsBean bean) {
		this.getSession().save(bean);
		return bean;
	}
	
	
}
