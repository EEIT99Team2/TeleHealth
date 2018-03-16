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
		query.setParameter(1, memberid);
		query.addEntity(BMIBean.class);
		List<BMIBean> data = (List<BMIBean>) query.list();
		return data;
	}

	String newOne = "select TOP (1) * from BMIRecords where memberid =? order by createTime desc ";
	public BMIBean topOneData(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(newOne);
		query.setParameter(1, memberid);
		query.addEntity(BMIBean.class);
		BMIBean data = (BMIBean) query.uniqueResult();
		return data;
	}

	// 7天
	String sevenday = "select * from BMIRecords where memberid = ? and createTime between ? and ? order by createTime desc";
	public List<BMIBean> sevenData(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(sevenday);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		Calendar c = Calendar.getInstance(); 
		c.setTime(today); 
		c.add(Calendar.DATE, 1);
		today = c.getTime();
		String endDate = sdf.format(today);// 当前日期		
		System.out.println(endDate);
		// 获取三十天前日期
		Calendar theCa = Calendar.getInstance();
		theCa.setTime(today);		
		theCa.add(theCa.DATE, -6);// 最后一个数字7可改，7天的意思
		Date start = theCa.getTime();
		String startDate = sdf.format(start);// 三十天之前日期			
		query.setParameter(1, memberid);
		query.setParameter(2, startDate);
		query.setParameter(3, endDate);
		query.addEntity(BMIBean.class);
		List<BMIBean> data = (List<BMIBean>) query.list();		
		return data;
	}

	// 30天
	String thirtyday = "select * from BMIRecords where memberid = ? and createTime between ? and ? order by createTime desc";

	public List<BMIBean> thirtyData(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(sevenday);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String endDate = sdf.format(today);// 当前日期
		// 获取三十天前日期
		Calendar theCa = Calendar.getInstance();
		theCa.setTime(today);
		theCa.add(theCa.DATE, -30);// 最后一个数字30可改，30天的意思
		Date start = theCa.getTime();
		String startDate = sdf.format(start);// 三十天之前日期
		System.out.println(startDate+"  "+endDate);
		query.setParameter(1, memberid);
		query.setParameter(2, startDate);
		query.setParameter(3, endDate);
		query.addEntity(BMIBean.class);
		List<BMIBean> data = (List<BMIBean>) query.list();
		return data;
	}

	// 180天
	String thrmonthday = "select * from BMIRecords where memberid = ? and createTime between ? and ? order by createTime desc";
	public List<BMIBean> thrmonthData(String memberid) {
		NativeQuery query = this.getSession().createNativeQuery(sevenday);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String endDate = sdf.format(today);// 当前日期
		// 获取三十天前日期
		Calendar theCa = Calendar.getInstance();
		theCa.setTime(today);
		theCa.add(theCa.DATE, -180);// 最后一个数字30可改，30天的意思
		Date start = theCa.getTime();
		String startDate = sdf.format(start);// 三十天之前日期
		System.out.println(startDate+"  "+endDate);
		query.setParameter(1, memberid);
		query.setParameter(2, startDate);
		query.setParameter(3, endDate);
		query.addEntity(BMIBean.class);
		List<BMIBean> data = (List<BMIBean>) query.list();
		return data;
	}
}
