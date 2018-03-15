package healthpassport.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import healthpassport.model.BloodPressureBean;

@Repository
public class BloodPressureDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public BloodPressureBean insert(BloodPressureBean bean) {
		this.getSession().save(bean);
		return bean;
	}
	
	String memid = "select *from BloodPressureRecords where memberid = ? order by createTime desc";
	public List<BloodPressureBean> selectMemberId(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(memid);
		query.setParameter(1,memberid);
		query.addEntity(BloodPressureBean.class);
		List<BloodPressureBean> data = (List<BloodPressureBean>) query.list();
		return data;
	}
	
	String newOne = "select TOP (1) * from BloodPressureRecords where memberid =? order by createTime desc ";
	public BloodPressureBean topOneData(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(newOne);
		query.setParameter(1,memberid);
		query.addEntity(BloodPressureBean.class);
		BloodPressureBean data = (BloodPressureBean) query.uniqueResult();
		return data;
	}
}
