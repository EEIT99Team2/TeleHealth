package healthpassport.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	
}
