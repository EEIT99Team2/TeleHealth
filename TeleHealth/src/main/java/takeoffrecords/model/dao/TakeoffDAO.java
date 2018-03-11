package takeoffrecords.model.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	
	//後台管理顯示(index用)
	public List<Object[]> selectAll() {
		String hql="SELECT tor.id,tor.advisoryMomentId,tor.empId,emp.empName,emp.career,tor.applicationType,tor.applicationTime,tor.applicationReason,adm.reserveStatus,adm.videoCode,tor.approvedResult,tor.approvedTime,tor.rejectReason,adm.status FROM takeoffRecords tor\r\n" + 
				"JOIN employees emp\r\n" + 
				"ON emp.empId=tor.empId\r\n" + 
				"JOIN advisoryMoment adm\r\n" + 
				"ON adm.id=tor.advisoryMomentId";
		NativeQuery query = this.getSession().createNativeQuery(hql);
		List<Object[]> data = (List<Object[]>)query.list();
		return data;
	}
	
	//新增員工申請假單
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
	
	//回覆請假申請
	public boolean updateApproved(String takeoffId,String apResult,String reason) {
		boolean upResult = false;
		TakeoffBean result = this.getSession().get(TakeoffBean.class, takeoffId);
		if(result!=null) {
			result.setApprovedResult(apResult);
			result.setApprovedTime(new Date());
			result.setRejectReason(reason);
			upResult = true;
		}
		return upResult;
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
