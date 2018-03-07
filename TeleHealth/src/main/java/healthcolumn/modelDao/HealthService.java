package healthcolumn.modelDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import healthcolumn.model.HealthColumnBean;

@Service
@Transactional
public class HealthService {
	@Autowired
	 private HealthColumnDAO healthColumnDAO;
	//選取頁面
	public List<HealthColumnBean> Loadpage(String advisoryCode) {
		List<HealthColumnBean> list = healthColumnDAO.selectbycode(advisoryCode);	
		return list;	
	}
	//選取文章
	public List<Object[]> Loadtitle(String title) {
		List<Object[]> list = healthColumnDAO.selectbytitle(title);	
		return list;	
	}
	//選取醫生文章
	public List<HealthColumnBean> Doctorpublish(String empId)
	{
		List<HealthColumnBean> Doccontext = healthColumnDAO.select(empId);
		return Doccontext;		
	}
	//選取熱門文章
	public List<HealthColumnBean> Hotcontext() {
		List<HealthColumnBean> Hotcontext = healthColumnDAO.selectTop();
		return Hotcontext;		
	};
	//刪除文章
	public  boolean Delete(String columnId) {
		 boolean deleetecon = healthColumnDAO.delete(columnId);
		return deleetecon;
	}
	public boolean Insert(HealthColumnBean bean) {
		HealthColumnBean Insertcontext = healthColumnDAO.insert(bean);
		if(Insertcontext!=null) {
			return true;
		}
		return false;
	}
	//點擊率
	public void count(String title) {
		healthColumnDAO.count(title);
	}
	public boolean updatecontent(String title,String content,String advisoryCode,String fileName) {
		healthColumnDAO.update(title, content, advisoryCode, fileName);
		return true;
	}
	
}
