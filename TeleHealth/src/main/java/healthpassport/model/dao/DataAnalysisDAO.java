package healthpassport.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import healthpassport.model.DataAnalysisBean;


@Repository
public class DataAnalysisDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	public List<DataAnalysisBean> selectDataAll() {		
		return this.getSession().createQuery(
				"from DataAnalysisBean", DataAnalysisBean.class).list();
	}
	
	String a="select * from dataanalysis where groupid = ? and gender = ? and  ?>= minage and ? < maxage";
	public DataAnalysisBean selectGroupId(String groupid,String gender,Integer age) {
		NativeQuery query = this.getSession().createNativeQuery(a);
		query.setParameter(1,groupid);
		query.setParameter(2,gender);
		query.setParameter(3,age);
		query.setParameter(4,age);
		query.addEntity(DataAnalysisBean.class);
		DataAnalysisBean data = (DataAnalysisBean) query.uniqueResult();
		return data;
	}
	//17歲以下BMI
	String low = "select * from dataanalysis where groupid ='BMI' and gender = ? and minage=?";
	public DataAnalysisBean bmiLow17(String gender,Integer age) {
		NativeQuery query = this.getSession().createNativeQuery(low);
		query.setParameter(1,gender);
		query.setParameter(2,age);
		query.addEntity(DataAnalysisBean.class);
		DataAnalysisBean data = (DataAnalysisBean) query.uniqueResult();
		return data;
	}
	//18歲以上BMI
	String up ="select * from dataanalysis where groupId = 'BMI' and gender = ? and ?>= minAge and  ?<=maxage and ? >= minvalue and ? <=maxvalue";
	public DataAnalysisBean bmiUp18(String gender,Integer age,Double bmi) {
		NativeQuery query = this.getSession().createNativeQuery(up);
		query.setParameter(1,gender);
		query.setParameter(2,age);
		query.setParameter(3,age);
		query.setParameter(4,bmi);
		query.setParameter(5,bmi);
		query.addEntity(DataAnalysisBean.class);
		DataAnalysisBean data = (DataAnalysisBean) query.uniqueResult();
		return data;
	}
	//18歲以上BloobSugar
	String bs ="select * from dataanalysis where groupid ='BloodSugar' and gender = ? and  ?>= minage and ?< maxage and ?>=minvalue and ?<=maxvalue";
	public DataAnalysisBean bloodSugarUp18(String gender,Integer age,Double value) {
		NativeQuery query = this.getSession().createNativeQuery(up);
		query.setParameter(1,gender);
		query.setParameter(2,age);
		query.setParameter(3,age);
		query.setParameter(4,value);
		query.setParameter(5,value);
		query.addEntity(DataAnalysisBean.class);
		DataAnalysisBean data = (DataAnalysisBean) query.uniqueResult();
		return data;
	}
}
