package takeoffrecords.model.dao;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import takeoffrecords.model.TakeoffBean;

@Repository
@Transactional
public class TakeoffDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		System.out.println("session=" + sessionFactory);
		return sessionFactory.getCurrentSession();
	}
	
	//透過班表id搜尋申請假單紀錄
	public TakeoffBean select(String MomentId) {
		Query<TakeoffBean> query = this.getSession()
				.createQuery("FROM TakeoffBean WHERE advisoryMomentId=?",TakeoffBean.class);
		query.setParameter(0, MomentId);
		TakeoffBean result = query.uniqueResult();
		return result;
	}
	
	public List<TakeoffBean> select() {
		return this.getSession().createQuery(
				"from TakeoffBean", TakeoffBean.class).list();
	}

	public boolean insert(TakeoffBean bean) {
		boolean result =false;
		if(bean!=null) {
			TakeoffBean temp =
					this.getSession().get(TakeoffBean.class, bean.getAdvisoryMomentId());
			if(temp==null) {
				this.getSession().save(bean);
				result = true;
				return result;
			}
		}
		return result;
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
