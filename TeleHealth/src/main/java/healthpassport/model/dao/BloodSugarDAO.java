package healthpassport.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import healthpassport.model.BMIBean;
import healthpassport.model.BloodSugarBean;

@Repository
public class BloodSugarDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public BloodSugarBean insert(BloodSugarBean bean) {
		this.getSession().save(bean);
		return bean;
	}
	
	String memid = "select *from BloodSugarRecords where memberid = ? order by createTime desc";
	public List<BloodSugarBean> selectMemberId(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(memid);
		query.setParameter(1,memberid);
		query.addEntity(BloodSugarBean.class);
		List<BloodSugarBean> data = (List<BloodSugarBean>) query.list();
		return data;
	}
	
	String newOne = "select TOP (1) * from BloodSugarRecords where memberid =? order by createTime desc ";
	public BloodSugarBean topOneData(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(newOne);
		query.setParameter(1,memberid);
		query.addEntity(BloodSugarBean.class);
		BloodSugarBean data = (BloodSugarBean) query.uniqueResult();
		return data;
	}
	
}
