package healthcolumn.model.Dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import healthcolumn.model.QuestionBean;
@Repository
public class QuestionDAO {

	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	//選擇文章所有回應的文
	public List<QuestionBean>  selectresponse(String title) {
		NativeQuery query=this.getSession().createNativeQuery
				("select DISTINCT emp.empName,mem.memName,emp.account as empaccount,mem.account as memaccount,que.Content,que.createTime,que.modifyTime,que.QAtype,que.Id"+
						" from question que join healthColumn hel on hel.title=que.quetitle left outer  join employees emp"+
						 " on que.empId=emp.empId left outer join members mem on que.memberId=mem.memberId where hel.title=?");
		query.setParameter(1, title);
		List<QuestionBean> data=(List<QuestionBean>)query.list();
		return data;		
	}
	//選擇護理師文章所有回應的文
		public List<QuestionBean>  selectresponseEmp(String empId) {
			NativeQuery query=this.getSession().createNativeQuery
					("select * from question where empId=?");
			query.setParameter(1, empId);
			List<QuestionBean> data=(List<QuestionBean>)query.list();
			return data;		
		}
	//選擇會員文章所有回應的文
				public List<QuestionBean>  selectresponseMem(String memId) {
					NativeQuery query=this.getSession().createNativeQuery
						("select * from question  where memberId=?");
					query.setParameter(1, memId);
					List<QuestionBean> data=(List<QuestionBean>)query.list();
					return data;		
				}
		//增加	
		public QuestionBean insertQA(QuestionBean bean) {
			if(bean!=null) {
				QuestionBean temp =this.getSession().get(QuestionBean.class, bean.getId());
				if(temp==null) {
					this.getSession().save(bean);
					return bean;
				}
			}
			return null;
		}

		//修改會員po文		
			public boolean updateQA(int Id,String Content) {
			NativeQuery query=this.getSession().createNativeQuery
						("update question set Content=?, modifyTime=? where Id=?");
			query.setParameter(1,Content);
			query.setParameter(2, new Date());
			query.setParameter(3, Id);
			int result = query.executeUpdate();
			if(result!=0) {
				return true;
			}else
			{
				return false;
			}
			}
		
		
			
		//刪除員工文章
		public boolean deleteMem(int Id,String memberId) {
			NativeQuery query=this.getSession().createNativeQuery
					("delete from question where Id=? and memberId=?");			 
			query.setParameter(1,Id);
			query.setParameter(2, memberId);
			int result = query.executeUpdate();
			if(result!=0) {				
				return true;
			}
			return false;
		}
		//刪除會員文章
		public boolean deletEmp(int id,String EmpId) {
			QuestionBean result = this.getSession().get(QuestionBean.class, EmpId);
			if(result!=null) {
				this.getSession().delete(result);
				return true;
			}
			return false;
		}
		//選取修改文章
		public List<QuestionBean> selectbyQAID(int id)	{  
			NativeQuery query=this.getSession().createNativeQuery
		        ("select * from question where Id=?");
			query.setParameter(1,id);
			List<QuestionBean> data=(List<QuestionBean>)query.list();
			return data;			
		}
		//選全會員po文
		public List<Object[]> selectMempublish()	{  
			NativeQuery query=this.getSession().createNativeQuery
		        ("select mem.memName,que.quetitle,que.advisoryCode,que.Content,que.createTime from question que join members mem on que.memberId=mem.memberId ");
			List<Object[]> data=(List<Object[]>)query.list();			
			return data;			
		}
		public List<Object[]> QAMemonepublish(String memname)
		{
			NativeQuery query=this.getSession().createNativeQuery
			        ("select mem.memName,que.quetitle,que.advisoryCode,que.Content,que.createTime from question que join members mem on que.memberId=mem.memberId where mem.memName=?");
			query.setParameter(1,memname);	
			List<Object[]> data=(List<Object[]>)query.list();			
			return data;			
		}
		
}
