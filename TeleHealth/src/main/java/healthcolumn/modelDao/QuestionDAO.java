package healthcolumn.modelDao;

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
//	select emp.empName,mem.memName, que.Content,que.createDate,que.QAtype from healthColumn hel join question que on hel.columnId=que.QAcolumnId  join employees emp on que.empId=emp.empId join members mem on que.memberId=mem.memberId where hel.title='dqwddqwd'
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	//選擇文章所有回應的文
	public List<QuestionBean>  select(String title) {
		NativeQuery query=this.getSession().createNativeQuery("select * from healthColumn where Id=");
		query.addEntity(QuestionBean.class);
		List<QuestionBean> data=(List<QuestionBean>)query.list();
		return data;		
	}
	//增加	
		public QuestionBean insert(QuestionBean bean) {
			if(bean!=null) {
				QuestionBean temp =this.getSession().get(QuestionBean.class, bean.getId());
				if(temp==null) {
					this.getSession().save(bean);
					return bean;
				}
			}
			return null;
		}

		//修改		
			public QuestionBean update(int Id,String memberId,Date createDate,String advisorycode,String Content) {
			QuestionBean result = this.getSession().get(QuestionBean.class, Id);
			if(result!=null) {
				result.setId(Id);
				result.setMemberId(memberId);
				result.setCreateDate(createDate);
				result.setAdvisorycode(advisorycode);
				result.setContent(Content);}
			return result;
		}
		//刪除
		public boolean delete(int Id,String memberId) {
			QuestionBean result = this.getSession().get(QuestionBean.class, memberId);
			if(result!=null) {
				this.getSession().delete(result);
				return true;
			}
			return false;
		}

}