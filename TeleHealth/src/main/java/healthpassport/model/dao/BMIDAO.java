package healthpassport.model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
}
