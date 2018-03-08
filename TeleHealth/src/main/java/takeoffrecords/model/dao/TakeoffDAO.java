package takeoffrecords.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import takeoffrecords.model.TakeoffBean;

@Repository
public class TakeoffDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		System.out.println("session=" + sessionFactory);
		return sessionFactory.getCurrentSession();
	}
	
	public TakeoffBean select(int id) {
		return this.getSession().get(TakeoffBean.class, id);
	}
	
	public List<TakeoffBean> select() {
		return this.getSession().createQuery(
				"from ProductBean", TakeoffBean.class).list();
	}

	public TakeoffBean insert(TakeoffBean bean) {
		if(bean!=null) {
			TakeoffBean temp =
					this.getSession().get(TakeoffBean.class, bean.getId());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	public TakeoffBean update(String name,
			double price, java.util.Date make, int expire, int id) {
		TakeoffBean result = this.getSession().get(TakeoffBean.class, id);
		if(result!=null) {

		}
		return result;
	}

	public boolean delete(int id) {
		TakeoffBean result = this.getSession().get(TakeoffBean.class, id);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
