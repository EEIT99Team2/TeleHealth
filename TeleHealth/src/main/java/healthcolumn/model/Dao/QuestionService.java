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
	//刪除文章
	public  boolean delete(int Id,String memberId) {
			 boolean deleetecon = QuestionDAO.delete(Id, memberId);
			return deleetecon;
	}
	//修改文章
	public boolean updateQA(int Id,String memberId,String advisorycode,String Content)
	{
		Date createDate = new Date();
		QuestionBean update = QuestionDAO.update(Id, memberId, createDate, advisorycode, Content);
		if(update!=null) {
			return true;
		}
		return false;
	}
		
}
