package advisory.model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import advisory.model.AdvisoryBean;
import advisorymoment.model.AdvisoryMomentBean;
import register.model.MemberBean;

@Repository
@Transactional
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
	
	//透過會員id查詢
	public List<Object[]> selectByMemId(String memberId) {
		String hql="SELECT ad.videoCode,ad.empId,ad.descrip,ad.advisoryTime,ad.viedoRecord,ad.satisfy,ad.createTime,ad.modifyTime,ad.status,emp.empName,emp.career,adm.id,adt.advisoryName from Advisory ad\r\n" + 
				"  JOIN employees emp\r\n" + 
				"  ON ad.empId=emp.empId\r\n" + 
				"  JOIN advisoryMoment adm\r\n" + 
				"  ON adm.videoCode=ad.videoCode\r\n" + 
				"  JOIN advisoryType adt\r\n" + 
				"  ON adm.advisoryCode=adt.advisoryCode\r\n" + 
				"  WHERE memberId=?";
		NativeQuery query = this.getSession().createNativeQuery(hql);
		query.setParameter(1,memberId);
		List<Object[]> result = (List<Object[]>)query.list();
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

	//會員預約扣款
	public int updateMemPoint(String UserId) {
		String hql="UPDATE MemberBean SET point=point-50 WHERE memberId=?";
		Query<MemberBean> query = this.getSession().createQuery(hql);
		query.setParameter(0, UserId);
		int result= query.executeUpdate();
		return result;
	}
	//新增視訊紀錄
	public int insertadvisory(String memberId,String empId,String descrip,String videoCode) {
		String hql="update  Advisory  set memberId=?,empId=?,descrip=?,modifyTime=? where videoCode=?";
		Query<MemberBean> query = this.getSession().createQuery(hql);
		query.setParameter(0, memberId);
		query.setParameter(1, empId);
		query.setParameter(2, descrip);
		query.setParameter(3, new Date());
		query.setParameter(4, videoCode);
		int result= query.executeUpdate();
		return result;
	}
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
