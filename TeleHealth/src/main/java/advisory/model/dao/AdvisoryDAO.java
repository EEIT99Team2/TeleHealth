package advisory.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import advisory.model.AdvisoryBean;
import advisorymoment.model.AdvisoryMomentBean;

@Repository
public class AdvisoryDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		System.out.println("session=" + sessionFactory);
		return sessionFactory.getCurrentSession();
	}
	//透過預約代碼查詢
	public AdvisoryBean select(String videoCode) {
		Query<AdvisoryBean> query = this.getSession()
				.createQuery("from AdvisoryBean where videoCode=?", AdvisoryBean.class);
		query.setParameter(0, videoCode);
		AdvisoryBean result = query.uniqueResult();
		return result;
	};
	
	public AdvisoryBean insert(AdvisoryBean bean) {
		if (bean != null) {
			AdvisoryBean data = this.select(bean.getVideoCode());
			if (data == null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	};

//	public AdvisoryBean update(java.util.Date calendar, int timeInterval, String reserveStatus, String advisoryCode,
//			String empId, String videoCode) {
//		AdvisoryBean data = this.select(calendar, timeInterval, advisoryCode);
//		if (data != null) {
//			data.setCalendar(calendar);
//			data.setTimeInterval(timeInterval);
//			data.setReserveStatus(reserveStatus);
//			data.setAdvisoryCode(advisoryCode);
//			data.setEmpId(empId);
//			data.setVideoCode(videoCode);
//		}
//		return data;
//	};
//
//	public boolean delete(java.util.Date calendar, int timeInterval, String advisoryCode) {
//		AdvisoryBean data = this.select(calendar, timeInterval, advisoryCode);
//		if (data != null) {
//			this.getSession().delete(data);
//			return true;
//		}
//		return false;
//	}
}
