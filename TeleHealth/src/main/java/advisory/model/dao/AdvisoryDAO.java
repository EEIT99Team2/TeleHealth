package advisory.model.dao;

import java.sql.Timestamp;
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
		String hql="SELECT ad.videoCode,ad.empId,ad.descrip,ad.advisoryTime,ad.viedoRecord,ad.satisfy,ad.createTime,ad.modifyTime,ad.status,emp.empName,car.careerName,adm.id,adt.advisoryName from Advisory ad\r\n" + 
				"  JOIN employees emp\r\n" + 
				"  ON ad.empId=emp.empId\r\n" + 
				"  JOIN advisoryMoment adm\r\n" + 
				"  ON adm.videoCode=ad.videoCode\r\n" + 
				"  JOIN advisoryType adt\r\n" + 
				"  ON adm.advisoryCode=adt.advisoryCode\r\n" + 
				"  JOIN careers as car On emp.career = car.careerid" +
				"  WHERE memberId=?";
		NativeQuery query = this.getSession().createNativeQuery(hql);
		query.setParameter(1,memberId);
		List<Object[]> result = (List<Object[]>)query.list();
		return result;
	};
	
	//透過員工id查詢
	public List<Object[]> selectByEmpId(String empId) {
		String hql = "SELECT ad.videoCode, ad.empId, ad.descrip, ad.advisoryTime, "
				+ "ad.viedoRecord, ad.satisfy, ad.createTime, ad.modifyTime, ad.status,"
				+ "emp.empName, car.careerName, adm.id, adt.advisoryName, mem.memberId, " 
				+ "mem.memName "
				+ "FROM Advisory AS ad "
				+ "INNER JOIN employees AS emp ON ad.empId = emp.empId "
				+ "INNER JOIN advisoryMoment AS adm ON adm.videoCode = ad.videoCode "
				+ "INNER JOIN advisoryType AS adt ON adm.advisoryCode = adt.advisoryCode "
				+ "INNER JOIN careers as car ON emp.career = car.careerid " 
				+ "INNER JOIN members as mem ON ad.memberId = mem.memberId " 
				+ "WHERE ad.empId=?";
		NativeQuery query = this.getSession().createNativeQuery(hql);
		query.setParameter(1,empId);
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
		String hql="UPDATE MemberBean SET point=point-5 WHERE memberId=?";
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
	
	public AdvisoryBean update(AdvisoryBean bean) {
		if(bean != null) {
			AdvisoryBean updateAdvisory = this.getSession().get(AdvisoryBean.class, bean.getVideoCode());
			if(updateAdvisory != null) {
				if(bean.getMemberId()!=null && bean.getMemberId().trim().length() > 0) {
					updateAdvisory.setMemberId(bean.getMemberId());
				}
				if(bean.getEmpId()!=null && bean.getEmpId().trim().length() > 0) {
					updateAdvisory.setEmpId(bean.getEmpId());
				}
				if(bean.getStatus()!=null && bean.getStatus().trim().length()>0) {
					updateAdvisory.setStatus(bean.getStatus());
				}
				if(bean.getAdvisoryTime()!=null) {
					updateAdvisory.setAdvisoryTime(bean.getAdvisoryTime());
				}
				if(bean.getSatisfy()!=null && bean.getSatisfy() > 0) {
					updateAdvisory.setSatisfy(bean.getSatisfy());
				}
				if(bean.getDescrip()!=null && bean.getDescrip().trim().length()>0) {
					updateAdvisory.setDescrip(bean.getDescrip().trim());
				}
				updateAdvisory.setModifyTime(new Timestamp(System.currentTimeMillis()));
			}
			return updateAdvisory;
		}
		return null;
	};

	public boolean delete(java.util.Date calendar, int timeInterval, String advisoryCode) {
		AdvisoryBean data = this.select(advisoryCode);
		if (data != null) {
			this.getSession().delete(data);
			return true;
		}
		return false;
	}
}
