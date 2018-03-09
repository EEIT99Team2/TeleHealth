package advisorymoment.model.dao;

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
				.createQuery("FROM AdvisoryMomentBean WHERE id=?", AdvisoryMomentBean.class);
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
				"WHERE am.advisoryCode=?";
		NativeQuery query = this.getSession().createNativeQuery(hql);
		query.setParameter(1,advisoryCode);
		List<Object[]> result = (List<Object[]>)query.list();
		System.out.println("DAO="+result);
		return result;
	};
	
	//搜尋全部時段(當index用)
	public List<Object[]> selectAll() {
		String hql="SELECT am.id,am.calendar,am.reserveStatus,adt.advisoryName,emp.empId,emp.empName,am.videoCode FROM AdvisoryMoment am \r\n"
				+"join Employees emp \r\n"
				+"on am.empId=emp.empId \r\n"
				+"join advisoryType adt \r\n"
				+"on am.advisoryCode=adt.advisoryCode";
		NativeQuery query= this.getSession().createNativeQuery(hql);
		List<Object[]> data = (List<Object[]>)query.list();		
		return data;
	};

	//會員自己已預約的時段
	public List<Object[]> selectByMemSelf(String UserId) {
		String hql="select am.id,am.calendar,am.reserveStatus,adt.advisoryName,emp.empId,emp.empName,a.videoCode from advisoryMoment am\r\n" + 
				"join Advisory a\r\n" + 
				"on am.videoCode=a.videoCode\r\n" + 
				"join employees emp\r\n" + 
				"on am.empId=emp.empId\r\n" + 
				"join advisoryType adt\r\n" + 
				"on am.advisoryCode=adt.advisoryCode\r\n" + 
				"WHERE memberId=?";
		NativeQuery query= this.getSession().createNativeQuery(hql);
		query.setParameter(1,UserId);
		List<Object[]> data = (List<Object[]>)query.list();		
		return data;
	};
	
	//以視訊代碼搜尋(會員取消預約時用)
	public List<Object[]> selectByMemVCode(String VideoCode) {
		String hql="SELECT videoCode,memberId,empId,descrip,advisoryTime,viedoRecord,satisfy,createTime,modifyTime FROM Advisory \r\n" + 
				"WHERE videoCode=?";
		NativeQuery query = this.getSession().createNativeQuery(hql);
		query.setParameter(1,VideoCode);
		List<Object[]> result = (List<Object[]>)query.list();
		System.out.println("DAO="+result);
		return result;
	};
	
	//諮詢人員自己負責的時段
		public List<Object[]> selectByEmpSelf(String EmpId) {
			String hql="SELECT am.id,am.calendar,am.reserveStatus,adt.advisoryName,emp.empId,emp.empName,am.videoCode FROM advisoryMoment am\r\n" + 
					"join employees emp\r\n" + 
					"on am.empId=emp.empId\r\n" + 
					"join advisoryType adt\r\n" + 
					"on am.advisoryCode=adt.advisoryCode\r\n" + 
					"WHERE am.empId=?";
			NativeQuery query= this.getSession().createNativeQuery(hql);
			query.setParameter(1,EmpId);
			List<Object[]> data = (List<Object[]>)query.list();		
			return data;
		};
	
	//會員預約，新增至諮詢記錄表(table:Advisory)
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

	//取消預約，同時將班表改為未預約狀態
	public boolean updateByResCancel(String id) {
		boolean result=false;
		AdvisoryMomentBean data = this.selectById(id);
		if (data != null) {
			data.setReserveStatus("E");
			data.setVideoCode(null);
			result=true;
		}
		return result;
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
	
	//刪除會員預約紀錄(table:Advisory)
	public boolean deleteMemReserve(String VideoCode) {
		if (VideoCode != null&&VideoCode.trim().length()!=0) {
			String hql="DELETE Advisory WHERE videoCode=?";
			NativeQuery query= this.getSession().createNativeQuery(hql);
			query.setParameter(1,VideoCode);
			return true;
		}
		return false;
	}
	
	public boolean delete(String id) {
		AdvisoryMomentBean data = this.selectById(id);
		if (data != null) {
			this.getSession().delete(data);
			return true;
		}
		return false;
	}
}
