package dataAnalysis.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dataAnalysis.model.analysisRecordsBean;
import dataAnalysis.model.dataanalysisBean;


@Repository
public class analysisRecordsDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	String memberidData = "select * from analysisRecords where memberid=?";
	public List<analysisRecordsBean> MemberRecordshistory(String memberid){
		NativeQuery query =this.getSession().createNativeQuery(memberidData);
		query.setParameter(1,memberid);
		query.addEntity(analysisRecordsBean.class);
		List<analysisRecordsBean> data = (List<analysisRecordsBean>) query.list();
		System.out.println(data);
		return data;
	}
	String data1 ="select * from dataanalysis where groupid = '?'and gender = '?' and ? > minage and ? < maxage" ;
	public dataanalysisBean selectOne(String groupid,String gender,int age) {
		NativeQuery query =this.getSession().createNativeQuery(data1);
		query.setParameter(1,groupid);
		query.setParameter(2,gender);
		query.setParameter(3,age);
		query.setParameter(4,age);
		query.addEntity(dataanalysisBean.class);
		dataanalysisBean data = (dataanalysisBean) query.uniqueResult();
		return data; 
	}
	public analysisRecordsBean insert(analysisRecordsBean bean) {
		this.getSession().save(bean);
		return bean;
	}
}
