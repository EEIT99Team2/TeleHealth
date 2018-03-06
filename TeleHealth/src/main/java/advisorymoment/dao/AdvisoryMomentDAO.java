package advisorymoment.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import advisorymoment.model.AdvisoryMomentBean;

@Repository
public class AdvisoryMomentDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		System.out.println("session=" + sessionFactory);
		return sessionFactory.getCurrentSession();
	}
	//以id搜尋
	public AdvisoryMomentBean selectById(String id) {
		Query<AdvisoryMomentBean> query = this.getSession()
				.createQuery("from AdvisoryMomentBean where id=?", AdvisoryMomentBean.class);
		query.setParameter(0, id);
		AdvisoryMomentBean result = query.uniqueResult();
		return result;
	};
	//以科別代碼搜尋
	public List<Object[]> select(String advisoryCode) {
		String hql="SELECT am.id,am.calendar,am.reserveStatus,adt.advisoryName,emp.empId,emp.empName FROM AdvisoryMoment am \r\n" + 
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
		String hql="SELECT am.id,am.calendar,am.reserveStatus,adt.advisoryName,emp.empId,emp.empName FROM AdvisoryMoment am \r\n"
				+"join Employees emp \r\n"
				+"on am.empId=emp.empId \r\n"
				+"join advisoryType adt \r\n"
				+"on am.advisoryCode=adt.advisoryCode";
		NativeQuery query= this.getSession().createNativeQuery(hql);
		List<Object[]> data = (List<Object[]>)query.list();		
		return data;
	};

	//會員自己已預約的時段
	public List<Object[]> selectBySelf(String UserId) {
		String hql="select am.id,am.calendar,am.reserveStatus,adt.advisoryName,emp.empId,emp.empName,a.videoCode from advisoryMoment am\r\n" + 
				"join Advisory a\r\n" + 
				"on am.videoCode=a.videoCode\r\n" + 
				"join employees emp\r\n" + 
				"on am.empId=emp.empId\r\n" + 
				"join advisoryType adt\r\n" + 
				"on am.advisoryCode=adt.advisoryCode\r\n" + 
				"where memberId=?";
		NativeQuery query= this.getSession().createNativeQuery(hql);
		query.setParameter(1,UserId);
		List<Object[]> data = (List<Object[]>)query.list();		
		return data;
	};
	
	public AdvisoryMomentBean insert(AdvisoryMomentBean bean) {
		if (bean != null) {
			AdvisoryMomentBean data = this.selectById(bean.getId());
			if (data == null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	};
	//會員預約時用
	public AdvisoryMomentBean updateByReserve(String id,String reserveStatus,String videoCode) {
		AdvisoryMomentBean data = this.selectById(id);
		if (data != null) {
			data.setReserveStatus(reserveStatus);
			data.setVideoCode(videoCode);
		}
		return data;
	};
	//修改班表時用
	public AdvisoryMomentBean updateByEdit(String id,java.util.Date calendar, String reserveStatus, String advisoryCode,
			String empId, String videoCode) {
		AdvisoryMomentBean data = this.selectById(id);
		if (data != null) {
			data.setCalendar(calendar);
			data.setReserveStatus(reserveStatus);
			data.setAdvisoryCode(advisoryCode);
			data.setEmpId(empId);
			data.setVideoCode(videoCode);
		}
		return data;
	};
	
	public boolean delete(String id) {
		AdvisoryMomentBean data = this.selectById(id);
		if (data != null) {
			this.getSession().delete(data);
			return true;
		}
		return false;
	}
}
