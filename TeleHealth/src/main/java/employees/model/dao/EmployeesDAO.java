package employees.model.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import employees.model.EmployeesBean;
import register.model.MemberBean;

@Repository
@Transactional
public class EmployeesDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		System.out.println("session="+sessionFactory);
		return sessionFactory.getCurrentSession();
	}
	
	//增加員工預約次數
	public int addResCount(String empId){
		String hql="UPDATE EmployeesBean SET reserveCount=reserveCount+1 WHERE empId=?";
		Query<EmployeesBean> query=this.getSession().createQuery(hql);
		query.setParameter(0, empId);
		int result= query.executeUpdate();
		return result;
	}
	
	//增加員工請假次數
	public int addTakeoffCount(String empId){
		String hql="UPDATE EmployeesBean SET takeOff=takeOff+1 WHERE empId=?";
		Query<EmployeesBean> query=this.getSession().createQuery(hql);
		query.setParameter(0, empId);
		int result= query.executeUpdate();
		return result;
		}
	//驗證員工
	public EmployeesBean selectByAccount(String account) {			
		Query<EmployeesBean> list = this.getSession().createQuery("from EmployeesBean where account=?",EmployeesBean.class);
		list.setParameter(0, account);
		EmployeesBean result=list.uniqueResult();
		return result;
		}	
	}

