package healthcolumn.model.Dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import healthcolumn.model.HealthColumnBean;

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
		System.out.println(data);
		return data;
	}
	//選點擊的文章	
	public List<Object[]> selectbytitle(String title) {	
		NativeQuery query=this.getSession().createNativeQuery("select hel.title,emp.empName,hel.content,hel.createDate,hel.fileName,hel.advisoryCode from healthColumn hel join employees emp on hel.empId=emp.empId where hel.title=?");
		query.setParameter(1, title);		
		List<Object[]> data=(List<Object[]>)query.list();
		return  data;
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
	public boolean  update(String title, String content,String fileName) {
		NativeQuery query=this.getSession().createNativeQuery("update healthColumn set content=?, createDate=?, fileName=? where title=? ");
		query.setParameter(4, title);
		query.setParameter(1, content);
		query.setParameter(2, new Date());
		if (fileName!=null)
		{
			query.setParameter(3, fileName);
		}else {
			query.setParameter(3,"Null");
		}
		int result = query.executeUpdate();
		if(result!=0) {
			return true;
		}else {
			return false;
		}		
	}
	//刪除
	public boolean delete(String columnId) {
		HealthColumnBean result = this.getSession().get(HealthColumnBean.class, columnId);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
	public void count(String title) {
		NativeQuery query=this.getSession().createNativeQuery("update healthColumn set clickCount=clickCount+1 where title=? ");
		query.setParameter(1, title);
		int result = query.executeUpdate();	
	}
}
