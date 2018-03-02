package Healthcolumn.modelDao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Healthcolumn.model.HealthColumnBean;

@Repository
public class HealthColumnDAO  {	
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	//選醫生發表過文章	
	public List<HealthColumnBean> select(String empId) {
		Query<HealthColumnBean> query=this.getSession().createNativeQuery("select * from healthColumn where empId=?",HealthColumnBean.class);
		query.setParameter(1,empId);
		List<HealthColumnBean> data=(List<HealthColumnBean>)query.list();
		return data;
				
		}
	//選專欄文章	
	public List<HealthColumnBean> selectbycode(String advisoryCode) {	
		NativeQuery query=this.getSession().createNativeQuery("select * from healthColumn where advisoryCode=?");
		query.setParameter(1, advisoryCode);
		query.addEntity(HealthColumnBean.class);
		List<HealthColumnBean> data=(List<HealthColumnBean>)query.list();
		return data;
	}
	//選出前5名
	public List<HealthColumnBean> selectTop(){
		NativeQuery query=this.getSession().createNativeQuery("select Top 15 * from healthColumn  order by clickCount desc ");
		query.addEntity(HealthColumnBean.class);
		List<HealthColumnBean> data=(List<HealthColumnBean>)query.list();
		return data;
	}
	
	//增加	
	public HealthColumnBean insert(HealthColumnBean bean) {
		if(bean!=null) {
			NativeQuery query=this.getSession().createNativeQuery("select title from healthColumn where title=? ");
			query.setParameter(1, bean.getTitle());	
			System.out.println(query.list());
			if(query.list().size()==0) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	//修改		
	
	public HealthColumnBean update(int columnId,String title, String content, Date createDate, String advisoryCode,
			byte[] videoContent, String empId,String fileName) {
		HealthColumnBean result = this.getSession().get(HealthColumnBean.class, columnId);
		if(result!=null) {
			result.setTitle(title);
			result.setContent(content);
			result.setCreateDate(createDate);
			result.setAdvisoryCode(advisoryCode);
			result.setEmpId(empId);
			
		}
		return result;
	}
	//刪除
	public boolean delete(int columnId) {
		HealthColumnBean result = this.getSession().get(HealthColumnBean.class, columnId);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}

}
