package advisoryMoment.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import advisoryMoment.model.AdvisoryMomentBean;

@Repository
public class AdvisoryDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		System.out.println("session=" + sessionFactory);
		return sessionFactory.getCurrentSession();
	}
	//以日期、時段、科別代碼搜尋
	public AdvisoryMomentBean select(java.util.Date calendar, int timeInterval, String advisoryCode) {
		Query<AdvisoryMomentBean> query = this.getSession()
				.createQuery("from AdvisoryBean where calendar=? and timeInterval=? and advisoryCode=?", AdvisoryMomentBean.class);
		query.setParameter(0, calendar);
		query.setParameter(1, timeInterval);
		query.setParameter(2, advisoryCode);
		AdvisoryMomentBean result = query.uniqueResult();
		return result;
	};
	//以科別代碼搜尋
	public List<Object[]> select(String advisoryCode) {
		String hql="SELECT am.calendar,am.reserveStatus,adt.advisoryName,emp.empName FROM AdvisoryMoment am \r\n" + 
				"join Employees emp \r\n" + 
				"on am.empId=emp.empId\r\n" + 
				"join advisoryType adt\r\n" + 
				"on am.advisoryCode=adt.advisoryCode\r\n" + 
				"where am.advisoryCode=?";
		NativeQuery query = this.getSession().createNativeQuery(hql);
		query.setParameter(1,advisoryCode);
		List<Object[]> result = (List<Object[]>)query.list();
		System.out.println("DAO="+result);
		return result;
	};
	
	//搜尋全部時段(當index用)
	public List<Object[]> selectAll() {
		String hql="SELECT am.calendar,am.reserveStatus,adt.advisoryName,emp.empName FROM AdvisoryMoment am \r\n"
				+"join Employees emp \r\n"
				+"on am.empId=emp.empId \r\n"
				+"join advisoryType adt \r\n"
				+"on am.advisoryCode=adt.advisoryCode";
		NativeQuery query= this.getSession().createNativeQuery(hql);
		List<Object[]> data = (List<Object[]>)query.list();		
//		Object[] array = data.get(0);
//		java.util.Date date = (java.util.Date) array[0];
//		String status = (String) array[1].toString();
//		String adCode = (String) array[2].toString();
//		String empname = (String) array[3].toString();
//		System.out.println(date+";;"+status+";;"+adCode+";;"+empname);
		return data;
	};

	public AdvisoryMomentBean insert(AdvisoryMomentBean bean) {
		if (bean != null) {
			AdvisoryMomentBean data = this.select(bean.getCalendar(), bean.getTimeInterval(), bean.getAdvisoryCode());
			if (data == null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	};

	public AdvisoryMomentBean update(java.util.Date calendar, int timeInterval, String reserveStatus, String advisoryCode,
			String empId, String videoCode) {
		AdvisoryMomentBean data = this.select(calendar, timeInterval, advisoryCode);
		if (data != null) {
			data.setCalendar(calendar);
			data.setTimeInterval(timeInterval);
			data.setReserveStatus(reserveStatus);
			data.setAdvisoryCode(advisoryCode);
			data.setEmpId(empId);
			data.setVideoCode(videoCode);
		}
		return data;
	};

	public boolean delete(java.util.Date calendar, int timeInterval, String advisoryCode) {
		AdvisoryMomentBean data = this.select(calendar, timeInterval, advisoryCode);
		if (data != null) {
			this.getSession().delete(data);
			return true;
		}
		return false;
	}
}
