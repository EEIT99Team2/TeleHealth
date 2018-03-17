package healthpassport.model.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
	//7天
		String sevenday="select * from BloodSugarRecords where memberid = ? and createTime between ? and ? order by createTime desc";
		public List<BloodSugarBean> sevenData(String memberid) {
			NativeQuery query = this.getSession().createNativeQuery(sevenday);		
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date today = new Date();
			Calendar c = Calendar.getInstance(); 
			c.setTime(today); 
			c.add(Calendar.DATE, 1);
			today = c.getTime();
			String endDate = sdf.format(today);// 当前日期
			Calendar theCa = Calendar.getInstance();
			theCa.setTime(today);
			theCa.add(theCa.DATE, -6);// 最后一个数字30可改，30天的意思
			Date start = theCa.getTime();
			String startDate = sdf.format(start);// 三十天之前日期		
			query.setParameter(1, memberid);
			query.setParameter(2, startDate);
			query.setParameter(3, endDate);
			query.addEntity(BloodSugarBean.class);
			List<BloodSugarBean> data = (List<BloodSugarBean>) query.list();
			return data;
		}		
		//30天
		String thirtyday="select * from BloodSugarRecords where memberid = ? and createTime between ? and ? order by createTime desc";
		public List<BloodSugarBean> thirtyData(String memberid) {
			NativeQuery query = this.getSession().createNativeQuery(sevenday);		
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date today = new Date();
			Calendar c = Calendar.getInstance(); 
			c.setTime(today); 
			c.add(Calendar.DATE, 1);
			today = c.getTime();
			String endDate = sdf.format(today);// 当前日期
			Calendar theCa = Calendar.getInstance();
			theCa.setTime(today);
			theCa.add(theCa.DATE, -29);// 最后一个数字30可改，30天的意思
			Date start = theCa.getTime();
			String startDate = sdf.format(start);// 三十天之前日期		
			query.setParameter(1, memberid);
			query.setParameter(2, startDate);
			query.setParameter(3, endDate);
			query.addEntity(BloodSugarBean.class);
			List<BloodSugarBean> data = (List<BloodSugarBean>) query.list();
			return data;
		}
		//180天
			String thrmonthday="select * from BloodSugarRecords where memberid = ? and createTime between ? and ? order by createTime desc";
			public List<BloodSugarBean> thrmonthData(String memberid) {
				NativeQuery query = this.getSession().createNativeQuery(sevenday);		
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date today = new Date();
				Calendar c = Calendar.getInstance(); 
				c.setTime(today); 
				c.add(Calendar.DATE, 1);
				today = c.getTime();
				String endDate = sdf.format(today);// 当前日期
				Calendar theCa = Calendar.getInstance();
				theCa.setTime(today);
				theCa.add(theCa.DATE, -179);// 最后一个数字30可改，30天的意思
				Date start = theCa.getTime();
				String startDate = sdf.format(start);// 三十天之前日期		
				query.setParameter(1, memberid);
				query.setParameter(2, startDate);
				query.setParameter(3, endDate);
				query.addEntity(BloodSugarBean.class);
				List<BloodSugarBean> data = (List<BloodSugarBean>) query.list();
				return data;
			}		
	
}
