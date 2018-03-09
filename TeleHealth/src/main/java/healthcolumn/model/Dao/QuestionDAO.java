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
				("select emp.empName,mem.memName, que.Content,que.createTime,que.modifyTime,que.QAtype \r\n" + 
						"from question que\r\n" + 
						"   join healthColumn hel on hel.title=que.quetitle  \r\n" + 
						"  left outer  join employees emp on que.empId=emp.empId \r\n" + 
						"  left outer  join members mem on que.memberId=mem.memberId\r\n" + 
						" where hel.title=?");
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
			public QuestionBean updateMem(int Id,String memberId,String Content) {
			QuestionBean result = this.getSession().get(QuestionBean.class, Id);
			if(result!=null) {
				result.setId(Id);
				result.setMemberId(memberId);
				result.setModifyTime(new Date());				
				result.setContent(Content);}
			return result;
		}
		//修改員工po文		
			public QuestionBean updateEmp(int Id,String empId,String Content) {
			QuestionBean result = this.getSession().get(QuestionBean.class, Id);
			if(result!=null) {
				result.setId(Id);
				result.setEmpId(empId);
				result.setModifyTime(new Date());				
				result.setContent(Content);}
			return result;
		}	
			
		//刪除員工文章
		public boolean deleteMem(int Id,String memberId) {
			QuestionBean result = this.getSession().get(QuestionBean.class, memberId);
			if(result!=null) {
				this.getSession().delete(result);
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
}
