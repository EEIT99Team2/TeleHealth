package healthpassport.model.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import healthpassport.model.BMIBean;

@Repository
public class BMIDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public BMIBean insert(BMIBean bean) {
		this.getSession().save(bean);
		return bean;
	}
	String memid = "select *from BMIRecords where memberid = ? order by createTime desc";
	public List<BMIBean> selectMemberId(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(memid);
		query.setParameter(1,memberid);
		query.addEntity(BMIBean.class);
		List<BMIBean> data = (List<BMIBean>) query.list();
		return data;
	}
	String newOne = "select TOP (1) * from BMIRecords where memberid =? order by createTime desc ";
	public BMIBean topOneData(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(newOne);
		query.setParameter(1,memberid);
		query.addEntity(BMIBean.class);
		BMIBean data = (BMIBean) query.uniqueResult();
		return data;
	}
	//7天
	String sevenday="select * from BMIRecords where memberid = ? and createTime between ? and ? order by createTime desc";
	public List<BMIBean> sevenData(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(sevenday);		
		int days = 7;
		Date date = new Date();
		long res = (date.getTime()-(days*24*60*60*1000));			
		java.util.Date dt = new Date(res);	 		
		query.setParameter(1,memberid);
		query.setParameter(2,dt);
		query.setParameter(3,date);
		query.addEntity(BMIBean.class);
		List<BMIBean> data = (List<BMIBean>) query.list();
		return data;
	}		
	//30天
	String thirtyday="select * from BMIRecords where memberid = ? and createTime between ? and ? order by createTime desc";
	public List<BMIBean> thirtyData(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(sevenday);		
		int days = 30;
		Date date = new Date();
		long res = (date.getTime()-(days*24*60*60*1000));			
		java.util.Date dt = new Date(res);	 		
		query.setParameter(1,memberid);
		query.setParameter(2,dt);
		query.setParameter(3,date);
		query.addEntity(BMIBean.class);
		List<BMIBean> data = (List<BMIBean>) query.list();
		return data;
	}
	//180天
		String thrmonthday="select * from BMIRecords where memberid = ? and createTime between ? and ? order by createTime desc";
		public List<BMIBean> thrmonthData(String memberid) {
			NativeQuery query = this.getSession().createNativeQuery(sevenday);		
			int days = 180;
			Date date = new Date();
			long res = (date.getTime()-(days*24*60*60*1000));			
			java.util.Date dt = new Date(res);	 		
			query.setParameter(1,memberid);
			query.setParameter(2,dt);
			query.setParameter(3,date);
			query.addEntity(BMIBean.class);
			List<BMIBean> data = (List<BMIBean>) query.list();
			return data;
		}		
}
