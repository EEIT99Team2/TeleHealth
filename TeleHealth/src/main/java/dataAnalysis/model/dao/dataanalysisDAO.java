package dataAnalysis.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dataAnalysis.model.dataanalysisBean;


@Repository
public class dataanalysisDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	public List<dataanalysisBean> selectDataAll() {		
		return this.getSession().createQuery(
				"from dataanalysisBean", dataanalysisBean.class).list();
	}
	
}
