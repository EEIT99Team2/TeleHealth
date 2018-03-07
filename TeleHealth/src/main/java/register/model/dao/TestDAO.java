package register.model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import register.model.TestBean;

@Repository
public class TestDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public TestBean select(Integer id) {
		return this.getSession().get(TestBean.class, id);
	}
	
}
