package healthpassport.model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import healthpassport.model.BMIBean;
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
	//7天
			String sevenday="select * from BloodPressureRecords where memberid = ? and createTime between ? and ? order by createTime desc";
			public List<BloodPressureBean> sevenData(String memberid) {
				NativeQuery query = this.getSession().createNativeQuery(sevenday);		
				int days = 7;
				Date date = new Date();
				long res = (date.getTime()-(days*24*60*60*1000));			
				java.util.Date dt = new Date(res);	 		
				query.setParameter(1,memberid);
				query.setParameter(2,dt);
				query.setParameter(3,date);
				query.addEntity(BMIBean.class);
				List<BloodPressureBean> data = (List<BloodPressureBean>) query.list();
				return data;
			}		
			//30天
			String thirtyday="select * from BloodPressureRecords where memberid = ? and createTime between ? and ? order by createTime desc";
			public List<BloodPressureBean> thirtyData(String memberid) {
				NativeQuery query = this.getSession().createNativeQuery(sevenday);		
				int days = 30;
				Date date = new Date();
				long res = (date.getTime()-(days*24*60*60*1000));			
				java.util.Date dt = new Date(res);	 		
				query.setParameter(1,memberid);
				query.setParameter(2,dt);
				query.setParameter(3,date);
				query.addEntity(BMIBean.class);
				List<BloodPressureBean> data = (List<BloodPressureBean>) query.list();
				return data;
			}
			//180天
				String thrmonthday="select * from BloodSugarRecords where memberid = ? and createTime between ? and ? order by createTime desc";
				public List<BloodPressureBean> thrmonthData(String memberid) {
					NativeQuery query = this.getSession().createNativeQuery(sevenday);		
					int days = 180;
					Date date = new Date();
					long res = (date.getTime()-(days*24*60*60*1000));			
					java.util.Date dt = new Date(res);	 		
					query.setParameter(1,memberid);
					query.setParameter(2,dt);
					query.setParameter(3,date);
					query.addEntity(BMIBean.class);
					List<BloodPressureBean> data = (List<BloodPressureBean>) query.list();
					return data;
				}		
}
