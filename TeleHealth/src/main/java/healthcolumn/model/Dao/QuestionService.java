package healthcolumn.model.Dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import healthcolumn.model.HealthColumnBean;
import healthcolumn.model.QuestionBean;

@Service
@Transactional
public class QuestionService {
	@Autowired
	 private QuestionDAO QuestionDAO;
	//選取文章回覆頁面
		public List<QuestionBean> loadresponse(String title) {
			 List<QuestionBean> list = QuestionDAO.selectresponse(title);
			 System.out.println(list);
			return list;	
		}
	//選取員工頁面
		public List<QuestionBean> loadEmp(String empId) {
			 List<QuestionBean> list = QuestionDAO.selectresponseEmp(empId);
			 System.out.println(list);
			return list;	
				}
	//選取會員頁面
		public List<QuestionBean> loadMem(String memId) {
			 List<QuestionBean> list = QuestionDAO.selectresponseMem(memId);
			 System.out.println(list);
			return list;	
			}			
	//新增文章
		public boolean insertQA(QuestionBean bean) {			
			QuestionBean Insertlist = QuestionDAO.insertQA(bean);
			if(Insertlist!=null) {
				return true;
			}
			return false;		
		}
	//刪除員工文章
	public  boolean deleteEmp(int Id,String empId) {
			 boolean deleetecon = QuestionDAO.deletEmp(Id, empId);
			return deleetecon;
	}
	//刪除會員
	public  boolean deleteMem(int Id,String memberId) {
		 boolean deleetecon = QuestionDAO.deleteMem(Id, memberId);
		return deleetecon;
}
	//選ID文章
	 public List<QuestionBean> loadtitleId(int Id) {
		List<QuestionBean> data = QuestionDAO.selectbyQAID(Id);
		return data;
	}
	//修改會員文章
	public boolean updateQA(int Id,String Content)	{		
		boolean update = QuestionDAO.updateQA(Id, Content);
		return update;
	}
	//選全部會員po文
	public List<Object[]> loadtotalcontent() {
		 List<Object[]> list = QuestionDAO.selectMempublish();		
		return list;	
		}
	//搜尋一位會員po文
	public List<Object[]> QAMemonepublish(String memname) {
		 List<Object[]> list = QuestionDAO.QAMemonepublish(memname);
		 System.out.println(list);
		 return list;	
		}
	
}
